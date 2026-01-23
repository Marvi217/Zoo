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

    /**
     * Dodaj lub usuń produkt z wishlisty (toggle)
     * @return true jeśli dodano, false jeśli usunięto
     */
    @Transactional
    public boolean toggleProduct(Long userId, Long productId) {
        if (wishlistRepository.existsByUserIdAndProductId(userId, productId)) {
            // Produkt jest w wishlist - usuń go
            wishlistRepository.deleteByUserIdAndProductId(userId, productId);
            return false;
        } else {
            // Produktu nie ma - dodaj go
            addToWishlist(userId, productId);
            return true;
        }
    }

    @Transactional
    public Wishlist addToWishlist(Long userId, Long productId) {
        // Sprawdź czy już nie istnieje
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

    /**
     * Usuń produkt z wishlisty
     */
    @Transactional
    public void removeFromWishlist(Long userId, Long productId) {
        wishlistRepository.deleteByUserIdAndProductId(userId, productId);
    }

    /**
     * Pobierz wszystkie ulubione produkty użytkownika
     */
    public List<Product> getUserWishlistProducts(Long userId) {
        return wishlistRepository.findByUserIdWithProducts(userId)
                .stream()
                .map(Wishlist::getProduct)
                .collect(Collectors.toList());
    }

    /**
     * Sprawdź czy produkt jest w wishlist użytkownika
     */
    public boolean isInWishlist(Long userId, Long productId) {
        return wishlistRepository.existsByUserIdAndProductId(userId, productId);
    }

    /**
     * Pobierz ID wszystkich produktów w wishlist użytkownika
     * Przydatne do sprawdzania wielu produktów naraz (np. na liście)
     */
    public Set<Long> getUserWishlistProductIds(Long userId) {
        return wishlistRepository.findProductIdsByUserId(userId);
    }

    /**
     * Zlicz produkty w wishlist użytkownika
     */
    public long getWishlistCount(Long userId) {
        return wishlistRepository.countByUserId(userId);
    }

    /**
     * Wyczyść całą wishlistę użytkownika
     */
    @Transactional
    public void clearWishlist(Long userId) {
        wishlistRepository.deleteByUserId(userId);
    }

    /**
     * Sprawdź które produkty z listy są w wishlist
     * Zwraca mapę: productId -> isInWishlist
     */
    public Set<Long> checkProductsInWishlist(Long userId, List<Long> productIds) {
        Set<Long> wishlistProductIds = getUserWishlistProductIds(userId);
        return productIds.stream()
                .filter(wishlistProductIds::contains)
                .collect(Collectors.toSet());
    }
}