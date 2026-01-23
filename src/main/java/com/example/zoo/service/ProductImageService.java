package com.example.zoo.service;

import com.example.zoo.entity.Product;
import com.example.zoo.entity.ProductImage;
import com.example.zoo.repository.ProductImageRepository;
import com.example.zoo.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductImageService {

    private final ProductImageRepository productImageRepository;
    private final ProductRepository productRepository;
    private final FileStorageService fileStorageService;

    // ==================== CRUD OPERATIONS ====================

    /**
     * Pobierz wszystkie obrazy produktu
     */
    public List<ProductImage> getProductImages(Long productId) {
        log.debug("Pobieranie obrazów dla produktu: {}", productId);
        return productImageRepository.findByProductIdOrderByDisplayOrderAsc(productId);
    }

    /**
     * Pobierz obraz po ID
     */
    public ProductImage getImageById(Long imageId) {
        return productImageRepository.findById(imageId)
                .orElseThrow(() -> new RuntimeException("Obraz o ID " + imageId + " nie został znaleziony"));
    }

    /**
     * Dodaj obraz do produktu
     */
    @Transactional
    public ProductImage addImage(Long productId, MultipartFile imageFile) throws IOException {
        log.info("Dodawanie obrazu do produktu: {}", productId);

        // Walidacja pliku
        if (imageFile == null || imageFile.isEmpty()) {
            throw new RuntimeException("Plik obrazu jest pusty");
        }

        if (!fileStorageService.isValidImageFile(imageFile)) {
            throw new RuntimeException("Nieprawidłowy format pliku. Obsługiwane formaty: JPG, PNG, GIF, WEBP");
        }

        // Maksymalny rozmiar: 5MB
        long maxSize = 5 * 1024 * 1024; // 5MB
        if (!fileStorageService.isValidFileSize(imageFile, maxSize)) {
            throw new RuntimeException("Plik jest za duży. Maksymalny rozmiar: 5MB");
        }

        // Pobierz produkt
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produkt nie znaleziony"));

        // Upload pliku
        String imageUrl = fileStorageService.storeFile(imageFile, "products");

        // Ustal kolejność wyświetlania
        int nextOrder = productImageRepository.getMaxDisplayOrder(productId).orElse(0) + 1;

        // Utwórz obiekt ProductImage
        ProductImage productImage = ProductImage.builder()
                .product(product)
                .imageUrl(imageUrl)
                .isMain(product.getImages().isEmpty()) // Pierwszy obraz = główny
                .displayOrder(nextOrder)
                .altText(product.getName())
                .title(product.getName())
                .mimeType(imageFile.getContentType())
                .fileSize(imageFile.getSize())
                .build();

        ProductImage saved = productImageRepository.save(productImage);

        // Jeśli to pierwszy obraz, ustaw go też jako imageUrl w produkcie
        if (product.getImages().isEmpty() || product.getImageUrl() == null) {
            product.setImageUrl(imageUrl);
            productRepository.save(product);
        }

        log.info("Dodano obraz {} do produktu {}", saved.getId(), productId);
        return saved;
    }

    /**
     * Usuń obraz
     */
    @Transactional
    public void deleteImage(Long imageId) {
        log.info("Usuwanie obrazu: {}", imageId);

        ProductImage image = getImageById(imageId);
        Product product = image.getProduct();
        boolean wasMain = image.isMain();

        // Usuń plik z dysku
        try {
            fileStorageService.deleteFile(image.getImageUrl());
        } catch (Exception e) {
            log.warn("Nie udało się usunąć pliku: {}", image.getImageUrl(), e);
        }

        // Usuń z bazy
        productImageRepository.delete(image);

        // Jeśli usunięto główny obraz, ustaw nowy główny
        if (wasMain) {
            List<ProductImage> remainingImages = productImageRepository.findByProductIdOrderByDisplayOrderAsc(product.getId());
            if (!remainingImages.isEmpty()) {
                ProductImage newMain = remainingImages.get(0);
                newMain.setMain(true);
                productImageRepository.save(newMain);

                // Zaktualizuj imageUrl w produkcie
                product.setImageUrl(newMain.getImageUrl());
                productRepository.save(product);
            } else {
                // Brak obrazów - wyczyść imageUrl
                product.setImageUrl(null);
                productRepository.save(product);
            }
        }

        log.info("Usunięto obraz: {}", imageId);
    }

    /**
     * Ustaw obraz jako główny
     */
    @Transactional
    public void setMainImage(Long productId, Long imageId) {
        log.info("Ustawianie głównego obrazu {} dla produktu {}", imageId, productId);

        // Sprawdź czy obraz należy do produktu
        ProductImage image = getImageById(imageId);
        if (!image.getProduct().getId().equals(productId)) {
            throw new RuntimeException("Obraz nie należy do tego produktu");
        }

        // Usuń flagę głównego ze wszystkich obrazów produktu
        productImageRepository.clearMainFlag(productId);

        // Ustaw nowy główny obraz
        image.setMain(true);
        productImageRepository.save(image);

        // Zaktualizuj imageUrl w produkcie
        Product product = image.getProduct();
        product.setImageUrl(image.getImageUrl());
        productRepository.save(product);

        log.info("Ustawiono obraz {} jako główny dla produktu {}", imageId, productId);
    }

    /**
     * Zmień kolejność wyświetlania obrazu
     */
    @Transactional
    public void updateDisplayOrder(Long imageId, Integer newOrder) {
        ProductImage image = getImageById(imageId);
        image.setDisplayOrder(newOrder);
        productImageRepository.save(image);
        log.info("Zaktualizowano kolejność obrazu {}: {}", imageId, newOrder);
    }

    /**
     * Przesuń obraz w górę
     */
    @Transactional
    public void moveUp(Long imageId) {
        ProductImage image = getImageById(imageId);
        int currentOrder = image.getDisplayOrder();

        if (currentOrder > 1) {
            // Znajdź obraz o niższej kolejności
            productImageRepository.findByProductIdAndDisplayOrder(image.getProduct().getId(), currentOrder - 1)
                    .ifPresent(prevImage -> {
                        // Zamień kolejność
                        prevImage.setDisplayOrder(currentOrder);
                        image.setDisplayOrder(currentOrder - 1);
                        productImageRepository.save(prevImage);
                        productImageRepository.save(image);
                    });
        }
    }

    /**
     * Przesuń obraz w dół
     */
    @Transactional
    public void moveDown(Long imageId) {
        ProductImage image = getImageById(imageId);
        int currentOrder = image.getDisplayOrder();

        // Znajdź obraz o wyższej kolejności
        productImageRepository.findByProductIdAndDisplayOrder(image.getProduct().getId(), currentOrder + 1)
                .ifPresent(nextImage -> {
                    // Zamień kolejność
                    nextImage.setDisplayOrder(currentOrder);
                    image.setDisplayOrder(currentOrder + 1);
                    productImageRepository.save(nextImage);
                    productImageRepository.save(image);
                });
    }

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz obrazy produktu
     */
    public long countProductImages(Long productId) {
        return productImageRepository.countByProductId(productId);
    }

    /**
     * Pobierz główny obraz produktu
     */
    public ProductImage getMainImage(Long productId) {
        return productImageRepository.findByProductIdAndIsMainTrue(productId)
                .orElse(null);
    }

    // ==================== ZARZĄDZANIE METADANYMI ====================

    /**
     * Zaktualizuj tekst alternatywny
     */
    @Transactional
    public void updateAltText(Long imageId, String altText) {
        ProductImage image = getImageById(imageId);
        image.setAltText(altText);
        productImageRepository.save(image);
        log.info("Zaktualizowano alt text dla obrazu: {}", imageId);
    }

    /**
     * Zaktualizuj tytuł
     */
    @Transactional
    public void updateTitle(Long imageId, String title) {
        ProductImage image = getImageById(imageId);
        image.setTitle(title);
        productImageRepository.save(image);
        log.info("Zaktualizowano tytuł dla obrazu: {}", imageId);
    }

    // ==================== OPERACJE MASOWE ====================

    /**
     * Usuń wszystkie obrazy produktu
     */
    @Transactional
    public void deleteAllProductImages(Long productId) {
        log.info("Usuwanie wszystkich obrazów produktu: {}", productId);

        List<ProductImage> images = productImageRepository.findByProductIdOrderByDisplayOrderAsc(productId);

        for (ProductImage image : images) {
            try {
                fileStorageService.deleteFile(image.getImageUrl());
            } catch (Exception e) {
                log.warn("Nie udało się usunąć pliku: {}", image.getImageUrl(), e);
            }
        }

        productImageRepository.deleteByProductId(productId);

        // Wyczyść imageUrl w produkcie
        Product product = productRepository.findById(productId).orElse(null);
        if (product != null) {
            product.setImageUrl(null);
            productRepository.save(product);
        }

        log.info("Usunięto wszystkie obrazy produktu: {}", productId);
    }
}