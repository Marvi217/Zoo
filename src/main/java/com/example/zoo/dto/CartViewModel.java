package com.example.zoo.dto;

import com.example.zoo.entity.CartItem;
import java.math.BigDecimal;
import java.util.List;

public class CartViewModel {
    private final List<CartItem> items;
    private final BigDecimal subtotal;
    private final BigDecimal deliveryCost;
    private final BigDecimal totalAmount;

    private static final BigDecimal FREE_SHIPPING_THRESHOLD = new BigDecimal("200");
    private static final BigDecimal STANDARD_DELIVERY_COST = new BigDecimal("15");

    public CartViewModel(List<CartItem> items, BigDecimal subtotal) {
        this.items = items;
        this.subtotal = subtotal;
        this.deliveryCost = calculateDeliveryCost(subtotal);
        this.totalAmount = subtotal.add(this.deliveryCost);
    }

    private BigDecimal calculateDeliveryCost(BigDecimal subtotal) {
        if (subtotal.compareTo(FREE_SHIPPING_THRESHOLD) >= 0) {
            return BigDecimal.ZERO;
        }
        return STANDARD_DELIVERY_COST;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public BigDecimal getDeliveryCost() {
        return deliveryCost;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }
}
