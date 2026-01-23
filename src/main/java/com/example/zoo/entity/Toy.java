package com.example.zoo.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "toys")
public class Toy extends Product {

    @Column(length = 100)
    private String material;

    @Column(name = "age_group", length = 50)
    private String ageGroup;

    public boolean isSuitableForYoung() {
        return ageGroup != null &&
                (ageGroup.contains("SZCZENIĘ") ||
                        ageGroup.contains("WSZYSTKIE") ||
                        ageGroup.equalsIgnoreCase("YOUNG"));
    }

    public boolean isNaturalMaterial() {
        if (material == null) {
            return false;
        }
        String mat = material.toUpperCase();
        return mat.contains("GUMA_NATURALNA") ||
                mat.contains("BAWEŁNA") ||
                mat.contains("DREWNO") ||
                mat.contains("SIZAL");
    }
}