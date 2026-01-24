package com.example.zoo.repository;

import com.example.zoo.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    Optional<Category> findBySlug(String slug);

    Optional<Category> findByName(String name);

    boolean existsByName(String name);

    boolean existsBySlug(String slug);

    List<Category> findByActiveTrue();

    Page<Category> findByActiveTrue(Pageable pageable);

    Page<Category> findByActiveFalse(Pageable pageable);

    @Query("SELECT CASE WHEN COUNT(s) > 0 THEN true ELSE false END " +
            "FROM Subcategory s WHERE s.category.id = :categoryId")
    boolean hasSubcategories(@Param("categoryId") Long categoryId);

    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END " +
            "FROM Product p WHERE p.category.id = :categoryId")
    boolean hasProducts(@Param("categoryId") Long categoryId);

    long countByActiveTrue();

    @Query("SELECT c, COUNT(p) as productCount FROM Category c " +
            "LEFT JOIN Product p ON p.category.id = c.id " +
            "GROUP BY c.id " +
            "ORDER BY c.name")
    List<Object[]> findCategoriesWithProductCount();

    @Query("SELECT c, COUNT(s) as subcategoryCount FROM Category c " +
            "LEFT JOIN Subcategory s ON s.category.id = c.id " +
            "GROUP BY c.id " +
            "ORDER BY c.name")
    List<Object[]> findCategoriesWithSubcategoryCount();

    @Query("SELECT c FROM Category c WHERE " +
            "LOWER(c.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(c.description) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<Category> searchCategories(@Param("query") String query, Pageable pageable);

    List<Category> findAllByOrderByNameAsc();

    List<Category> findByActiveTrueOrderByNameAsc();

    @Query("SELECT DISTINCT c FROM Category c " +
            "JOIN Product p ON p.category.id = c.id " +
            "WHERE c.active = true " +
            "AND p.status = com.example.zoo.enums.ProductStatus.ACTIVE")
    List<Category> findCategoriesWithActiveProducts();

    @Query("SELECT c, COUNT(p) as productCount FROM Category c " +
            "LEFT JOIN Product p ON p.category.id = c.id " +
            "WHERE c.active = true " +
            "GROUP BY c.id " +
            "ORDER BY productCount DESC")
    List<Category> findMostPopularCategories(Pageable pageable);

    @Query("SELECT c FROM Category c ORDER BY size(c.products) DESC")
    List<Category> findTopCategoriesByProductCount(Pageable pageable);
}