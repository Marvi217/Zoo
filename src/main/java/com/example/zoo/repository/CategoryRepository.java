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

    // ==================== WYSZUKIWANIE PODSTAWOWE ====================

    /**
     * Znajdź kategorię po slug
     */
    Optional<Category> findBySlug(String slug);

    /**
     * Znajdź kategorię po nazwie
     */
    Optional<Category> findByName(String name);

    /**
     * Sprawdź czy nazwa istnieje
     */
    boolean existsByName(String name);

    /**
     * Sprawdź czy slug istnieje
     */
    boolean existsBySlug(String slug);

    // ==================== AKTYWNE KATEGORIE ====================

    /**
     * Znajdź wszystkie aktywne kategorie
     */
    List<Category> findByActiveTrue();

    /**
     * Znajdź wszystkie aktywne kategorie z paginacją
     */
    Page<Category> findByActiveTrue(Pageable pageable);

    /**
     * Znajdź nieaktywne kategorie
     */
    Page<Category> findByActiveFalse(Pageable pageable);

    // ==================== SPRAWDZANIE ZALEŻNOŚCI ====================

    /**
     * Sprawdź czy kategoria zawiera subkategorie
     */
    @Query("SELECT CASE WHEN COUNT(s) > 0 THEN true ELSE false END " +
            "FROM Subcategory s WHERE s.category.id = :categoryId")
    boolean hasSubcategories(@Param("categoryId") Long categoryId);

    /**
     * Sprawdź czy kategoria zawiera produkty
     */
    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END " +
            "FROM Product p WHERE p.category.id = :categoryId")
    boolean hasProducts(@Param("categoryId") Long categoryId);

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz aktywne kategorie
     */
    long countByActiveTrue();

    /**
     * Pobierz kategorie z liczbą produktów
     */
    @Query("SELECT c, COUNT(p) as productCount FROM Category c " +
            "LEFT JOIN Product p ON p.category.id = c.id " +
            "GROUP BY c.id " +
            "ORDER BY c.name")
    List<Object[]> findCategoriesWithProductCount();

    /**
     * Pobierz kategorie z liczbą subkategorii
     */
    @Query("SELECT c, COUNT(s) as subcategoryCount FROM Category c " +
            "LEFT JOIN Subcategory s ON s.category.id = c.id " +
            "GROUP BY c.id " +
            "ORDER BY c.name")
    List<Object[]> findCategoriesWithSubcategoryCount();

    // ==================== WYSZUKIWANIE ====================

    /**
     * Wyszukiwanie pełnotekstowe kategorii
     */
    @Query("SELECT c FROM Category c WHERE " +
            "LOWER(c.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(c.description) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<Category> searchCategories(@Param("query") String query, Pageable pageable);

    // ==================== SORTOWANIE ====================

    /**
     * Znajdź kategorie posortowane według nazwy
     */
    List<Category> findAllByOrderByNameAsc();

    /**
     * Znajdź aktywne kategorie posortowane według nazwy
     */
    List<Category> findByActiveTrueOrderByNameAsc();

    // ==================== ZAAWANSOWANE ====================

    /**
     * Znajdź kategorie z produktami
     */
    @Query("SELECT DISTINCT c FROM Category c " +
            "JOIN Product p ON p.category.id = c.id " +
            "WHERE c.active = true " +
            "AND p.status = com.example.zoo.enums.ProductStatus.ACTIVE")
    List<Category> findCategoriesWithActiveProducts();

    /**
     * Znajdź najpopularniejsze kategorie (według liczby produktów)
     */
    @Query("SELECT c, COUNT(p) as productCount FROM Category c " +
            "LEFT JOIN Product p ON p.category.id = c.id " +
            "WHERE c.active = true " +
            "GROUP BY c.id " +
            "ORDER BY productCount DESC")
    List<Category> findMostPopularCategories(Pageable pageable);

    @Query("SELECT c FROM Category c ORDER BY size(c.products) DESC")
    List<Category> findTopCategoriesByProductCount(Pageable pageable);
}