package com.example.zoo.service;

import com.example.zoo.dto.ProductDTO;
import com.example.zoo.entity.*;
import com.example.zoo.enums.ProductStatus;
import com.example.zoo.exception.InsufficientStockException;
import com.example.zoo.exception.ProductNotFoundException;
import com.example.zoo.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {

    private final ProductRepository productRepository;
    private final SubcategoryRepository subcategoryRepository;
    private final BrandRepository brandRepository;
    private final CategoryRepository categoryRepository;
    private final FileStorageService fileStorageService;

    @Transactional
    public Product save(Product product) {
        if (product.getStockQuantity() != null && product.getStockQuantity() <= 0) {
            product.setStatus(ProductStatus.SOLDOUT);
        } else if (product.getStatus() == ProductStatus.SOLDOUT && product.getStockQuantity() > 0) {
            product.setStatus(ProductStatus.ACTIVE);
        }

        // Zapewnienie, że waga i cena nie są nullami (zapobiega NullPointerException w widokach)
        if (product.getWeight() == null) product.setWeight(BigDecimal.ZERO);
        if (product.getPrice() == null) product.setPrice(BigDecimal.ZERO);

        return productRepository.save(product);
    }


    // DODAJ TE METODY DO SWOJEGO ProductService

    /**
     * Pobierz wszystkie produkty z danej kategorii
     */
    public List<Product> getProductsByCategoryId(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    /**
     * Pobierz wszystkie produkty z danej subkategorii
     */
    public List<Product> getProductsBySubcategoryId(Long subcategoryId) {
        return productRepository.findBySubcategoryId(subcategoryId);
    }

    /**
     * Pobierz wszystkie produkty danej marki
     */
    public List<Product> getProductsByBrand(Long brandId) {
        return productRepository.findByBrandId(brandId);
    }
    // ==================== METODY ISTNIEJĄCE (zachowane) ====================

    public Product getProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + id));
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Page<Product> getProductsByCategory(Category category, Brand brand,
                                               BigDecimal minPrice,
                                               BigDecimal maxPrice,
                                               Pageable pageable) {
        return productRepository.findFilteredProducts(category, brand, minPrice, maxPrice, pageable);
    }

    public List<Product> getProductsByCategory(Category category) {
        return productRepository.findByCategory(category);
    }

    @Transactional
    public void reserveStock(Long productId, int quantity) {
        Product product = getProductById(productId);

        if (product.getStockQuantity() < quantity) {
            throw new InsufficientStockException(
                    product.getName(), quantity, product.getStockQuantity());
        }

        product.decreaseStock(quantity);
        productRepository.save(product);
    }

    @Transactional
    public void releaseStock(Long productId, int quantity) {
        Product product = getProductById(productId);
        product.increaseStock(quantity);
        productRepository.save(product);
    }

    @Transactional
    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public Map<Integer, Long> getRatingCountsForCategory(String slug) {
        List<Object[]> results = productRepository.countProductsByRatingForCategory(slug);

        return results.stream().collect(Collectors.toMap(
                row -> ((Number) row[0]).intValue(),
                row -> ((Number) row[1]).longValue()
        ));
    }

    public List<Map<String, Object>> getSubcategoryFilters(String parentSlug) {
        List<Object[]> results = productRepository.findSubcategoriesByCategorySlug(parentSlug);
        return results.stream().map(row -> {
            Map<String, Object> map = new HashMap<>();
            map.put("name", row[0]);
            map.put("count", ((Number) row[1]).longValue());
            map.put("slug", row[2]);
            return map;
        }).collect(Collectors.toList());
    }

    // ==================== NOWE METODY DLA PANELU ADMIN ====================

    /**
     * Pobierz wszystkie produkty z paginacją
     */
    public Page<Product> getAllProducts(Pageable pageable) {
        log.debug("Pobieranie wszystkich produktów, strona: {}", pageable.getPageNumber());
        return productRepository.findAll(pageable);
    }

    /**
     * Pobierz wszystkie aktywne produkty
     */
    public List<Product> getAllActiveProducts() {
        log.debug("Pobieranie wszystkich aktywnych produktów");
        return productRepository.findByStatus(ProductStatus.ACTIVE);
    }

    /**
     * Utwórz nowy produkt (dla panelu admin)
     */
    @Transactional
    public Product createProduct(ProductDTO dto) {
        log.info("Tworzenie nowego produktu: {}", dto.getName());

        validateProductDTO(dto);

        // 1. Sprawdzenie unikalności SKU
        if (dto.getSku() != null && productRepository.existsBySku(dto.getSku())) {
            throw new RuntimeException("Produkt z SKU '" + dto.getSku() + "' już istnieje");
        }

        // 2. Pobieranie relacji
        Subcategory subcategory = subcategoryRepository.findById(dto.getSubcategoryId())
                .orElseThrow(() -> new RuntimeException("Subkategoria nie znaleziona"));

        Brand brand = brandRepository.findById(dto.getBrandId())
                .orElseThrow(() -> new RuntimeException("Marka nie znaleziona"));

        // 3. Budowanie obiektu - NAPRAWIONO MAPOWANIE
        Product product = Product.builder()
                .name(dto.getName())
                .description(dto.getDescription())
                .price(dto.getPrice())
                .discountedPrice(dto.getDiscountedPrice())
                .stockQuantity(dto.getStockQuantity())
                // ZMIANA: .productStatus(dto.getStatus()) -> .status(dto.getStatus())
                .status(dto.getStatus())
                .subcategory(subcategory)
                .category(subcategory.getCategory())
                .brand(brand)
                .sku(dto.getSku())
                // ZMIANA: Jeśli zmieniliśmy pole w encji na BigDecimal, usuwamy .toString()
                .weight(dto.getWeight())
                .dimensions(dto.getDimensions())
                .build();

        // 4. Użycie ogólnej metody save (tej z logiką statusu SOLDOUT)
        return save(product);
    }

    /**
     * Aktualizuj produkt (dla panelu admin)
     */
    @Transactional
    public Product updateProduct(Long id, ProductDTO dto) {
        log.info("Aktualizacja produktu o ID: {}", id);

        Product product = getProductById(id);
        validateProductDTO(dto);

        // Sprawdź unikalność SKU (z wyłączeniem aktualnego produktu)
        if (dto.getSku() != null && !dto.getSku().equals(product.getSku())) {
            if (productRepository.existsBySku(dto.getSku())) {
                throw new RuntimeException("Produkt z SKU '" + dto.getSku() + "' już istnieje");
            }
        }

        Subcategory subcategory = subcategoryRepository.findById(dto.getSubcategoryId())
                .orElseThrow(() -> new RuntimeException("Subkategoria nie znaleziona"));

        Brand brand = brandRepository.findById(dto.getBrandId())
                .orElseThrow(() -> new RuntimeException("Marka nie znaleziona"));

        // Aktualizuj pola
        product.setName(dto.getName());
        product.setDescription(dto.getDescription());
        product.setPrice(dto.getPrice());
        product.setDiscountedPrice(dto.getDiscountedPrice());
        product.setStockQuantity(dto.getStockQuantity());
        product.setStatus(dto.getStatus());
        product.setSubcategory(subcategory);
        product.setCategory(subcategory.getCategory());
        product.setBrand(brand);
        product.setSku(dto.getSku());
        product.setWeight(dto.getWeight() != null ? dto.getWeight() : null);
        product.setDimensions(dto.getDimensions());

        Product updated = productRepository.save(product);
        log.info("Zaktualizowano produkt o ID: {}", id);

        return updated;
    }

    /**
     * Usuń produkt
     */
    @Transactional
    public void deleteProduct(Long id) {
        log.info("Usuwanie produktu o ID: {}", id);

        Product product = getProductById(id);

        // Sprawdź czy produkt nie jest w zamówieniach
        if (productRepository.isProductInOrders(id)) {
            throw new RuntimeException(
                    "Nie można usunąć produktu, który był już zamówiony. " +
                            "Możesz zmienić jego status na DISCONTINUED."
            );
        }

        // Usuń powiązane obrazy
        if (product.getImages() != null) {
            product.getImages().forEach(image -> {
                try {
                    fileStorageService.deleteFile(image.getImageUrl());
                } catch (Exception e) {
                    log.warn("Nie udało się usunąć obrazu: {}", image.getImageUrl(), e);
                }
            });
        }

        productRepository.delete(product);
        log.info("Usunięto produkt o ID: {}", id);
    }

    // ==================== WYSZUKIWANIE I FILTROWANIE ====================

    /**
     * Wyszukaj produkty
     */
    public Page<Product> searchProducts(String query, Pageable pageable) {
        return productRepository.searchProducts(query, null, null, null, false, pageable);
    }

    /**
     * Filtruj produkty (dla panelu admin)
     */
    public Page<Product> filterProducts(
            Long categoryId,
            Long subcategoryId,
            Long brandId,
            ProductStatus status,
            Pageable pageable) {

        log.debug("Filtrowanie produktów - kategoria: {}, subkategoria: {}, marka: {}, status: {}",
                categoryId, subcategoryId, brandId, status);

        return productRepository.filterProducts(categoryId, subcategoryId, brandId, status, pageable);
    }

