package com.example.zoo.service;

import com.example.zoo.entity.Product;
import com.example.zoo.entity.Review;
import com.example.zoo.entity.User;
import com.example.zoo.enums.ReviewStatus;
import com.example.zoo.repository.ProductRepository;
import com.example.zoo.repository.ReviewRepository;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final ProductRepository productRepository;

    public ReviewService(ReviewRepository reviewRepository, ProductRepository productRepository) {
        this.reviewRepository = reviewRepository;
        this.productRepository = productRepository;
    }

    @Transactional
    public void addReview(Long productId, Review review) {
        Product product = productRepository.findById(productId).orElseThrow();

        review.setProduct(product);
        reviewRepository.save(review);

        Double avg = reviewRepository.getAverageRatingForProduct(productId);

        if (avg != null) {
            product.setRating(avg);
            productRepository.save(product);
        }
    }

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

    private String filterProfanity(String text) {
        if (text == null || text.isEmpty()) {
            return text;
        }

        String filteredText = text;
        for (java.util.Map.Entry<String, String> entry : PROFANITY_FILTER.entrySet()) {
            filteredText = filteredText.replaceAll("(?i)" + java.util.regex.Pattern.quote(entry.getKey()), entry.getValue());
        }
        return filteredText;
    }

    @Transactional
    public void createCustomerReview(Long productId, User user, int rating, String comment) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produkt nie istnieje"));

        if (reviewRepository.hasUserReviewedProduct(user.getId(), productId)) {
            throw new RuntimeException("Już oceniłeś ten produkt");
        }

        String filteredComment = filterProfanity(comment);

        Review review = new Review();
        review.setProduct(product);
        review.setUser(user);
        review.setRating(rating);
        review.setComment(filteredComment);
        review.setStatus(ReviewStatus.APPROVED);

        reviewRepository.save(review);

        updateProductRating(productId);
    }

    public boolean hasUserReviewedProduct(Long userId, Long productId) {
        return reviewRepository.hasUserReviewedProduct(userId, productId);
    }

    public Page<Review> getAllReviews(Pageable pageable) {
        return reviewRepository.findAll(pageable);
    }

    public Review getReviewById(Long id) {
        return reviewRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Opinia o ID " + id + " nie została znaleziona"));
    }

    public Page<Review> getReviewsByRatingRange(Integer minRating, Integer maxRating, Pageable pageable) {
        int min = (minRating != null) ? minRating : 1;
        int max = (maxRating != null) ? maxRating : 5;

        return reviewRepository.findByRatingBetweenOrderByCreatedAtDesc(min, max, pageable);
    }

    @Transactional
    public void deleteReview(Long id) {
        Review review = getReviewById(id);
        Long productId = review.getProduct().getId();

        reviewRepository.delete(review);

        updateProductRating(productId);
    }

    @Transactional
    public void updateProductRating(Long productId) {
        Double avg = reviewRepository.calculateApprovedAverageRatingForProduct(productId);
        Product product = productRepository.findById(productId).orElseThrow();
        product.setRating(avg != null ? avg : 0.0);
        productRepository.save(product);
    }

    public long getApprovedReviewCountForProduct(Long productId) {
        return reviewRepository.countApprovedReviewsByProductId(productId);
    }

    public long getPendingReviewsCount() {
        return reviewRepository.countByStatus(ReviewStatus.PENDING);
    }

    public long getApprovedReviewsCount() {
        return reviewRepository.countByStatus(ReviewStatus.APPROVED);
    }

    public long getRejectedReviewsCount() {
        return reviewRepository.countByStatus(ReviewStatus.REJECTED);
    }

    public Page<Review> getPendingReviews(Pageable pageable) {
        return reviewRepository.findByStatusOrderByCreatedAtDesc(ReviewStatus.PENDING, pageable);
    }

    public List<Review> getPendingReviews(int limit) {
        return reviewRepository.findByStatusOrderByCreatedAtDesc(
                ReviewStatus.PENDING,
                PageRequest.of(0, limit)
        ).getContent();
    }


    public Page<Review> getReviewsByStatus(ReviewStatus status, Pageable pageable) {
        return reviewRepository.findByStatusOrderByCreatedAtDesc(status, pageable);
    }

    public Page<Review> getReviewsByProduct(Long productId, Pageable pageable) {
        return reviewRepository.findByProductIdOrderByCreatedAtDesc(productId, pageable);
    }

    public Page<Review> getApprovedReviewsByProduct(Long productId, Pageable pageable) {
        return reviewRepository.findByProductIdAndStatusOrderByCreatedAtDesc(
                productId,
                ReviewStatus.APPROVED,
                pageable
        );
    }

    public Page<Review> searchReviews(String query, Pageable pageable) {
        return reviewRepository.searchReviews(query, pageable);
    }


    public Double getAverageRatingForProduct(Long productId) {
        return reviewRepository.calculateAverageRatingForProduct(productId);
    }

    public long getReviewCountForProduct(Long productId) {
        return reviewRepository.countByProductId(productId);
    }

    public String exportToCSV(ReviewStatus status) {
        return "reviews_export_" + System.currentTimeMillis() + ".csv";
    }
    public Double getAverageRating() {
        Double avg = reviewRepository.findAverageApprovedRating();
        return avg != null ? avg : 0.0;
    }
}