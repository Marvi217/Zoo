package com.example.zoo.repository;

import com.example.zoo.entity.User;
import com.example.zoo.entity.UserAddress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserAddressRepository extends JpaRepository<UserAddress, Long> {

    /**
     * Znajdź wszystkie adresy użytkownika
     */
    List<UserAddress> findByUserOrderByIsDefaultDescIdDesc(User user);

    /**
     * Znajdź domyślny adres użytkownika
     */
    Optional<UserAddress> findByUserAndIsDefaultTrue(User user);

    /**
     * Znajdź adres użytkownika po ID
     */
    Optional<UserAddress> findByIdAndUser(Long id, User user);

    /**
     * Usuń wszystkie domyślne adresy użytkownika (przed ustawieniem nowego)
     */
    @Modifying
    @Query("UPDATE UserAddress ua SET ua.isDefault = false WHERE ua.user = :user")
    void clearDefaultForUser(@Param("user") User user);

    /**
     * Policz adresy użytkownika
     */
    long countByUser(User user);
}