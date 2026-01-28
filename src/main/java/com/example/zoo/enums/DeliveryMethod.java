package com.example.zoo.enums;


import lombok.Getter;

import java.math.BigDecimal;

@Getter
public enum DeliveryMethod {
    PICKUP("Odbiór osobisty w sklepie", new BigDecimal("0.00")),
    LOCKER("Kurier InPost", new BigDecimal("12.99")),
    //KurierDPD
    COURIER("Kurier InPost", new BigDecimal("18.50"));

    private final String description;
    private final BigDecimal price;

    DeliveryMethod(String description, BigDecimal price) {
        this.description = description;
        this.price = price;
    }

}