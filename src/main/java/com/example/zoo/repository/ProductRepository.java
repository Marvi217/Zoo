package com.example.zoo.repository;

import com.example.zoo.entity.Brand;
import com.example.zoo.entity.Category;
import com.example.zoo.entity.Product;
import com.example.zoo.enums.ProductStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    long countByCategory(Category category);

    @Query("SELECT p FROM Product p WHERE " +
            "(:query IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :query, '%'))) AND " +
            "(:categoryId IS NULL OR p.category.id = :categoryId) AND " +
            "(:minPrice IS NULL OR p.price >= :minPrice) AND " +
            "(:maxPrice IS NULL OR p.price <= :maxPrice) AND " +
            "(:availableOnly = false OR p.status = 'ACTIVE')")
    List<Product> searchProducts(
            @Param("query") String query,
            @Param("categoryId") Long categoryId,
            @Param("minPrice") BigDecimal minPrice,
            @Param("maxPrice") BigDecimal maxPrice,
            @Param("availableOnly") Boolean availableOnly
    );

    List<Product> findByCategoryId(Long categoryId);
    List<Product> findBySubcategoryId(Long subcategoryId);
    List<Product> findByBrandId(Long brandId);

    @Query("SELECT p FROM Product p WHERE p.stockQuantity > 0 AND p.stockQuantity <= 10 ORDER BY p.stockQuantity ASC")
    List<Product> findLowStockProducts(Pageable pageable);

    List<Product> findByStockQuantity(Integer stockQuantity);

    long countByStatus(ProductStatus status);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.stockQuantity > 0 AND p.stockQuantity <= 10")
    long countLowStockProducts();

    long countByStockQuantity(Integer stockQuantity);

    List<Product> findByNameContainingIgnoreCase(String name);

    Page<Product> findByCategoryId(Long categoryId, Pageable pageable);

    Page<Product> findBySubcategoryId(Long subcategoryId, Pageable pageable);

    Page<Product> findByBrandId(Long brandId, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE " +
            "(:categoryId IS NULL OR p.category.id = :categoryId) AND " +
            "(:subcategoryId IS NULL OR p.subcategory.id = :subcategoryId) AND " +
            "(:brandId IS NULL OR p.brand.id = :brandId) AND " +
            "(:status IS NULL OR p.status = :status)")
    Page<Product> filterProducts(
            @Param("categoryId") Long categoryId,
            @Param("subcategoryId") Long subcategoryId,
            @Param("brandId") Long brandId,
            @Param("status") ProductStatus status,
            Pageable pageable);

    @Query("SELECT COUNT(oi) > 0 FROM OrderItem oi WHERE oi.product.id = :productId")
    boolean isProductInOrders(@Param("productId") Long productId);

    Page<Product> findByCategory(Category category, Pageable pageable);
    List<Product> findByCategory(Category category);
    Page<Product> findByCategoryAndBrand(Category category, Brand brand, Pageable pageable);
    Page<Product> findByCategoryAndBrandAndPriceBetween(
            Category category, Brand brand, BigDecimal min, BigDecimal max, Pageable pageable);

    List<Product> findByStatus(ProductStatus status);
    boolean existsBySku(String sku);
    boolean existsBySkuAndIdNot(String sku, Long id);

    @Query("SELECT p FROM Product p WHERE " +
            "(p.subcategory.id = :subcategoryId OR p.brand.id = :brandId) " +
            "AND p.id != :currentProductId " +
            "AND p.status = 'ACTIVE' " +
            "ORDER BY p.rating DESC")
    List<Product> findSimilarProducts(
            @Param("subcategoryId") Long subcategoryId,
            @Param("brandId") Long brandId,
            @Param("currentProductId") Long currentProductId,
            Pageable pageable
    );

    @Query("SELECT p.rating, COUNT(p) FROM Product p WHERE p.category.slug = :slug GROUP BY p.rating")
    List<Object[]> countProductsByRatingForCategory(@Param("slug") String slug);

    @Query("SELECT p FROM Product p WHERE " +
            "(:query IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :query, '%')) " +
            "OR LOWER(p.description) LIKE LOWER(CONCAT('%', :query, '%'))) AND " +
            "(:categoryId IS NULL OR p.category.id = :categoryId) AND " +
            "(:minPrice IS NULL OR p.price >= :minPrice) AND " +
            "(:maxPrice IS NULL OR p.price <= :maxPrice) AND " +
            "(:availableOnly = false OR p.status = 'ACTIVE')")
    Page<Product> searchProducts(@Param("query") String query,
                                 @Param("categoryId") Long categoryId,
                                 @Param("minPrice") BigDecimal minPrice,
                                 @Param("maxPrice") BigDecimal maxPrice,
                                 @Param("availableOnly") boolean availableOnly,
                                 Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.category = :category " +
            "AND (:brand IS NULL OR p.brand = :brand) " +
            "AND (:minPrice IS NULL OR p.price >= :minPrice) " +
            "AND (:maxPrice IS NULL OR p.price <= :maxPrice)")
    Page<Product> findFilteredProducts(
            @Param("category") Category category,
            @Param("brand") Brand brand,
            @Param("minPrice") java.math.BigDecimal minPrice,
            @Param("maxPrice") java.math.BigDecimal maxPrice,
            Pageable pageable);

    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.product.id = :productId")
    Double getAverageRatingForProduct(@Param("productId") Long productId);

    @Query("SELECT p.subcategory.name, COUNT(p), p.subcategory.slug FROM Product p WHERE p.category.slug = :categorySlug GROUP BY p.subcategory.name, p.subcategory.slug")
    List<Object[]> findSubcategoriesByCategorySlug(@Param("categorySlug") String categorySlug);
}