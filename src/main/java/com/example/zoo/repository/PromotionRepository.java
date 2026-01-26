package com.example.zoo.repository;

import com.example.zoo.entity.Promotion;
import com.example.zoo.enums.PromotionType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface PromotionRepository extends JpaRepository<Promotion, Long> {

    Optional<Promotion> findByCode(String code);

    Optional<Promotion> findByCodeIgnoreCase(String code);

    boolean existsByCode(String code);

    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END FROM Promotion p " +
            "WHERE p.code = :code AND p.id != :excludeId")
    boolean existsByCodeAndIdNot(@Param("code") String code, @Param("excludeId") Long excludeId);

    List<Promotion> findByType(PromotionType type);

    Page<Promotion> findByType(PromotionType type, Pageable pageable);

    List<Promotion> findByActiveTrue();

    Page<Promotion> findByActiveTrue(Pageable pageable);

    Page<Promotion> findByActiveFalse(Pageable pageable);

    @Query("SELECT p FROM Promotion p WHERE p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate)")
    List<Promotion> findActivePromotionsForDate(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT p FROM Promotion p WHERE p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate)")
    Page<Promotion> findActivePromotionsForDate(@Param("currentDate") LocalDate currentDate, Pageable pageable);

    @Query("SELECT p FROM Promotion p WHERE p.active = true " +
            "AND p.startDate > :currentDate")
    Page<Promotion> findUpcomingPromotions(@Param("currentDate") LocalDate currentDate, Pageable pageable);

    @Query("SELECT p FROM Promotion p WHERE p.endDate IS NOT NULL " +
            "AND p.endDate < :currentDate")
    Page<Promotion> findExpiredPromotions(@Param("currentDate") LocalDate currentDate, Pageable pageable);

    @Query("SELECT p FROM Promotion p WHERE p.active = true " +
            "AND p.endDate IS NOT NULL " +
            "AND p.endDate BETWEEN :startDate AND :endDate " +
            "ORDER BY p.endDate ASC")
    List<Promotion> findPromotionsEndingSoon(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    @Query("SELECT p FROM Promotion p JOIN p.products prod " +
            "WHERE prod.id = :productId AND p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate)")
    List<Promotion> findActivePromotionsForProduct(
            @Param("productId") Long productId,
            @Param("currentDate") LocalDate currentDate
    );

    @Query("SELECT p FROM Promotion p JOIN p.categories cat " +
            "WHERE cat.id = :categoryId AND p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate)")
    List<Promotion> findActivePromotionsForCategory(
            @Param("categoryId") Long categoryId,
            @Param("currentDate") LocalDate currentDate
    );

    @Query("SELECT p FROM Promotion p WHERE p.maxUsage IS NOT NULL " +
            "AND p.currentUsage >= p.maxUsage")
    List<Promotion> findPromotionsWithMaxUsageReached();

    @Query("SELECT p FROM Promotion p WHERE p.maxUsage IS NOT NULL " +
            "AND p.currentUsage >= (p.maxUsage * 0.9)")
    List<Promotion> findPromotionsNearMaxUsage();

    @Query("SELECT p FROM Promotion p WHERE p.code IS NOT NULL " +
            "AND p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate)")
    List<Promotion> findActivePromotionsWithCode(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT COUNT(p) FROM Promotion p WHERE p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate)")
    long countActivePromotions(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT COUNT(p) FROM Promotion p WHERE p.active = true " +
            "AND p.startDate > :currentDate")
    long countUpcomingPromotions(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT COALESCE(SUM(p.currentUsage), 0) FROM Promotion p")
    long sumTotalUsage();

    @Query("SELECT p.type, COUNT(p) FROM Promotion p GROUP BY p.type")
    List<Object[]> countPromotionsByType();

    @Query("SELECT p FROM Promotion p ORDER BY p.currentUsage DESC")
    List<Promotion> findMostUsedPromotions(Pageable pageable);

    @Query("SELECT p FROM Promotion p WHERE p.featured = true " +
            "AND p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate) " +
            "ORDER BY p.priority DESC, p.startDate DESC")
    List<Promotion> findFeaturedPromotions(@Param("currentDate") LocalDate currentDate, Pageable pageable);

    @Query("SELECT p FROM Promotion p WHERE " +
            "LOWER(p.name) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            "LOWER(p.description) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            "LOWER(p.code) LIKE LOWER(CONCAT('%', :search, '%'))")
    Page<Promotion> searchPromotions(@Param("search") String search, Pageable pageable);

    @Query("SELECT DISTINCT p FROM Promotion p " +
            "LEFT JOIN p.products prod " +
            "LEFT JOIN p.categories cat " +
            "WHERE (:type IS NULL OR p.type = :type) " +
            "AND (:active IS NULL OR p.active = :active) " +
            "AND (:startDate IS NULL OR p.startDate >= :startDate) " +
            "AND (:endDate IS NULL OR (p.endDate IS NULL OR p.endDate <= :endDate))")
    Page<Promotion> filterPromotions(
            @Param("type") PromotionType type,
            @Param("active") Boolean active,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate,
            Pageable pageable
    );

    @Query("SELECT p FROM Promotion p WHERE " +
            "LOWER(p.name) LIKE LOWER(CONCAT('%', :name, '%')) " +
            "AND p.id != :excludeId")
    List<Promotion> findSimilarPromotions(
            @Param("name") String name,
            @Param("excludeId") Long excludeId
    );

    @Query("SELECT p FROM Promotion p WHERE p.stackable = true " +
            "AND p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate)")
    List<Promotion> findStackablePromotions(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT p FROM Promotion p WHERE p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate) " +
            "ORDER BY p.priority DESC, p.startDate DESC")
    List<Promotion> findActivePromotionsByPriority(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT p FROM Promotion p JOIN p.products prod " +
            "WHERE prod.id = :productId " +
            "AND p.active = true " +
            "AND p.startDate <= :currentDate " +
            "AND (p.endDate IS NULL OR p.endDate >= :currentDate) " +
            "AND (p.maxUsage IS NULL OR p.currentUsage < p.maxUsage) " +
            "ORDER BY p.priority DESC, p.discountPercentage DESC NULLS LAST")
    List<Promotion> findBestPromotionForProduct(
            @Param("productId") Long productId,
            @Param("currentDate") LocalDate currentDate,
            Pageable pageable
    );

    @Query("SELECT p FROM Promotion p JOIN p.orders o " +
            "WHERE o.orderDate BETWEEN :startDate AND :endDate " +
            "GROUP BY p " +
            "ORDER BY COUNT(o) DESC")
    List<Promotion> findPromotionsUsedInPeriod(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate,
            Pageable pageable
    );
}