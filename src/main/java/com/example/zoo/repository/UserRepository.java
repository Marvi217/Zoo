package com.example.zoo.repository;

import com.example.zoo.entity.User;
import com.example.zoo.enums.UserRole;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findAllByOrderByCreatedAtDesc();

    @Query("SELECT u FROM User u WHERE " +
            "(:role IS NULL OR u.role = :role) AND " +
            "(:active IS NULL OR u.active = :active)")
    Page<User> filterUsers(@Param("role") UserRole role, @Param("active") Boolean active, Pageable pageable);

    Optional<User> findByEmail(String email);

    boolean existsByEmail(String email);

    long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);

    long countByActiveTrue();

    @Query("SELECT u FROM User u WHERE " +
            "LOWER(u.email) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(u.firstName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(u.lastName) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<User> searchUsers(@Param("query") String query, Pageable pageable);

    @Query("SELECT u FROM User u WHERE u.role = :role")
    Page<User> findByRole(@Param("role") UserRole role, Pageable pageable);

    @Query("SELECT u FROM User u WHERE CAST(u.role AS string) = :role")
    Page<User> findByRoleName(@Param("role") String role, Pageable pageable);

    List<User> findByActiveTrue();

    List<User> findByActiveFalse();

    Page<User> findByActive(boolean active, Pageable pageable);

    @Query("SELECT u FROM User u WHERE u.id NOT IN " +
            "(SELECT DISTINCT o.user.id FROM Order o WHERE o.user IS NOT NULL)")
    List<User> findUsersWithoutOrders();

    Optional<User> findByActivationCode(String activationCode);
}