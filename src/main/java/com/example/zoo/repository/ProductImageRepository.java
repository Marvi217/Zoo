package com.example.zoo.repository;

import com.example.zoo.entity.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {

    // ==================== WYSZUKIWANIE PODSTAWOWE ====================

    /**
     * Znajdź obrazy produktu posortowane według kolejności wyświetlania
     */
    List<ProductImage> findByProductIdOrderByDisplayOrderAsc(Long productId);

    /**
     * Znajdź główny obraz produktu
     */
    Optional<ProductImage> findByProductIdAndIsMainTrue(Long productId);

    /**
     * Znajdź obraz według produktu i kolejności
     */
    Optional<ProductImage> findByProductIdAndDisplayOrder(Long productId, Integer displayOrder);

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz obrazy produktu
     */
    long countByProductId(Long productId);

    /**
     * Pobierz maksymalną kolejność wyświetlania dla produktu
     */
    @Query("SELECT MAX(pi.displayOrder) FROM ProductImage pi WHERE pi.product.id = :productId")
    Optional<Integer> getMaxDisplayOrder(@Param("productId") Long productId);

    // ==================== OPERACJE MASOWE ====================

    /**
     * Usuń wszystkie obrazy produktu
     */
    @Modifying
    @Query("DELETE FROM ProductImage pi WHERE pi.product.id = :productId")
    void deleteByProductId(@Param("productId") Long productId);

    /**
     * Usuń flagę głównego obrazu ze wszystkich obrazów produktu
     */
    @Modifying
    @Query("UPDATE ProductImage pi SET pi.isMain = false WHERE pi.product.id = :productId")
    void clearMainFlag(@Param("productId") Long productId);

    // ==================== ZAAWANSOWANE ====================

    /**
     * Znajdź obrazy bez głównego obrazu
     */
    @Query("SELECT pi FROM ProductImage pi WHERE pi.product.id IN " +
            "(SELECT p.id FROM Product p WHERE p.id NOT IN " +
            "(SELECT pi2.product.id FROM ProductImage pi2 WHERE pi2.isMain = true))")
    List<ProductImage> findProductsWithoutMainImage();

    /**
     * Znajdź duplikaty obrazów (te same URL)
     */
    @Query("SELECT pi.imageUrl, COUNT(pi) FROM ProductImage pi " +
            "GROUP BY pi.imageUrl HAVING COUNT(pi) > 1")
    List<Object[]> findDuplicateImages();

    /**
     * Znajdź obrazy według typu MIME
     */
    List<ProductImage> findByMimeType(String mimeType);

    /**
     * Znajdź duże obrazy (większe niż określony rozmiar)
     */
    @Query("SELECT pi FROM ProductImage pi WHERE pi.fileSize > :maxSize")
    List<ProductImage> findLargeImages(@Param("maxSize") Long maxSize);
}