package com.example.zoo.entity;

import com.example.zoo.enums.ProductStatus;
import com.example.zoo.enums.PromotionType;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "products")
@Inheritance(strategy = InheritanceType.JOINED)
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String name;

    @Column(length = 2000)
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "brand_id")
    private Brand brand;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    /**
     * Cena promocyjna (opcjonalna, może być null)
     * Jeśli jest ustawiona, nadpisuje obliczenia z promocji
     */
    @Column(name = "discounted_price", precision = 10, scale = 2)
    private BigDecimal discountedPrice;

    @Builder.Default
    @Column(name = "average_rating")
    private Double rating = 0.0;

    /**
     * Główny obraz produktu
     */
    private String imageUrl;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 50, name = "status")
    private ProductStatus status;

    @Builder.Default
    @Column(nullable = false)
    private Integer stockQuantity = 0;

    /**
     * SKU (Stock Keeping Unit) - unikalny identyfikator produktu
     */
    @Column(length = 50, unique = true)
    private String sku;

    @Column(precision = 10, scale = 2)
    private BigDecimal weight;

    /**
     * Wymiary produktu (np. "10x20x30 cm")
     */
    @Column(length = 100)
    private String dimensions;

    @Column(length = 3000)
    private String ingredients;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "subcategory_id")
    private Subcategory subcategory;

    /**
     * Opinie o produkcie
     */
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @Builder.Default
    private List<Review> reviews = new ArrayList<>();

    /**
     * Dodatkowe obrazy produktu
     */
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @OrderBy("displayOrder ASC")
    @Builder.Default
    private List<ProductImage> images = new ArrayList<>();

    /**
     * Promocje przypisane do tego produktu
     */
    @ManyToMany(mappedBy = "products", fetch = FetchType.LAZY)
    @Builder.Default
    private Set<Promotion> promotions = new HashSet<>();

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(nullable = false)
    private LocalDateTime updatedAt;

    // ==================== METODY BIZNESOWE ====================

    /**
     * Zwraca liczbę opinii
     */
    public Integer getReviewCount() {
        return reviews != null ? reviews.size() : 0;
    }

    /**
     * Sprawdza czy produkt jest dostępny
     */
    public boolean isAvailable() {
        // Sprawdzamy czy produkt jest aktywny ORAZ czy mamy go na stanie
        return this.status == ProductStatus.ACTIVE &&
                this.stockQuantity != null &&
                this.stockQuantity > 0;
    }

    /**
     * Zmniejsza stan magazynowy
     */
    public void decreaseStock(int quantity) {
        if (stockQuantity < quantity) {
            throw new IllegalStateException("Niewystarczająca ilość produktu w magazynie. " +
                    "Dostępne: " + stockQuantity + ", wymagane: " + quantity);
        }
        stockQuantity -= quantity;
        if (stockQuantity == 0) {
            status = ProductStatus.SOLDOUT;
        }
    }

    /**
     * Zwiększa stan magazynowy
     */
    public void increaseStock(int quantity) {
        stockQuantity += quantity;
        if (stockQuantity > 0 && status == ProductStatus.SOLDOUT) {
            status = ProductStatus.ACTIVE;
        }
    }

    /**
     * Sprawdza czy produkt ma aktywną promocję
     */
    @Transient
    public boolean isHasDiscount() {
        // Jeśli ustawiono ręcznie cenę promocyjną
        if (discountedPrice != null && discountedPrice.compareTo(price) < 0) {
            return true;
        }

        // Sprawdź czy są aktywne promocje
        return getCurrentPromotion() != null;
    }

    /**
     * Zwraca starą cenę (przed rabatem)
     */
    @Transient
    public BigDecimal getOldPrice() {
        if (isHasDiscount()) {
            return price;
        }
        return null;
    }

    /**
     * Zwraca aktualną cenę do zapłaty (z rabatem jeśli istnieje)
     */
    @Transient
    public BigDecimal getCurrentPrice() {
        // Najpierw sprawdź ręcznie ustawioną cenę promocyjną
        if (discountedPrice != null && discountedPrice.compareTo(price) < 0) {
            return discountedPrice;
        }

        // Potem sprawdź promocje automatyczne
        Promotion promotion = getCurrentPromotion();
        if (promotion != null) {
            return promotion.calculateDiscountedPrice(price);
        }

        // Zwróć normalną cenę
        return price;
    }

    /**
     * Zwraca procent zniżki
     */
    @Transient
    public Integer getDiscountPercent() {
        if (!isHasDiscount()) {
            return 0;
        }

        BigDecimal currentPrice = getCurrentPrice();
        if (currentPrice.compareTo(price) >= 0) {
            return 0;
        }

        BigDecimal discount = price.subtract(currentPrice);
        BigDecimal percent = discount.multiply(new BigDecimal("100"))
                .divide(price, 0, RoundingMode.HALF_UP);
        return percent.intValue();
    }

    /**
     * Zwraca kwotę zaoszczędzoną
     */
    @Transient
    public BigDecimal getSavingsAmount() {
        if (!isHasDiscount()) {
            return BigDecimal.ZERO;
        }
        return price.subtract(getCurrentPrice());
    }

    /**
     * Zwraca aktualnie aktywną promocję o najwyższym priorytecie.
     * Tylko promocje automatyczne (bez kodu, typ PERCENTAGE_DISCOUNT lub BUY_X_GET_Y).
     * FIXED_AMOUNT_DISCOUNT i promocje z kodem są stosowane tylko w checkout.
     */
    @Transient
    public Promotion getCurrentPromotion() {
        if (promotions == null || promotions.isEmpty()) {
            return null;
        }

        return promotions.stream()
                .filter(Promotion::isCurrentlyActive)
                // Tylko promocje automatyczne: bez kodu i typ PERCENTAGE_DISCOUNT lub BUY_X_GET_Y
                .filter(p -> (p.getCode() == null || p.getCode().isEmpty()) &&
                             (p.getType() == PromotionType.PERCENTAGE_DISCOUNT || 
                              p.getType() == PromotionType.BUY_X_GET_Y))
                .max((p1, p2) -> {
                    // Porównaj po priorytecie
                    int priorityCompare = Integer.compare(p1.getPriority(), p2.getPriority());
                    if (priorityCompare != 0) {
                        return priorityCompare;
                    }
                    // Jeśli priorytet równy, wybierz większą zniżkę
                    BigDecimal discount1 = p1.calculateDiscount(price);
                    BigDecimal discount2 = p2.calculateDiscount(price);
                    return discount1.compareTo(discount2);
                })
                .orElse(null);
    }

    /**
     * Zwraca skrócony opis
     */
    @Transient
    public String getShortDescription() {
        if (description == null || description.isEmpty()) {
            return "";
        }
        return description.length() > 100 ?
                description.substring(0, 97) + "..." :
                description;
    }

    /**
     * Zwraca krótki opis dla kart produktu
     */
    @Transient
    public String getCardDescription() {
        if (description == null || description.isEmpty()) {
            return "";
        }
        return description.length() > 60 ?
                description.substring(0, 57) + "..." :
                description;
    }

    /**
     * Sprawdza czy stan magazynowy jest niski
     */
    @Transient
    public boolean isLowStock() {
        return stockQuantity > 0 && stockQuantity <= 10;
    }

    /**
     * Zwraca status stanu magazynowego jako tekst
     */
    @Transient
    public String getStockStatus() {
        if (stockQuantity == 0) {
            return "Brak w magazynie";
        } else if (stockQuantity <= 10) {
            return "Ostatnie sztuki: " + stockQuantity;
        } else if (stockQuantity <= 50) {
            return "Dostępne";
        } else {
            return "Na stanie";
        }
    }

    /**
     * Zwraca główny obraz lub pierwszy z listy obrazów
     */
    @Transient
    public String getMainImageUrl() {
        if (imageUrl != null && !imageUrl.isEmpty()) {
            return imageUrl;
        }

        if (images != null && !images.isEmpty()) {
            return images.stream()
                    .filter(ProductImage::isMain)
                    .findFirst()
                    .map(ProductImage::getImageUrl)
                    .orElseGet(() -> images.get(0).getImageUrl());
        }

        return "/images/no-image.png";
    }

    /**
     * Dodaje obraz do produktu
     */
    public void addImage(ProductImage image) {
        if (images == null) {
            images = new ArrayList<>();
        }
        images.add(image);
        image.setProduct(this);
    }

    /**
     * Usuwa obraz z produktu
     */
    public void removeImage(ProductImage image) {
        if (images != null) {
            images.remove(image);
            image.setProduct(null);
        }
    }

    /**
     * Dodaje opinię do produktu
     */
    public void addReview(Review review) {
        if (reviews == null) {
            reviews = new ArrayList<>();
        }
        reviews.add(review);
        review.setProduct(this);
        recalculateRating();
    }

    /**
     * Przelicza średnią ocenę na podstawie opinii
     */
    public void recalculateRating() {
        if (reviews == null || reviews.isEmpty()) {
            this.rating = 0.0;
            return;
        }

        double sum = reviews.stream()
                .mapToInt(Review::getRating)
                .sum();
        this.rating = sum / reviews.size();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product)) return false;
        Product product = (Product) o;
        return id != null && id.equals(product.getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", stockQuantity=" + stockQuantity +
                ", status=" + status +
                '}';
    }
}