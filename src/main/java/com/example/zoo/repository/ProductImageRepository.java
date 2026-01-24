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

    List<ProductImage> findByProductIdOrderByDisplayOrderAsc(Long productId);

    Optional<ProductImage> findByProductIdAndIsMainTrue(Long productId);

    Optional<ProductImage> findByProductIdAndDisplayOrder(Long productId, Integer displayOrder);

    long countByProductId(Long productId);

    @Query("SELECT MAX(pi.displayOrder) FROM ProductImage pi WHERE pi.product.id = :productId")
    Optional<Integer> getMaxDisplayOrder(@Param("productId") Long productId);

    @Modifying
    @Query("DELETE FROM ProductImage pi WHERE pi.product.id = :productId")
    void deleteByProductId(@Param("productId") Long productId);

    @Modifying
    @Query("UPDATE ProductImage pi SET pi.isMain = false WHERE pi.product.id = :productId")
    void clearMainFlag(@Param("productId") Long productId);

    @Query("SELECT pi FROM ProductImage pi WHERE pi.product.id IN " +
            "(SELECT p.id FROM Product p WHERE p.id NOT IN " +
            "(SELECT pi2.product.id FROM ProductImage pi2 WHERE pi2.isMain = true))")
    List<ProductImage> findProductsWithoutMainImage();

    @Query("SELECT pi.imageUrl, COUNT(pi) FROM ProductImage pi " +
            "GROUP BY pi.imageUrl HAVING COUNT(pi) > 1")
    List<Object[]> findDuplicateImages();

    List<ProductImage> findByMimeType(String mimeType);

    @Query("SELECT pi FROM ProductImage pi WHERE pi.fileSize > :maxSize")
    List<ProductImage> findLargeImages(@Param("maxSize") Long maxSize);
}