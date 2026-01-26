package com.example.zoo.service;

import com.example.zoo.dto.ProductSearchDto;
import com.example.zoo.entity.Category;
import com.example.zoo.entity.Product;
import com.example.zoo.entity.SearchHistory;
import com.example.zoo.entity.User;
import com.example.zoo.repository.ProductRepository;
import com.example.zoo.repository.SearchHistoryRepository;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class SearchService {

    private final ProductRepository productRepository;
    private final SearchHistoryRepository searchHistoryRepository;
    private final CategoryService categoryService;

    public List<Product> searchProducts(ProductSearchDto searchDto) {
        return productRepository.searchProducts(
                searchDto.getQuery(),
                searchDto.getCategoryId(),
                searchDto.getMinPrice(),
                searchDto.getMaxPrice(),
                searchDto.getAvailableOnly()
        );
    }

    public List<Product> quickSearch(String query) {
        if (query == null || query.trim().isEmpty()) {
            return List.of();
        }
        return productRepository.findByNameContainingIgnoreCase(query.trim());
    }

    /**
     * Record a search query in history
     */
    @Transactional
    public void recordSearch(String query, User user, String sessionId) {
        if (query == null || query.trim().length() < 2) return;

        String normalizedQuery = query.trim().toLowerCase();

        Optional<SearchHistory> existingSearch;
        if (user != null) {
            existingSearch = searchHistoryRepository.findByUserAndQueryIgnoreCase(user, normalizedQuery);
        } else {
            existingSearch = searchHistoryRepository.findBySessionIdAndQueryIgnoreCase(sessionId, normalizedQuery);
        }

        if (existingSearch.isPresent()) {
            SearchHistory history = existingSearch.get();
            history.incrementSearchCount();
            searchHistoryRepository.save(history);
        } else {
            SearchHistory history = SearchHistory.builder()
                    .query(normalizedQuery)
                    .user(user)
                    .sessionId(user == null ? sessionId : null)
                    .searchCount(1L)
                    .build();
            searchHistoryRepository.save(history);
        }
    }

    /**
     * Get search suggestions based on query prefix
     * Priority: User history > Popular searches > Product matches > Category matches
     */
    public List<SearchSuggestion> getSuggestions(String query, User user, String sessionId) {
        if (query == null || query.trim().length() < 2) {
            return List.of();
        }

        String prefix = query.trim().toLowerCase();
        List<SearchSuggestion> suggestions = new ArrayList<>();
        Set<String> addedQueries = new HashSet<>();

        // 1. User's search history (if logged in)
        if (user != null) {
            List<SearchHistory> userHistory = searchHistoryRepository.findUserSearchHistoryByPrefix(
                    user, prefix, PageRequest.of(0, 3));
            for (SearchHistory history : userHistory) {
                if (addedQueries.add(history.getQuery().toLowerCase())) {
                    suggestions.add(new SearchSuggestion(
                            history.getQuery(),
                            "HISTORIA",
                            "/search/quick?q=" + history.getQuery(),
                            "history"
                    ));
                }
            }
        } else if (sessionId != null) {
            // Session-based history for anonymous users
            List<SearchHistory> sessionHistory = searchHistoryRepository.findSessionSearchHistoryByPrefix(
                    sessionId, prefix, PageRequest.of(0, 3));
            for (SearchHistory history : sessionHistory) {
                if (addedQueries.add(history.getQuery().toLowerCase())) {
                    suggestions.add(new SearchSuggestion(
                            history.getQuery(),
                            "HISTORIA",
                            "/search/quick?q=" + history.getQuery(),
                            "history"
                    ));
                }
            }
        }

        // 2. Popular searches (global)
        List<Object[]> popularSearches = searchHistoryRepository.findPopularSearchesByPrefix(
                prefix, PageRequest.of(0, 5));
        for (Object[] result : popularSearches) {
            String popularQuery = (String) result[0];
            if (addedQueries.add(popularQuery.toLowerCase())) {
                suggestions.add(new SearchSuggestion(
                        popularQuery,
                        "POPULARNE",
                        "/search/quick?q=" + popularQuery,
                        "popular"
                ));
            }
            if (suggestions.size() >= 8) break;
        }

        // 3. Category matches
        List<Category> categories = categoryService.getAllCategories();
        for (Category category : categories) {
            if (category.getName().toLowerCase().contains(prefix) &&
                    addedQueries.add("cat:" + category.getSlug())) {
                suggestions.add(new SearchSuggestion(
                        category.getName(),
                        "KATEGORIA",
                        "/category/" + category.getSlug(),
                        "category"
                ));
            }
            if (suggestions.size() >= 10) break;
        }

        // 4. Product matches
        List<Product> products = productRepository.findByNameContainingIgnoreCase(prefix);
        for (Product product : products.stream().limit(5).toList()) {
            if (addedQueries.add("prod:" + product.getId())) {
                String priceStr = product.getCurrentPrice() != null ?
                        String.format("%.2f zł", product.getCurrentPrice()) : "";
                suggestions.add(new SearchSuggestion(
                        product.getName(),
                        priceStr,
                        "/product/" + product.getId(),
                        "product"
                ));
            }
            if (suggestions.size() >= 12) break;
        }

        return suggestions.stream().limit(10).collect(Collectors.toList());
    }

        public record SearchSuggestion(String name, String type, String url, String icon) {
    }
}