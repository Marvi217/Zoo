package com.example.zoo.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "product_images")
public class ProductImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    /**
     * URL obrazu
     */
    @Column(nullable = false, length = 500)
    private String imageUrl;

    /**
     * Czy to jest główny obraz produktu
     */
    @Builder.Default
    @Column(nullable = false)
    private boolean isMain = false;

    /**
     * Kolejność wyświetlania (niższa liczba = wyższy priorytet)
     */
    @Builder.Default
    @Column(nullable = false)
    private Integer displayOrder = 0;

    /**
     * Tekst alternatywny dla obrazu (SEO, accessibility)
     */
    @Column(length = 200)
    private String altText;

    /**
     * Tytuł obrazu
     */
    @Column(length = 200)
    private String title;

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private LocalDateTime uploadedAt;

    /**
     * Rozmiar pliku w bajtach
     */
    private Long fileSize;

    /**
     * Typ MIME obrazu
     */
    @Column(length = 50)
    private String mimeType;

    /**
     * Szerokość obrazu w pikselach
     */
    private Integer width;

    /**
     * Wysokość obrazu w pikselach
     */
    private Integer height;

    /**
     * URL miniatury (opcjonalny)
     */
    @Column(length = 500)
    private String thumbnailUrl;

    // ==================== METODY BIZNESOWE ====================

    /**
     * Zwraca nazwę pliku z URL
     */
    @Transient
    public String getFileName() {
        if (imageUrl == null) {
            return null;
        }
        int lastSlash = imageUrl.lastIndexOf('/');
        return lastSlash >= 0 ? imageUrl.substring(lastSlash + 1) : imageUrl;
    }

    /**
     * Zwraca format obrazu
     */
    @Transient
    public String getFormat() {
        if (imageUrl == null) {
            return null;
        }
        int lastDot = imageUrl.lastIndexOf('.');
        return lastDot >= 0 ? imageUrl.substring(lastDot + 1).toUpperCase() : null;
    }

    /**
     * Sprawdza czy obraz ma miniaturę
     */
    @Transient
    public boolean hasThumbnail() {
        return thumbnailUrl != null && !thumbnailUrl.isEmpty();
    }

    /**
     * Zwraca URL do wyświetlenia (miniatura jeśli istnieje, inaczej pełny obraz)
     */
    @Transient
    public String getDisplayUrl() {
        return hasThumbnail() ? thumbnailUrl : imageUrl;
    }

    /**
     * Zwraca rozmiar pliku w MB
     */
    @Transient
    public Double getFileSizeMB() {
        if (fileSize == null) {
            return null;
        }
        return fileSize / 1024.0 / 1024.0;
    }

    /**
     * Zwraca wymiary jako string
     */
    @Transient
    public String getDimensions() {
        if (width == null || height == null) {
            return null;
        }
        return width + "x" + height;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductImage)) return false;
        ProductImage that = (ProductImage) o;
        return id != null && id.equals(that.getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "ProductImage{" +
                "id=" + id +
                ", imageUrl='" + imageUrl + '\'' +
                ", isMain=" + isMain +
                ", displayOrder=" + displayOrder +
                '}';
    }
}