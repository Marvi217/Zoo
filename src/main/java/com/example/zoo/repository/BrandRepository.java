package com.example.zoo.repository;

import com.example.zoo.entity.Brand;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Long> {

    // ==================== WYSZUKIWANIE PODSTAWOWE ====================

    /**
     * Znajdź markę po slug
     */
    Optional<Brand> findBySlug(String slug);

    /**
     * Znajdź markę po nazwie
     */
    Optional<Brand> findByName(String name);

    /**
     * Sprawdź czy nazwa istnieje
     */
    boolean existsByName(String name);

    /**
     * Sprawdź czy slug istnieje
     */
    boolean existsBySlug(String slug);

    // ==================== AKTYWNE MARKI ====================

    /**
     * Znajdź wszystkie aktywne marki
     */
    List<Brand> findByActiveTrue();

    /**
     * Znajdź wszystkie aktywne marki z paginacją
     */
    Page<Brand> findByActiveTrue(Pageable pageable);

    /**
     * Znajdź nieaktywne marki
     */
    Page<Brand> findByActiveFalse(Pageable pageable);

    // ==================== SPRAWDZANIE ZALEŻNOŚCI ====================

    /**
     * Sprawdź czy marka zawiera produkty
     */
    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END " +
            "FROM Product p WHERE p.brand.id = :brandId")
    boolean hasProducts(@Param("brandId") Long brandId);

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz aktywne marki
     */
    long countByActiveTrue();

    /**
     * Pobierz marki z liczbą produktów
     */
    @Query("SELECT b, COUNT(p) as productCount FROM Brand b " +
            "LEFT JOIN Product p ON p.brand.id = b.id " +
            "GROUP BY b.id " +
            "ORDER BY b.name")
    List<Object[]> findBrandsWithProductCount();

    /**
     * Znajdź najpopularniejsze marki (według liczby produktów)
     */
    @Query("SELECT b FROM Brand b " +
            "LEFT JOIN Product p ON p.brand.id = b.id " +
            "WHERE b.active = true " +
            "GROUP BY b.id " +
            "ORDER BY COUNT(p) DESC")
    List<Brand> findMostPopularBrands(int limit);

    // ==================== WYSZUKIWANIE ====================

    /**
     * Wyszukiwanie pełnotekstowe marek
     */
    @Query("SELECT b FROM Brand b WHERE " +
            "LOWER(b.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(b.description) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(b.country) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<Brand> searchBrands(@Param("query") String query, Pageable pageable);

    // ==================== FILTROWANIE PO KRAJU ====================

    /**
     * Znajdź marki według kraju
     */
    Page<Brand> findByCountry(String country, Pageable pageable);

    /**
     * Znajdź unikalne kraje marek
     */
    @Query("SELECT DISTINCT b.country FROM Brand b WHERE b.country IS NOT NULL ORDER BY b.country")
    List<String> findDistinctCountries();

    // ==================== SORTOWANIE ====================

    /**
     * Znajdź marki posortowane według nazwy
     */
    List<Brand> findAllByOrderByNameAsc();

    /**
     * Znajdź aktywne marki posortowane według nazwy
     */
    List<Brand> findByActiveTrueOrderByNameAsc();

    // ==================== ZAAWANSOWANE ====================

    /**
     * Znajdź marki z produktami w określonym statusie
     */
    @Query("SELECT DISTINCT b FROM Brand b " +
            "JOIN Product p ON p.brand.id = b.id " +
            "WHERE p.status = com.example.zoo.enums.ProductStatus.ACTIVE " +
            "AND b.active = true")
    List<Brand> findBrandsWithAvailableProducts();

    /**
     * Znajdź marki według zakresu liczby produktów
     */
    @Query("SELECT b FROM Brand b " +
            "LEFT JOIN Product p ON p.brand.id = b.id " +
            "GROUP BY b.id " +
            "HAVING COUNT(p) BETWEEN :minProducts AND :maxProducts " +
            "ORDER BY b.name")
    List<Brand> findBrandsByProductCountRange(
            @Param("minProducts") long minProducts,
            @Param("maxProducts") long maxProducts
    );

    /**
     * Znajdź marki bez produktów
     */
    @Query("SELECT b FROM Brand b WHERE b.id NOT IN " +
            "(SELECT DISTINCT p.brand.id FROM Product p WHERE p.brand IS NOT NULL)")
    List<Brand> findBrandsWithoutProducts();
}