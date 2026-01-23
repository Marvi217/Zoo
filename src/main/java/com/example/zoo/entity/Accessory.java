package com.example.zoo.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "accessories")
public class Accessory extends Product {

    @Column(length = 100)
    private String material;

    @Column(length = 20)
    private String size;

    public boolean isForLargeAnimals() {
        return size != null &&
                (size.contains("L") || size.contains("XL"));
    }

    public boolean isForSmallAnimals() {
        return size != null &&
                (size.equals("S") || size.equals("XS"));
    }

    public boolean isEasyToClean() {
        if (material == null) {
            return false;
        }
        String mat = material.toUpperCase();
        return mat.contains("PLASTIK") ||
                mat.contains("STAL") ||
                mat.contains("CERAMIKA") ||
                mat.contains("SILIKON");
    }

    public boolean isWashable() {
        if (material == null) {
            return false;
        }
        String mat = material.toUpperCase();
        return mat.contains("PLUSZ") ||
                mat.contains("BAWEŁNA") ||
                mat.contains("NYLON") ||
                mat.contains("MEMORY_FOAM");
    }
}