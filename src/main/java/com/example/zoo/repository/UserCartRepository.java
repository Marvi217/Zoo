package com.example.zoo.repository;

import com.example.zoo.entity.User;
import com.example.zoo.entity.UserCart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserCartRepository extends JpaRepository<UserCart, Long> {
    Optional<UserCart> findByUser(User user);
    Optional<UserCart> findByUserId(Long userId);
}