//    /**
//     * Pobierz produkty według kategorii z paginacją
//     */
//    public Page<Product> getProductsByCategory(Long categoryId, Pageable pageable) {
//        return productRepository.findByCategoryId(categoryId, pageable);
//    }
//
//    /**
//     * Pobierz produkty według subkategorii z paginacją
//     */
//    public Page<Product> getProductsBySubcategory(Long subcategoryId, Pageable pageable) {
//        return productRepository.findBySubcategoryId(subcategoryId, pageable);
//    }
//
//    /**
//     * Pobierz produkty według marki z paginacją
//     */
//    public Page<Product> getProductsByBrand(Long brandId, Pageable pageable) {
//        return productRepository.findByBrandId(brandId, pageable);
//    }

    /**
     * Pobierz produkty z niskim stanem magazynowym
     */
    public List<Product> getLowStockProducts(int limit) {
        return productRepository.findLowStockProducts(PageRequest.of(0, limit));
    }

    /**
     * Pobierz produkty bez stanu magazynowego
     */
    public List<Product> getOutOfStockProducts() {
        return productRepository.findByStockQuantity(0);
    }

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz wszystkie produkty
     */
    public long getTotalProductsCount() {
        return productRepository.count();
    }

    /**
     * Zlicz aktywne produkty
     */
    public long getActiveProductsCount() {
        return productRepository.countByStatus(ProductStatus.ACTIVE);
    }

    /**
     * Zlicz produkty z niskim stanem
     */
    public long getLowStockProductsCount() {
        return productRepository.countLowStockProducts();
    }

    /**
     * Zlicz produkty bez stanu
     */
    public long getOutOfStockProductsCount() {
        return productRepository.countByStockQuantity(0);
    }

