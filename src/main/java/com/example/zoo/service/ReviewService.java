package com.example.zoo.service;

import com.example.zoo.entity.Product;
import com.example.zoo.entity.Review;
import com.example.zoo.entity.User;
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

    /**
     * Lista wulgarnych słów i ich zamienników
     */
    private static final java.util.Map<String, String> PROFANITY_FILTER = new java.util.HashMap<>() {{
        put("chuj", "c***");
        put("kurwa", "k***a");
        put("kurwy", "k***y");
        put("kurwą", "k***ą");
        put("kurwie", "k***ie");
        put("kurwę", "k***ę");
        put("pierdol", "p*****l");
        put("pierdolić", "p*****lić");
        put("pierdolę", "p*****lę");
        put("pierdoli", "p*****li");
        put("jebać", "j***ć");
        put("jebany", "j***ny");
        put("jebana", "j***na");
        put("jebane", "j***ne");
        put("jebie", "j***e");
        put("skurwysyn", "s*********n");
        put("skurwiel", "s******l");
        put("dupa", "d**a");
        put("dupą", "d**ą");
        put("dupę", "d**ę");
        put("gówno", "g***o");
        put("gówna", "g***a");
        put("gównem", "g***em");
        put("cholera", "ch***ra");
        put("cholerny", "ch***rny");
        put("cholerna", "ch***rna");
        put("suka", "s**a");
        put("suki", "s**i");
        put("suką", "s**ą");
    }};

    /**
     * Filtruj wulgarne słowa w tekście
     */
    private String filterProfanity(String text) {
        if (text == null || text.isEmpty()) {
            return text;
        }
        
        String filteredText = text;
        for (java.util.Map.Entry<String, String> entry : PROFANITY_FILTER.entrySet()) {
            // Case-insensitive replacement
            filteredText = filteredText.replaceAll("(?i)" + java.util.regex.Pattern.quote(entry.getKey()), entry.getValue());
        }
        return filteredText;
    }

    /**
     * Dodaj opinię od klienta (z walidacją zakupu)
     */
    @Transactional
    public Review createCustomerReview(Long productId, User user, int rating, String comment) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produkt nie istnieje"));

        // Sprawdź czy użytkownik już ocenił ten produkt
        if (reviewRepository.hasUserReviewedProduct(user.getId(), productId)) {
            throw new RuntimeException("Już oceniłeś ten produkt");
        }

        // Filtruj wulgarne słowa w komentarzu
        String filteredComment = filterProfanity(comment);

        Review review = new Review();
        review.setProduct(product);
        review.setUser(user);
        review.setRating(rating);
        review.setComment(filteredComment);
        review.setStatus(ReviewStatus.APPROVED); // Automatyczne zatwierdzenie

        Review savedReview = reviewRepository.save(review);

        // Przelicz średnią ocenę produktu (tylko zatwierdzone opinie)
        updateProductRating(productId);

        log.info("Użytkownik {} dodał opinię dla produktu {} (ocena: {})", 
                user.getEmail(), product.getName(), rating);

        return savedReview;
    }

    /**
     * Sprawdź czy użytkownik już ocenił produkt
     */
    public boolean hasUserReviewedProduct(Long userId, Long productId) {
        return reviewRepository.hasUserReviewedProduct(userId, productId);
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
     * Aktualizuj średnią ocenę produktu (tylko zatwierdzone opinie)
     */
    @Transactional
    public void updateProductRating(Long productId) {
        Double avg = reviewRepository.calculateApprovedAverageRatingForProduct(productId);
        Product product = productRepository.findById(productId).orElseThrow();
        product.setRating(avg != null ? avg : 0.0);
        productRepository.save(product);
        log.info("Zaktualizowano ocenę produktu {} na {}", product.getName(), avg);
    }

    /**
     * Pobierz liczbę zatwierdzonych opinii dla produktu
     */
    public long getApprovedReviewCountForProduct(Long productId) {
        return reviewRepository.countApprovedReviewsByProductId(productId);
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
        Double avg = reviewRepository.findAverageApprovedRating();
        return avg != null ? avg : 0.0;
    }
}