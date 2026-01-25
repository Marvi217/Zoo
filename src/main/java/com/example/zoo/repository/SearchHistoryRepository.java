package com.example.zoo.repository;

import com.example.zoo.entity.SearchHistory;
import com.example.zoo.entity.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SearchHistoryRepository extends JpaRepository<SearchHistory, Long> {

    // Find by user and query
    Optional<SearchHistory> findByUserAndQueryIgnoreCase(User user, String query);
    
    // Find by session and query
    Optional<SearchHistory> findBySessionIdAndQueryIgnoreCase(String sessionId, String query);

    // Get popular searches (global) - most searched queries
    @Query("SELECT sh.query, SUM(sh.searchCount) as totalCount FROM SearchHistory sh " +
           "GROUP BY LOWER(sh.query) " +
           "ORDER BY totalCount DESC")
    List<Object[]> findPopularSearches(Pageable pageable);

    // Get popular searches matching a prefix
    @Query("SELECT sh.query, SUM(sh.searchCount) as totalCount FROM SearchHistory sh " +
           "WHERE LOWER(sh.query) LIKE LOWER(CONCAT(:prefix, '%')) " +
           "GROUP BY LOWER(sh.query) " +
           "ORDER BY totalCount DESC")
    List<Object[]> findPopularSearchesByPrefix(@Param("prefix") String prefix, Pageable pageable);

    // Get user's search history
    @Query("SELECT sh FROM SearchHistory sh " +
           "WHERE sh.user = :user " +
           "ORDER BY sh.updatedAt DESC")
    List<SearchHistory> findUserSearchHistory(@Param("user") User user, Pageable pageable);

    // Get user's search history matching a prefix
    @Query("SELECT sh FROM SearchHistory sh " +
           "WHERE sh.user = :user " +
           "AND LOWER(sh.query) LIKE LOWER(CONCAT(:prefix, '%')) " +
           "ORDER BY sh.updatedAt DESC")
    List<SearchHistory> findUserSearchHistoryByPrefix(@Param("user") User user, @Param("prefix") String prefix, Pageable pageable);

    // Get session search history matching a prefix
    @Query("SELECT sh FROM SearchHistory sh " +
           "WHERE sh.sessionId = :sessionId " +
           "AND LOWER(sh.query) LIKE LOWER(CONCAT(:prefix, '%')) " +
           "ORDER BY sh.updatedAt DESC")
    List<SearchHistory> findSessionSearchHistoryByPrefix(@Param("sessionId") String sessionId, @Param("prefix") String prefix, Pageable pageable);

    // Delete old session-based history
    @Query("DELETE FROM SearchHistory sh WHERE sh.sessionId IS NOT NULL AND sh.user IS NULL AND sh.updatedAt < :beforeDate")
    void deleteOldSessionHistory(@Param("beforeDate") java.time.LocalDateTime beforeDate);
}
