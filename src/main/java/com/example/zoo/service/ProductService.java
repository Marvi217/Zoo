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

        if (product.getWeight() == null) product.setWeight(BigDecimal.ZERO);
        if (product.getPrice() == null) product.setPrice(BigDecimal.ZERO);

        return productRepository.save(product);
    }

    public List<Product> getProductsByCategoryId(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    public List<Product> getProductsBySubcategoryId(Long subcategoryId) {
        return productRepository.findBySubcategoryId(subcategoryId);
    }

    public List<Product> getProductsByBrand(Long brandId) {
        return productRepository.findByBrandId(brandId);
    }

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

    public Page<Product> getProductsByCategoryAdvanced(Category category,
                                                        List<Long> subcategoryIds,
                                                        List<Long> brandIds,
                                                        BigDecimal minPrice,
                                                        BigDecimal maxPrice,
                                                        Pageable pageable) {
        return productRepository.findFilteredProductsAdvanced(category, subcategoryIds, brandIds, minPrice, maxPrice, pageable);
    }

    public List<Map<String, Object>> getBrandsWithCountByCategory(Category category) {
        List<Object[]> results = productRepository.findBrandsWithCountByCategory(category);
        return results.stream().map(row -> {
            Map<String, Object> map = new HashMap<>();
            map.put("id", row[0]);
            map.put("name", row[1]);
            map.put("count", ((Number) row[2]).longValue());
            return map;
        }).collect(Collectors.toList());
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

    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public List<Product> getAllActiveProducts() {
        return productRepository.findByStatus(ProductStatus.ACTIVE);
    }

    @Transactional
    public Product createProduct(ProductDTO dto) {
        validateProductDTO(dto);
        if (dto.getSku() != null && productRepository.existsBySku(dto.getSku())) {
            throw new RuntimeException("Produkt z SKU '" + dto.getSku() + "' już istnieje");
        }

        Subcategory subcategory = subcategoryRepository.findById(dto.getSubcategoryId())
                .orElseThrow(() -> new RuntimeException("Subkategoria nie znaleziona"));

        Brand brand = brandRepository.findById(dto.getBrandId())
                .orElseThrow(() -> new RuntimeException("Marka nie znaleziona"));

        Product product = Product.builder()
                .name(dto.getName())
                .description(dto.getDescription())
                .price(dto.getPrice())
                .discountedPrice(dto.getDiscountedPrice())
                .stockQuantity(dto.getStockQuantity())
                .status(dto.getStatus())
                .subcategory(subcategory)
                .category(subcategory.getCategory())
                .brand(brand)
                .sku(dto.getSku())
                .weight(dto.getWeight())
                .dimensions(dto.getDimensions())
                .build();

        return save(product);
    }

    @Transactional
    public Product updateProduct(Long id, ProductDTO dto) {
        log.info("Aktualizacja produktu o ID: {}", id);

        Product product = getProductById(id);
        validateProductDTO(dto);

        if (dto.getSku() != null && !dto.getSku().equals(product.getSku())) {
            if (productRepository.existsBySku(dto.getSku())) {
                throw new RuntimeException("Produkt z SKU '" + dto.getSku() + "' już istnieje");
            }
        }

        Subcategory subcategory = subcategoryRepository.findById(dto.getSubcategoryId())
                .orElseThrow(() -> new RuntimeException("Subkategoria nie znaleziona"));

        Brand brand = brandRepository.findById(dto.getBrandId())
                .orElseThrow(() -> new RuntimeException("Marka nie znaleziona"));

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

        return productRepository.save(product);
    }

    @Transactional
    public void deleteProduct(Long id) {
        Product product = getProductById(id);

        if (productRepository.isProductInOrders(id)) {
            throw new RuntimeException(
                    "Nie można usunąć produktu, który był już zamówiony. " +
                            "Możesz zmienić jego status na DISCONTINUED."
            );
        }

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
    }

    public Page<Product> searchProducts(String query, Pageable pageable) {
        return productRepository.searchProducts(query, null, null, null, false, pageable);
    }

    public Page<Product> filterProducts(
            Long categoryId,
            Long subcategoryId,
            Long brandId,
            ProductStatus status,
            Pageable pageable) {

        return productRepository.filterProducts(categoryId, subcategoryId, brandId, status, pageable);
    }

    public List<Product> getLowStockProducts(int limit) {
        return productRepository.findLowStockProducts(PageRequest.of(0, limit));
    }

    public List<Product> getOutOfStockProducts() {
        return productRepository.findByStockQuantity(0);
    }

    public long getTotalProductsCount() {
        return productRepository.count();
    }

    public long getActiveProductsCount() {
        return productRepository.countByStatus(ProductStatus.ACTIVE);
    }

    public long getLowStockProductsCount() {
        return productRepository.countLowStockProducts();
    }

    public long getOutOfStockProductsCount() {
        return productRepository.countByStockQuantity(0);
    }

    @Transactional
    public void changeStatus(Long id, ProductStatus status) {
        Product product = getProductById(id);
        product.setStatus(status);
        productRepository.save(product);
    }

    @Transactional
    public void activateProduct(Long id) {
        changeStatus(id, ProductStatus.ACTIVE);
    }


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

            if (oldStock == 0 && stockQuantity > 0) {
                product.setStatus(ProductStatus.ACTIVE);
            } else if (stockQuantity == 0) {
                product.setStatus(ProductStatus.SOLDOUT);
            }
        }

        productRepository.save(product);
    }

    @Transactional
    public void increaseStock(Long id, int quantity) {
        Product product = getProductById(id);
        product.increaseStock(quantity);
        productRepository.save(product);
    }

    @Transactional
    public void decreaseStock(Long id, int quantity) {
        Product product = getProductById(id);
        product.decreaseStock(quantity);
        productRepository.save(product);
    }

    @Transactional
    public void setStock(Long id, int quantity) {
        Product product = getProductById(id);
        product.setStockQuantity(quantity);

        if (quantity == 0) {
            product.setStatus(ProductStatus.SOLDOUT);
        } else if (product.getStatus() == ProductStatus.SOLDOUT) {
            product.setStatus(ProductStatus.ACTIVE);
        }

        productRepository.save(product);
    }

    public String exportToCSV(
            String search,
            Long categoryId,
            Long subcategoryId,
            Long brandId,
            ProductStatus status) {
        return "products_export_" + System.currentTimeMillis() + ".csv";
    }

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

}