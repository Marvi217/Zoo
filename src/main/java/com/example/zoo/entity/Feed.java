package com.example.zoo.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "feeds")
@EntityListeners(AuditingEntityListener.class)
public class Feed extends Product {

    @Column(name = "for_species")
    private String forSpecies;

    @Column(name = "expiry_date")
    private LocalDate expiryDate;

    @Column(length = 2000)
    private String ingredients;

    private boolean bestseller = false;

    @CreatedBy
    @Column(updatable = false)
    private String createdBy;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;

    public boolean isFresh() {
        if (expiryDate == null) {
            return true;
        }
        return LocalDate.now().isBefore(expiryDate) || LocalDate.now().isEqual(expiryDate);
    }

    public boolean isNearExpiry() {
        if (expiryDate == null) {
            return false;
        }
        return expiryDate.isBefore(LocalDate.now().plusDays(30)) && isFresh();
    }
}