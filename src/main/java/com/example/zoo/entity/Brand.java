package com.example.zoo.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Data
@Entity
@Builder // Dodajemy, aby ułatwić tworzenie obiektów
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "brands")
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(nullable = false, unique = true)
    private String slug;

    @Column(columnDefinition = "TEXT")
    private String description; // Dodano

    @Builder.Default
    private boolean active = true; // Dodano

    private String logoUrl; // Dodano
    private String website; // Dodano
    private String country; // Dodano

    @OneToMany(mappedBy = "brand")
    @ToString.Exclude // Ważne przy @Data, zapobiega zapętleniu toString
    private List<Product> products;
}