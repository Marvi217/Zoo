package com.example.zoo.repository;

import com.example.zoo.entity.Subcategory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SubcategoryRepository extends JpaRepository<Subcategory, Long> {

    Optional<Subcategory> findByName(String name);
    Page<Subcategory> findByCategoryId(Long categoryId, Pageable pageable);

    List<Subcategory> findByCategoryId(Long categoryId);

    List<Subcategory> findByActiveTrue();

    List<Subcategory> findByCategoryIdAndActiveTrue(Long categoryId);

    Page<Subcategory> findByCategoryIdAndActiveTrue(Long categoryId, Pageable pageable);

    List<Subcategory> findByCategoryIdOrderByDisplayOrderAsc(Long categoryId);

    boolean existsByNameAndCategoryId(String name, Long categoryId);

    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END " +
            "FROM Product p WHERE p.subcategory.id = :subcategoryId")
    boolean hasProducts(@Param("subcategoryId") Long subcategoryId);

    long countByActiveTrue();

    long countByCategoryId(Long categoryId);

    long countByCategoryIdAndActiveTrue(Long categoryId);

    @Query("SELECT s.id, s.name, COUNT(p) " +
            "FROM Subcategory s " +
            "LEFT JOIN Product p ON p.subcategory.id = s.id " +
            "WHERE s.category.id = :categoryId " +
            "GROUP BY s.id, s.name " +
            "ORDER BY s.displayOrder ASC")
    List<Object[]> findSubcategoriesWithProductCount(@Param("categoryId") Long categoryId);
    @Query("SELECT s FROM Subcategory s WHERE " +
            "LOWER(s.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(s.description) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<Subcategory> searchSubcategories(@Param("query") String query, Pageable pageable);

    @Query("SELECT s FROM Subcategory s WHERE s.category.id = :categoryId AND (" +
            "LOWER(s.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(s.description) LIKE LOWER(CONCAT('%', :query, '%')))")
    Page<Subcategory> searchSubcategoriesInCategory(
            @Param("categoryId") Long categoryId,
            @Param("query") String query,
            Pageable pageable
    );

    @Modifying
    @Query("UPDATE Product p SET p.subcategory.id = :toSubcategoryId " +
            "WHERE p.subcategory.id = :fromSubcategoryId")
    void moveAllProducts(
            @Param("fromSubcategoryId") Long fromSubcategoryId,
            @Param("toSubcategoryId") Long toSubcategoryId
    );

    @Modifying
    @Query("UPDATE Subcategory s SET s.active = false WHERE s.category.id = :categoryId")
    void deactivateAllInCategory(@Param("categoryId") Long categoryId);

    @Modifying
    @Query("UPDATE Subcategory s SET s.active = true WHERE s.category.id = :categoryId")
    void activateAllInCategory(@Param("categoryId") Long categoryId);

    @Query("SELECT DISTINCT s FROM Subcategory s " +
            "JOIN s.products p " +
            "WHERE p.price BETWEEN :minPrice AND :maxPrice " +
            "AND s.active = true " +
            "AND p.status = com.example.zoo.enums.ProductStatus.ACTIVE")
    List<Subcategory> findSubcategoriesWithProductsInPriceRange(
            @Param("minPrice") java.math.BigDecimal minPrice,
            @Param("maxPrice") java.math.BigDecimal maxPrice
    );

    @Query("SELECT s, COUNT(p) as productCount FROM Subcategory s " +
            "LEFT JOIN s.products p " +
            "WHERE s.active = true " +
            "GROUP BY s.id " +
            "ORDER BY productCount DESC")
    List<Subcategory> findMostPopularSubcategories(Pageable pageable);

    @Query("SELECT DISTINCT s FROM Subcategory s " +
            "JOIN s.products p " +
            "WHERE s.active = true " +
            "AND p.status = com.example.zoo.enums.ProductStatus.ACTIVE " +
            "AND p.stockQuantity > 0")
    List<Subcategory> findSubcategoriesWithAvailableProducts();
}