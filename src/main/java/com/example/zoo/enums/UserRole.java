package com.example.zoo.enums;

import lombok.Getter;

@Getter
public enum UserRole {
    USER("Użytkownik"),
    ADMIN("Administrator"),
    SUPERUSER("Superużytkownik");

    private final String displayName;

    UserRole(String displayName) {
        this.displayName = displayName;
    }

    public String getAuthority() {
        return "ROLE_" + this.name();
    }
}