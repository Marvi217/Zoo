package com.example.zoo.service;

import com.example.zoo.dto.CartItemDto;
import com.example.zoo.entity.Product;
import com.example.zoo.exception.InsufficientStockException;
import com.example.zoo.exception.ProductNotFoundException;
import com.example.zoo.valueobject.Money;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@SessionScope
public class CartService {

    private final Map<Long, Integer> cart = new HashMap<>();
    private final ProductService productService;

    public CartService(ProductService productService) {
        this.productService = productService;
    }

    public void addToCart(Long productId) {
        Product product = productService.getProductById(productId);

        if (!product.isAvailable()) {
            throw new InsufficientStockException(
                    product.getName() + " is not available for purchase");
        }

        int currentQty = cart.getOrDefault(productId, 0);
        if (currentQty + 1 > product.getStockQuantity()) {
            throw new InsufficientStockException(
                    product.getName(), currentQty + 1, product.getStockQuantity());
        }

        cart.put(productId, currentQty + 1);
    }

    public void updateQuantity(Long productId, int quantity) {
        if (quantity <= 0) {
            cart.remove(productId);
            return;
        }

        Product product = productService.getProductById(productId);
        if (quantity > product.getStockQuantity()) {
            throw new InsufficientStockException(
                    product.getName(), quantity, product.getStockQuantity());
        }

        cart.put(productId, quantity);
    }

    public void removeFromCart(Long productId) {
        cart.remove(productId);
    }

    public List<CartItemDto> getCartItems() {
        List<CartItemDto> items = new ArrayList<>();

        for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
            try {
                Product product = productService.getProductById(entry.getKey());
                BigDecimal subtotal = product.getPrice()
                        .multiply(BigDecimal.valueOf(entry.getValue()));
                items.add(new CartItemDto(product, entry.getValue(), subtotal));
            } catch (ProductNotFoundException e) {
                cart.remove(entry.getKey());
            }
        }

        return items;
    }

    public BigDecimal getTotalPrice() {
        BigDecimal total = getCartItems().stream()
                .map(CartItemDto::getSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        return new Money(total, "PLN").getAmount();
    }

    public boolean isEmpty() {
        return cart.isEmpty();
    }

    public void clear() {
        cart.clear();
    }

    public Map<Long, Integer> getCartMap() {
        return new HashMap<>(cart);
    }

    public Map<Product, Integer> getProductsInCart() {
        Map<Product, Integer> productsInCart = new HashMap<>();
        for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
            Product product = productService.getProductById(entry.getKey());
            productsInCart.put(product, entry.getValue());
        }
        return productsInCart;
    }
}