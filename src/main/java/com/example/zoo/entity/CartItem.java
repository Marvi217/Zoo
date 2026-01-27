package com.example.zoo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
    private Product product;
    private Integer quantity;

    /**
     * Returns the unit price for this item, handling BuyXGetY promotions
     */
    public BigDecimal getPrice() {
        if (product == null) {
            return BigDecimal.ZERO;
        }
        // For BuyXGetY, return the effective per-item price
        if (product.isBuyXGetYPromotion()) {
            BigDecimal effectivePrice = product.getBuyXGetYEffectivePrice();
            if (effectivePrice != null) {
                return effectivePrice;
            }
        }
        return product.getPrice();
    }

    /**
     * Returns the total price for this cart item (price * quantity)
     */
    public BigDecimal getTotalPrice() {
        return getPrice().multiply(BigDecimal.valueOf(quantity));
    }

    public BigDecimal getSubtotal() {
        return getTotalPrice();
    }
}