//    /**
//     * Pobierz najpopularniejsze produkty
//     */
//    public List<Product> getTopRatedProducts(int limit) {
//        return productRepository.findTopRatedProducts(PageRequest.of(0, limit));
//    }
//
//    /**
//     * Pobierz najnowsze produkty
//     */
//    public List<Product> getNewestProducts(int limit) {
//        return productRepository.findAll(
//                PageRequest.of(0, limit, Sort.by(Sort.Direction.DESC, "createdAt"))
//        ).getContent();
//    }

    // ==================== ZARZĄDZANIE STATUSEM ====================

    /**
     * Zmień status produktu
     */
    @Transactional
    public void changeStatus(Long id, ProductStatus status) {
        Product product = getProductById(id);
        product.setStatus(status);
        productRepository.save(product);
        log.info("Zmieniono status produktu {} na: {}", id, status);
    }

    /**
     * Aktywuj produkt
     */
    @Transactional
    public void activateProduct(Long id) {
        changeStatus(id, ProductStatus.ACTIVE);
    }


    // ==================== ZARZĄDZANIE STANEM MAGAZYNOWYM ====================

    /**
     * Szybka aktualizacja ceny i stanu magazynowego (AJAX)
     */
    @Transactional
    public void quickUpdate(Long id, BigDecimal price, BigDecimal discountedPrice, Integer stockQuantity) {
        Product product = getProductById(id);

        if (price != null) {
            product.setPrice(price);
        }

        if (discountedPrice != null) {
            product.setDiscountedPrice(discountedPrice);
        }

        if (stockQuantity != null) {
            int oldStock = product.getStockQuantity();
            product.setStockQuantity(stockQuantity);

            // Automatyczna zmiana statusu
            if (oldStock == 0 && stockQuantity > 0) {
                product.setStatus(ProductStatus.ACTIVE);
            } else if (stockQuantity == 0) {
                product.setStatus(ProductStatus.SOLDOUT);
            }
        }

        productRepository.save(product);
        log.info("Szybka aktualizacja produktu {}", id);
    }

    /**
     * Zwiększ stan magazynowy
     */
    @Transactional
    public void increaseStock(Long id, int quantity) {
        Product product = getProductById(id);
        product.increaseStock(quantity);
        productRepository.save(product);
        log.info("Zwiększono stan produktu {} o {}", id, quantity);
    }

    /**
     * Zmniejsz stan magazynowy
     */
    @Transactional
    public void decreaseStock(Long id, int quantity) {
        Product product = getProductById(id);
        product.decreaseStock(quantity);
        productRepository.save(product);
        log.info("Zmniejszono stan produktu {} o {}", id, quantity);
    }

    /**
     * Ustaw stan magazynowy
     */
    @Transactional
    public void setStock(Long id, int quantity) {
        Product product = getProductById(id);
        product.setStockQuantity(quantity);

        // Automatyczna zmiana statusu
        if (quantity == 0) {
            product.setStatus(ProductStatus.SOLDOUT);
        } else if (product.getStatus() == ProductStatus.SOLDOUT) {
            product.setStatus(ProductStatus.ACTIVE);
        }

        productRepository.save(product);
        log.info("Ustawiono stan produktu {} na {}", id, quantity);
    }

    // ==================== EKSPORT ====================

    /**
     * Eksportuj produkty do CSV
     */
    public String exportToCSV(
            String search,
            Long categoryId,
            Long subcategoryId,
            Long brandId,
            ProductStatus status) {

        log.info("Eksportowanie produktów do CSV");

        // TODO: Implementacja eksportu CSV
        // Pobierz produkty według filtrów
        // Generuj CSV
        // Zapisz do pliku
        // Zwróć nazwę pliku

        return "products_export_" + System.currentTimeMillis() + ".csv";
    }

    // ==================== WALIDACJA ====================

    /**
     * Waliduj DTO produktu
     */
    private void validateProductDTO(ProductDTO dto) {
        if (dto.getPrice() == null || dto.getPrice().compareTo(BigDecimal.ZERO) <= 0) {
            throw new RuntimeException("Cena musi być większa od 0");
        }

        if (dto.getDiscountedPrice() != null &&
                dto.getDiscountedPrice().compareTo(dto.getPrice()) >= 0) {
            throw new RuntimeException("Cena promocyjna musi być niższa niż cena regularna");
        }

        if (dto.getStockQuantity() == null || dto.getStockQuantity() < 0) {
            throw new RuntimeException("Stan magazynowy nie może być ujemny");
        }
    }

    // ==================== PROMOCJE ====================

//    /**
//     * Pobierz produkty z aktywną promocją
//     */
//    public List<Product> getProductsWithActivePromotions() {
//        return productRepository.findProductsWithActivePromotions(LocalDateTime.now());
//    }
//
//    /**
//     * Pobierz produkty w promocji
//     */
//    public Page<Product> getPromotionalProducts(Pageable pageable) {
//        return productRepository.findPromotionalProducts(pageable);
//    }
//
//    // ==================== REKOMENDACJE ====================
//
//    /**
//     * Pobierz podobne produkty
//     */
//    public List<Product> getSimilarProducts(Long productId, int limit) {
//        Product product = getProductById(productId);
//        return productRepository.findSimilarProducts(
//                product.getSubcategory().getId(),
//                product.getBrand().getId(),
//                productId,
//                PageRequest.of(0, limit)
//        );
//    }
//
//    /**
//     * Pobierz produkty często kupowane razem
//     */
//    public List<Product> getFrequentlyBoughtTogether(Long productId, int limit) {
//        return productRepository.findFrequentlyBoughtTogether(productId, PageRequest.of(0, limit));
//    }
}