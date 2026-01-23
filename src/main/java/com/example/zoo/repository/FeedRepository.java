package com.example.zoo.repository;

import com.example.zoo.entity.Feed;
import org.jspecify.annotations.Nullable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FeedRepository extends JpaRepository<Feed, Long> {

    List<Feed> findByCategoryId(Long categoryId);

    List<Feed> findByForSpecies(String species);

    List<Feed> findByPriceLessThanEqual(Double price);

    Optional<Feed> findById(Long id);

    @Nullable Feed getFeedById(Long id);
}