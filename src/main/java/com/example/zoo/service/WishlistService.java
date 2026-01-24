package com.example.zoo.service;

import com.example.zoo.entity.Product;
import com.example.zoo.entity.User;
import com.example.zoo.entity.Wishlist;
import com.example.zoo.repository.ProductRepository;
import com.example.zoo.repository.WishlistRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class WishlistService {

    private final WishlistRepository wishlistRepository;
    private final ProductRepository productRepository;

    @Transactional
    public boolean toggleProduct(Long userId, Long productId) {
        if (wishlistRepository.existsByUserIdAndProductId(userId, productId)) {
            wishlistRepository.deleteByUserIdAndProductId(userId, productId);
            return false;
        } else {
            addToWishlist(userId, productId);
            return true;
        }
    }

    @Transactional
    public Wishlist addToWishlist(Long userId, Long productId) {
        if (wishlistRepository.existsByUserIdAndProductId(userId, productId)) {
            throw new IllegalStateException("Produkt już jest w ulubionych");
        }

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Produkt nie istnieje"));

        Wishlist wishlist = new Wishlist();
        wishlist.setUser(new User());
        wishlist.getUser().setId(userId);
        wishlist.setProduct(product);

        return wishlistRepository.save(wishlist);
    }

    @Transactional
    public void removeFromWishlist(Long userId, Long productId) {
        wishlistRepository.deleteByUserIdAndProductId(userId, productId);
    }

    public List<Product> getUserWishlistProducts(Long userId) {
        return wishlistRepository.findByUserIdWithProducts(userId)
                .stream()
                .map(Wishlist::getProduct)
                .collect(Collectors.toList());
    }

    public boolean isInWishlist(Long userId, Long productId) {
        return wishlistRepository.existsByUserIdAndProductId(userId, productId);
    }

    public Set<Long> getUserWishlistProductIds(Long userId) {
        return wishlistRepository.findProductIdsByUserId(userId);
    }

    public long getWishlistCount(Long userId) {
        return wishlistRepository.countByUserId(userId);
    }

    @Transactional
    public void clearWishlist(Long userId) {
        wishlistRepository.deleteByUserId(userId);
    }

    public Set<Long> checkProductsInWishlist(Long userId, List<Long> productIds) {
        Set<Long> wishlistProductIds = getUserWishlistProductIds(userId);
        return productIds.stream()
                .filter(wishlistProductIds::contains)
                .collect(Collectors.toSet());
    }
}