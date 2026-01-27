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
     * Returns the unit price for this item (regular price, not considering BuyXGetY)
     */
    public BigDecimal getPrice() {
        if (product == null) {
            return BigDecimal.ZERO;
        }
        return product.getPrice();
    }

    /**
     * Returns the total price for this cart item, properly handling BuyXGetY promotions.
     *
     * BuyXGetY logic:
     * - Promotion applies only when quantity >= (buyQty + getQty)
     * - Only ONE promotion can be applied per transaction (limit 1)
     * - Example: Buy 3 Get 1 free, price 100 zł
     *   - 1 item = 100 zł (no promo)
     *   - 2 items = 200 zł (no promo)
     *   - 3 items = 300 zł (no promo, need 4 items for promo)
     *   - 4 items = 300 zł (promo applied: pay for 3, get 4)
     *   - 5 items = 400 zł (promo applied once: 300 for 4 + 100 for 1)
     *   - 8 items = 700 zł (promo applied once: 300 for 4 + 400 for remaining 4)
     */
    public BigDecimal getTotalPrice() {
        if (product == null || quantity == null || quantity <= 0) {
            return BigDecimal.ZERO;
        }

        BigDecimal unitPrice = product.getPrice();

        // Check if BuyXGetY promotion applies
        if (product.isBuyXGetYPromotion()) {
            Integer buyQty = product.getBuyXGetYBuyQuantity();
            Integer totalQty = product.getBuyXGetYTotalQuantity();

            if (buyQty != null && totalQty != null && totalQty > 0 && quantity >= totalQty) {
                // Promotion applies - but only once per transaction
                // Pay for buyQty items, get totalQty items (one bundle)
                // Remaining items after the bundle are at regular price

                int remainingItems = quantity - totalQty;
                BigDecimal promoPrice = unitPrice.multiply(BigDecimal.valueOf(buyQty)); // Price for the promo bundle
                BigDecimal regularPrice = unitPrice.multiply(BigDecimal.valueOf(remainingItems)); // Price for remaining

                return promoPrice.add(regularPrice);
            }
        }

        // Regular pricing (no promo or quantity below threshold)
        return unitPrice.multiply(BigDecimal.valueOf(quantity));
    }

    public BigDecimal getSubtotal() {
        return getTotalPrice();
    }

    /**
     * Returns true if BuyXGetY promotion is currently active for this cart item
     */
    public boolean isPromoApplied() {
        if (product == null || !product.isBuyXGetYPromotion()) {
            return false;
        }
        Integer totalQty = product.getBuyXGetYTotalQuantity();
        return totalQty != null && quantity >= totalQty;
    }
}