package com.example.zoo.enums;

import lombok.Getter;

@Getter
public enum PromotionType {
    PERCENTAGE_DISCOUNT("Rabat procentowy", "Obniżka ceny o określony procent"),
    FIXED_AMOUNT_DISCOUNT("Rabat kwotowy", "Obniżka ceny o określoną kwotę"),
    FREE_SHIPPING("Darmowa dostawa", "Bezpłatna wysyłka przy spełnieniu warunków"),
    BUY_X_GET_Y("Kup X, otrzymaj Y", "Promocja typu kup X produktów, otrzymaj Y gratis"),
    BUNDLE_DISCOUNT("Rabat na zestaw", "Zniżka przy zakupie zestawu produktów");

    private final String displayName;
    private final String description;

    PromotionType(String displayName, String description) {
        this.displayName = displayName;
        this.description = description;
    }

}