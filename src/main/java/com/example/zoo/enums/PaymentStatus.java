package com.example.zoo.enums;

public enum PaymentStatus {
    PENDING("Oczekuje na płatność", "Płatność nie została jeszcze dokonana"),
    PROCESSING("Przetwarzanie", "Płatność jest przetwarzana"),
    PAID("Opłacone", "Płatność została zrealizowana pomyślnie"),
    FAILED("Nieudana", "Płatność nie powiodła się"),
    CANCELLED("Anulowana", "Płatność została anulowana"),
    REFUNDED("Zwrócono", "Pieniądze zostały zwrócone klientowi"),
    PARTIALLY_REFUNDED("Częściowy zwrot", "Część kwoty została zwrócona"),
    CHARGEBACK("Chargeback", "Klient zgłosił reklamację do banku");

    private final String displayName;
    private final String description;

    PaymentStatus(String displayName, String description) {
        this.displayName = displayName;
        this.description = description;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getDescription() {
        return description;
    }

    /**
     * Sprawdza czy płatność została pomyślnie zrealizowana
     */
    public boolean isSuccessful() {
        return this == PAID;
    }

    /**
     * Sprawdza czy płatność wymaga działania
     */
    public boolean requiresAction() {
        return this == PENDING || this == PROCESSING || this == FAILED;
    }

    /**
     * Sprawdza czy można dokonać zwrotu
     */
    public boolean isRefundable() {
        return this == PAID;
    }

    /**
     * Zwraca kolor do wyświetlania w interfejsie
     */
    public String getColor() {
        switch (this) {
            case PENDING:
            case PROCESSING:
                return "warning";
            case PAID:
                return "success";
            case FAILED:
            case CANCELLED:
            case CHARGEBACK:
                return "danger";
            case REFUNDED:
            case PARTIALLY_REFUNDED:
                return "info";
            default:
                return "secondary";
        }
    }

    /**
     * Zwraca ikonę Font Awesome
     */
    public String getIcon() {
        switch (this) {
            case PENDING:
                return "fa-clock";
            case PROCESSING:
                return "fa-spinner";
            case PAID:
                return "fa-check-circle";
            case FAILED:
                return "fa-times-circle";
            case CANCELLED:
                return "fa-ban";
            case REFUNDED:
            case PARTIALLY_REFUNDED:
                return "fa-undo";
            case CHARGEBACK:
                return "fa-exclamation-triangle";
            default:
                return "fa-question-circle";
        }
    }
}