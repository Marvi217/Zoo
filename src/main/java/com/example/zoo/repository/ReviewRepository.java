package com.example.zoo.repository;

import com.example.zoo.entity.Product;
import com.example.zoo.entity.Review;
import com.example.zoo.enums.ReviewStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Query("SELECT AVG(r.rating) FROM Review r")
    Double findAverageRating();

    // ==================== WYSZUKIWANIE PODSTAWOWE ====================

    List<Review> findByProductOrderByCreatedAtDesc(Product product);

    /**
     * Znajdź opinie produktu
     */
    Page<Review> findByProductIdOrderByCreatedAtDesc(Long productId, Pageable pageable);

    /**
     * Znajdź opinie produktu według statusu
     */
    Page<Review> findByProductIdAndStatusOrderByCreatedAtDesc(
            Long productId,
            ReviewStatus status,
            Pageable pageable
    );

    /**
     * Znajdź opinie użytkownika
     */
    Page<Review> findByUserIdOrderByCreatedAtDesc(Long userId, Pageable pageable);

    // ==================== STATYSTYKI ====================

    Page<Review> findByRatingBetweenOrderByCreatedAtDesc(int min, int max, Pageable pageable);

    /**
     * Zlicz opinie według statusu
     */
    long countByStatus(ReviewStatus status);

    /**
     * Zlicz opinie produktu
     */
    long countByProductId(Long productId);

    /**
     * Zlicz opinie użytkownika
     */
    long countByUserId(Long userId);

    // ==================== ŚREDNIA OCENA ====================

    /**
     * Pobierz średnią ocenę produktu (wszystkie opinie)
     */
    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.product.id = :productId ")
    Double getAverageRatingForProduct(@Param("productId") Long productId);

    /**
     * Oblicz średnią ocenę produktu tylko z zatwierdzonych opinii
     */
    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.product.id = :productId AND r.status = com.example.zoo.enums.ReviewStatus.APPROVED")
    Double calculateApprovedAverageRatingForProduct(@Param("productId") Long productId);

    /**
     * Oblicz średnią ocenę produktu (alias)
     */
    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.product.id = :productId " )
    Double calculateAverageRatingForProduct(@Param("productId") Long productId);

    /**
     * Zlicz zatwierdzone opinie produktu
     */
    @Query("SELECT COUNT(r) FROM Review r WHERE r.product.id = :productId AND r.status = com.example.zoo.enums.ReviewStatus.APPROVED")
    long countApprovedReviewsByProductId(@Param("productId") Long productId);

    // ==================== WYSZUKIWANIE PO STATUSIE ====================

    /**
     * Znajdź opinie według statusu
     */
    Page<Review> findByStatusOrderByCreatedAtDesc(ReviewStatus status, Pageable pageable);


    /**
     * Wyszukiwanie w opiniach
     */
    @Query("SELECT r FROM Review r WHERE " +
            "LOWER(r.comment) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(r.user.firstName) LIKE LOWER(CONCAT('%', :query, '%')) OR " + // Poprawka 1
            "LOWER(r.user.lastName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +  // Poprawka 2
            "LOWER(r.product.name) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<Review> searchReviews(@Param("query") String query, Pageable pageable);

    // ==================== FILTROWANIE ====================

    /**
     * Filtrowanie opinii wielokryterialne
     */
    @Query("SELECT r FROM Review r WHERE " +
            "(:minRating IS NULL OR r.rating >= :minRating) AND " +
            "(:maxRating IS NULL OR r.rating <= :maxRating) AND " +
            "(:productId IS NULL OR r.product.id = :productId)")
    Page<Review> filterReviews(
            @Param("minRating") Integer minRating,
            @Param("maxRating") Integer maxRating,
            @Param("productId") Long productId,
            Pageable pageable
    );

    // ==================== STATYSTYKI ZAAWANSOWANE ====================

    /**
     * Zlicz opinie według oceny
     */
    @Query("SELECT r.rating, COUNT(r) FROM Review r " +
            "WHERE r.product.id = :productId "+
            "GROUP BY r.rating " +
            "ORDER BY r.rating DESC")
    List<Object[]> countReviewsByRatingForProduct(@Param("productId") Long productId);

    /**
     * Znajdź najlepiej oceniane produkty
     */
    @Query("SELECT r.product, AVG(r.rating) as avgRating FROM Review r " +
            "GROUP BY r.product " +
            "HAVING AVG(r.rating) >= :minRating " +
            "ORDER BY avgRating DESC")
    List<Object[]> findTopRatedProducts(@Param("minRating") Double minRating, Pageable pageable);

    // ==================== NAJBARDZIEJ POMOCNE OPINIE ====================


    /**
     * Znajdź ostatnie opinie produktu
     */
    @Query("SELECT r FROM Review r WHERE r.product.id = :productId " +
            "ORDER BY r.createdAt DESC")
    List<Review> findRecentReviewsForProduct(@Param("productId") Long productId, Pageable pageable);

    // ==================== SPRAWDZANIE ====================

    /**
     * Sprawdź czy użytkownik już ocenił produkt
     */
    @Query("SELECT CASE WHEN COUNT(r) > 0 THEN true ELSE false END " +
            "FROM Review r WHERE r.user.id = :userId AND r.product.id = :productId")
    boolean hasUserReviewedProduct(@Param("userId") Long userId, @Param("productId") Long productId);

    /**
     * Znajdź opinię użytkownika dla produktu
     */
    @Query("SELECT r FROM Review r WHERE r.user.id = :userId AND r.product.id = :productId")
    List<Review> findByUserIdAndProductId(@Param("userId") Long userId, @Param("productId") Long productId);
}