package com.example.zoo.dto;

import com.example.zoo.entity.Product;
import java.math.BigDecimal;

public class CartItemDto {
    private Product product;
    private Integer quantity;
    private BigDecimal subtotal;

    public CartItemDto(Product product, Integer quantity, BigDecimal subtotal) {
        this.product = product;
        this.quantity = quantity;
        this.subtotal = subtotal;
    }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public BigDecimal getSubtotal() { return subtotal; }
    public void setSubtotal(BigDecimal subtotal) { this.subtotal = subtotal; }
    public BigDecimal getTotalPrice() {
        return this.product.getPrice().multiply(BigDecimal.valueOf(quantity));
    }
}