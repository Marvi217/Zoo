package com.example.zoo.enums;

import lombok.Getter;

@Getter
public enum ReviewStatus {
    PENDING("Oczekuje na moderację", "Opinia została dodana i czeka na zatwierdzenie przez moderatora"),
    APPROVED("Zatwierdzona", "Opinia została zatwierdzona i jest widoczna publicznie"),
    REJECTED("Odrzucona", "Opinia została odrzucona przez moderatora");

    private final String displayName;
    private final String description;

    ReviewStatus(String displayName, String description) {
        this.displayName = displayName;
        this.description = description;
    }

    public boolean isPublic() {
        return this == APPROVED;
    }

    public boolean requiresModeration() {
        return this == PENDING;
    }

    public String getColor() {
        return switch (this) {
            case PENDING -> "warning";
            case APPROVED -> "success";
            case REJECTED -> "danger";
            default -> "secondary";
        };
    }

    public String getIcon() {
        return switch (this) {
            case PENDING -> "fa-clock";
            case APPROVED -> "fa-check-circle";
            case REJECTED -> "fa-times-circle";
            default -> "fa-question-circle";
        };
    }
}