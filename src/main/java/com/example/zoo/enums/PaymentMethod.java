package com.example.zoo.enums;

import lombok.Getter;

@Getter
public enum PaymentMethod {
    TRANSFER("Przelew bankowy"),
    CARD("Karta płatnicza"),
    BLIK("BLIK"),
    CASH_ON_DELIVERY("Płatność przy odbiorze");

    private final String displayName;

    PaymentMethod(String displayName) {
        this.displayName = displayName;
    }
}