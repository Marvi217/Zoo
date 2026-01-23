package com.example.zoo.service;

import com.example.zoo.entity.Product;
import com.example.zoo.entity.Review;
import com.example.zoo.enums.ReviewStatus;
import com.example.zoo.repository.ProductRepository;
import com.example.zoo.repository.ReviewRepository;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private ProductRepository productRepository;

    // ==================== METODA ISTNIEJĄCA (zachowana) ====================

    /**
     * Dodaj opinię do produktu
     */
    @Transactional
    public void addReview(Long productId, Review review) {
        Product product = productRepository.findById(productId).orElseThrow();

        review.setProduct(product);
        reviewRepository.save(review);

        // Przelicz średnią ocenę
        Double avg = reviewRepository.getAverageRatingForProduct(productId);

        // Zaktualizuj średnią ocenę w produkcie
        if (avg != null) {
            product.setRating(avg);
            productRepository.save(product);
        }
    }

    // ==================== NOWE METODY DLA PANELU ADMIN ====================

    // ==================== CRUD OPERATIONS ====================

    /**
     * Pobierz wszystkie opinie
     */
    public Page<Review> getAllReviews(Pageable pageable) {
        return reviewRepository.findAll(pageable);
    }

    /**
     * Pobierz opinię po ID
     */
    public Review getReviewById(Long id) {
        return reviewRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Opinia o ID " + id + " nie została znaleziona"));
    }

    public Page<Review> getReviewsByRatingRange(Integer minRating, Integer maxRating, Pageable pageable) {
        log.info("Pobieranie opinii w zakresie ocen: {} - {}", minRating, maxRating);

        // Zapewnienie wartości domyślnych, jeśli parametry są nullem
        int min = (minRating != null) ? minRating : 1;
        int max = (maxRating != null) ? maxRating : 5;

        return reviewRepository.findByRatingBetweenOrderByCreatedAtDesc(min, max, pageable);
    }

    /**
     * Usuń opinię
     */
    @Transactional
    public void deleteReview(Long id) {
        Review review = getReviewById(id);
        Long productId = review.getProduct().getId();

        reviewRepository.delete(review);

        // Przelicz średnią ocenę produktu po usunięciu opinii
        updateProductRating(productId);

        log.info("Usunięto opinię o ID: {}", id);
    }

    /**
     * Aktualizuj średnią ocenę produktu
     */
    @Transactional
    public void updateProductRating(Long productId) {
        Double avg = reviewRepository.getAverageRatingForProduct(productId);
        Product product = productRepository.findById(productId).orElseThrow();
        product.setRating(avg != null ? avg : 0.0);
        productRepository.save(product);
    }

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz oczekujące opinie
     */
    public long getPendingReviewsCount() {
        return reviewRepository.countByStatus(ReviewStatus.PENDING);
    }

    /**
     * Zlicz zatwierdzone opinie
     */
    public long getApprovedReviewsCount() {
        return reviewRepository.countByStatus(ReviewStatus.APPROVED);
    }

    /**
     * Zlicz odrzucone opinie
     */
    public long getRejectedReviewsCount() {
        return reviewRepository.countByStatus(ReviewStatus.REJECTED);
    }

    // ==================== WYSZUKIWANIE ====================

    /**
     * Pobierz oczekujące opinie
     */
    public Page<Review> getPendingReviews(Pageable pageable) {
        return reviewRepository.findByStatusOrderByCreatedAtDesc(ReviewStatus.PENDING, pageable);
    }

    /**
     * Pobierz oczekujące opinie (lista)
     */
    public List<Review> getPendingReviews(int limit) {
        return reviewRepository.findByStatusOrderByCreatedAtDesc(
                ReviewStatus.PENDING,
                PageRequest.of(0, limit)
        ).getContent();
    }


    /**
     * Pobierz opinie według statusu
     */
    public Page<Review> getReviewsByStatus(ReviewStatus status, Pageable pageable) {
        return reviewRepository.findByStatusOrderByCreatedAtDesc(status, pageable);
    }

    /**
     * Pobierz opinie produktu
     */
    public Page<Review> getReviewsByProduct(Long productId, Pageable pageable) {
        return reviewRepository.findByProductIdOrderByCreatedAtDesc(productId, pageable);
    }

    /**
     * Pobierz zatwierdzone opinie produktu
     */
    public Page<Review> getApprovedReviewsByProduct(Long productId, Pageable pageable) {
        return reviewRepository.findByProductIdAndStatusOrderByCreatedAtDesc(
                productId,
                ReviewStatus.APPROVED,
                pageable
        );
    }

    /**
     * Wyszukaj opinie
     */
    public Page<Review> searchReviews(String query, Pageable pageable) {
        return reviewRepository.searchReviews(query, pageable);
    }


    // ==================== FILTROWANIE ====================


    // ==================== STATYSTYKI PRODUKTU ====================

    /**
     * Pobierz średnią ocenę produktu
     */
    public Double getAverageRatingForProduct(Long productId) {
        return reviewRepository.calculateAverageRatingForProduct(productId);
    }

    /**
     * Zlicz opinie produktu
     */
    public long getReviewCountForProduct(Long productId) {
        return reviewRepository.countByProductId(productId);
    }

    // ==================== EKSPORT ====================

    /**
     * Eksportuj opinie do CSV
     */
    public String exportToCSV(ReviewStatus status) {
        log.info("Eksportowanie opinii do CSV, status: {}", status);
        // TODO: Implementacja eksportu
        return "reviews_export_" + System.currentTimeMillis() + ".csv";
    }
    public Double getAverageRating() {
        Double avg = reviewRepository.findAverageRating();
        return avg != null ? avg : 0.0;
    }
}