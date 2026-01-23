package com.example.zoo.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "supplements")
public class Supplement extends Product {

    @Column(length = 500)
    private String dosage;

    @Column(name = "expiry_date")
    private LocalDate expiryDate;

    public boolean isValid() {
        if (expiryDate == null) {
            return true;
        }
        return LocalDate.now().isBefore(expiryDate) || LocalDate.now().isEqual(expiryDate);
    }
    public boolean isNearExpiry() {
        if (expiryDate == null) {
            return false;
        }
        return expiryDate.isBefore(LocalDate.now().plusDays(60)) && isValid();
    }

    public long getDaysUntilExpiry() {
        if (expiryDate == null) {
            return Long.MAX_VALUE;
        }
        return java.time.temporal.ChronoUnit.DAYS.between(LocalDate.now(), expiryDate);
    }

    public boolean isDailyDosage() {
        if (dosage == null) {
            return false;
        }
        String d = dosage.toLowerCase();
        return d.contains("dziennie") || d.contains("daily") || d.contains("per day");
    }
}