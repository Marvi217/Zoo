package com.example.zoo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@Table(name = "categories")
@NoArgsConstructor
@AllArgsConstructor
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String name;

    @Column(nullable = false, unique = true, length = 100)
    private String slug;

    @Column(length = 50)
    private String icon;

    @Column(length = 500)
    private String description;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(nullable = false)
    private boolean active = true;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    private List<Subcategory> subcategories = new ArrayList<>();

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    private List<Product> products = new ArrayList<>();

    public Category(String name, String slug, String icon, String description) {
        this.name = name;
        this.slug = slug;
        this.icon = icon;
        this.description = description;
        this.subcategories = new ArrayList<>();
        this.products = new ArrayList<>();
    }

    public Category(String name, String slug, String icon) {
        this(name, slug, icon, null);
    }

    public void addSubcategory(Subcategory subcategory) {
        subcategories.add(subcategory);
        subcategory.setCategory(this);
    }

    public void removeSubcategory(Subcategory subcategory) {
        subcategories.remove(subcategory);
        subcategory.setCategory(null);
    }

    public int getSubcategoryCount() {
        return subcategories != null ? subcategories.size() : 0;
    }

    public boolean hasSubcategories() {
        return subcategories != null && !subcategories.isEmpty();
    }

    // Metody dla products (pozostają bez zmian)
    public void addProduct(Product product) {
        products.add(product);
        product.setCategory(this);
    }

    public void removeProduct(Product product) {
        products.remove(product);
        product.setCategory(null);
    }

    public int getProductCount() {
        return products != null ? products.size() : 0;
    }

    public long getAvailableProductCount() {
        if (products == null) {
            return 0;
        }
        return products.stream()
                .filter(Product::isAvailable)
                .count();
    }

    public boolean hasProducts() {
        return products != null && !products.isEmpty();
    }

    public List<Product> getAvailableProducts() {
        if (products == null) {
            return new ArrayList<>();
        }
        return products.stream()
                .filter(Product::isAvailable)
                .toList();
    }

    public static String generateSlug(String name) {
        if (name == null) {
            return "";
        }
        return name.toLowerCase()
                .replace("ą", "a")
                .replace("ć", "c")
                .replace("ę", "e")
                .replace("ł", "l")
                .replace("ń", "n")
                .replace("ó", "o")
                .replace("ś", "s")
                .replace("ź", "z")
                .replace("ż", "z")
                .replaceAll("[^a-z0-9]+", "-")
                .replaceAll("^-|-$", "");
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Category)) return false;
        Category category = (Category) o;
        return id != null && id.equals(category.getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}