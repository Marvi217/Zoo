package com.example.zoo.entity;

import com.example.zoo.enums.DeliveryMethod;
import com.example.zoo.enums.OrderStatus;
import com.example.zoo.enums.PaymentMethod;
import com.example.zoo.enums.PaymentStatus;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false, length = 50)
    private String orderNumber;

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private LocalDateTime orderDate;

    @Builder.Default
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 50)
    private OrderStatus status = OrderStatus.PENDING;
    @Builder.Default
    @Enumerated(EnumType.STRING)
    @Column(length = 50)
    private PaymentStatus paymentStatus = PaymentStatus.PENDING;

    @Enumerated(EnumType.STRING)
    @Column(length = 50)
    private PaymentMethod paymentMethod;

    @Enumerated(EnumType.STRING)
    @Column(length = 50)
    private DeliveryMethod deliveryMethod;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    // Guest checkout fields
    private String guestEmail;
    private String guestName;
    private String guestPhone;

    /**
     * Adres wysyłki
     */
    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name = "street", column = @Column(name = "shipping_street")),
            @AttributeOverride(name = "city", column = @Column(name = "shipping_city")),
            @AttributeOverride(name = "zipCode", column = @Column(name = "shipping_zip")),
            @AttributeOverride(name = "country", column = @Column(name = "shipping_country"))
    })
    private Address shippingAddress;

    /**
     * Adres rozliczeniowy (opcjonalny, jeśli różni się od wysyłkowego)
     */
    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name = "street", column = @Column(name = "billing_street")),
            @AttributeOverride(name = "city", column = @Column(name = "billing_city")),
            @AttributeOverride(name = "zipCode", column = @Column(name = "billing_zip")),
            @AttributeOverride(name = "country", column = @Column(name = "billing_country"))
    })
    private Address billingAddress;

    /**
     * Pozycje zamówienia
     */
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    @Builder.Default
    private List<OrderItem> items = new ArrayList<>();

    /**
     * Suma wartości produktów (bez dostawy i zniżek)
     */
    @Builder.Default
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal subtotal = BigDecimal.ZERO;

    /**
     * Całkowita kwota do zapłaty (z dostawą i po zniżkach)
     */
    @Builder.Default
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount = BigDecimal.ZERO;

    /**
     * Koszt dostawy
     */
    @Builder.Default
    @Column(precision = 10, scale = 2)
    private BigDecimal deliveryCost = BigDecimal.ZERO;

    /**
     * Kwota zniżki z promocji
     */
    @Builder.Default
    @Column(name = "discount_amount", precision = 10, scale = 2)
    private BigDecimal discountAmount = BigDecimal.ZERO;

    /**
     * Promocja zastosowana do zamówienia
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "promotion_id")
    private Promotion promotion;

    /**
     * Kod promocyjny użyty w zamówieniu
     */
    @Column(length = 50)
    private String promotionCode;

    /**
     * Notatki do zamówienia
     */
    @Column(length = 1000)
    private String notes;

    /**
     * Notatki administracyjne (niewidoczne dla klienta)
     */
    @Column(length = 1000)
    private String adminNotes;

    /**
     * Numer śledzenia przesyłki
     */
    @Column(length = 100)
    private String trackingNumber;

    /**
     * Data anulowania
     */
    private LocalDateTime cancelledAt;

    /**
     * Powód anulowania
     */
    @Column(length = 500)
    private String cancellationReason;

    /**
     * Data dostarczenia
     */
    private LocalDateTime deliveredAt;

    /**
     * Data ostatniej zmiany statusu
     */
    private LocalDateTime statusChangedAt;

    // ==================== METODY BIZNESOWE ====================

    /**
     * Sprawdza czy zamówienie zostało złożone przez gościa
     */
    @Transient
    public boolean isGuestOrder() {
        return user == null && guestEmail != null;
    }

    /**
     * Zwraca email klienta (zarejestrowanego lub gościa)
     */
    @Transient
    public String getCustomerEmail() {
        return user != null ? user.getEmail() : guestEmail;
    }

    /**
     * Zwraca imię i nazwisko klienta
     */
    @Transient
    public String getCustomerName() {
        if (user != null) {
            return user.getFirstName() + " " + user.getLastName();
        }
        return guestName;
    }

    /**
     * Dodaje pozycję do zamówienia
     */
    public void addItem(OrderItem item) {
        if (items == null) {
            items = new ArrayList<>();
        }
        items.add(item);
        item.setOrder(this);
    }

    /**
     * Usuwa pozycję z zamówienia
     */
    public void removeItem(OrderItem item) {
        if (items != null) {
            items.remove(item);
            item.setOrder(null);
        }
    }

    /**
     * Oblicza całkowitą kwotę zamówienia
     */
    public void calculateTotal() {
        // Suma wartości produktów
        BigDecimal itemsTotal = items.stream()
                .map(item -> item.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        this.subtotal = itemsTotal;

        // Kwota po zniżce
        BigDecimal totalAfterDiscount = itemsTotal.subtract(discountAmount != null ? discountAmount : BigDecimal.ZERO);

        // Całkowita kwota (z dostawą)
        this.totalAmount = totalAfterDiscount.add(deliveryCost != null ? deliveryCost : BigDecimal.ZERO);
    }

    /**
     * Zastosuj promocję do zamówienia
     */
    public void applyPromotion(Promotion promo) {
        if (promo == null || !promo.isCurrentlyActive()) {
            return;
        }

        this.promotion = promo;
        this.promotionCode = promo.getCode();

        // Oblicz zniżkę
        switch (promo.getType()) {
            case PERCENTAGE_DISCOUNT:
                if (promo.getDiscountPercentage() != null) {
                    this.discountAmount = subtotal.multiply(promo.getDiscountPercentage())
                            .divide(new BigDecimal("100"), 2, RoundingMode.HALF_UP);
                }
                break;

            case FIXED_AMOUNT_DISCOUNT:
                if (promo.getDiscountAmount() != null) {
                    this.discountAmount = promo.getDiscountAmount().min(subtotal);
                }
                break;

            case FREE_SHIPPING:
                this.deliveryCost = BigDecimal.ZERO;
                this.discountAmount = BigDecimal.ZERO; // Zniżka jest w koszcie dostawy
                break;

            default:
                this.discountAmount = BigDecimal.ZERO;
                break;
        }

        calculateTotal();
    }

    /**
     * Usuń promocję z zamówienia
     */
    public void removePromotion() {
        this.promotion = null;
        this.promotionCode = null;
        this.discountAmount = BigDecimal.ZERO;
        calculateTotal();
    }

    /**
     * Zwraca nazwę wyświetlaną statusu
     */
    @Transient
    public String getStatusDisplay() {
        return status != null ? status.getDisplayName() : "";
    }

    /**
     * Sprawdza czy zamówienie może być anulowane
     */
    @Transient
    public boolean canBeCancelled() {
        // Nie można anulować zamówień już anulowanych lub dostarczonych
        if (status == OrderStatus.CANCELLED ||
                status == OrderStatus.DELIVERED ||
                status == OrderStatus.RETURNED) {
            return false;
        }

        // Można anulować tylko w ciągu 5 godzin od złożenia
        if (orderDate != null) {
            LocalDateTime fiveHoursAgo = LocalDateTime.now().minusHours(5);
            return orderDate.isAfter(fiveHoursAgo);
        }

        return false;
    }

    /**
     * Zwraca liczbę godzin do wygaśnięcia możliwości anulowania
     */
    @Transient
    public long getHoursUntilCancellationExpires() {
        if (orderDate == null) {
            return 0;
        }

        LocalDateTime cancellationDeadline = orderDate.plusHours(5);
        Duration duration = Duration.between(LocalDateTime.now(), cancellationDeadline);
        long hours = duration.toHours();
        return hours > 0 ? hours : 0;
    }

    /**
     * Sprawdza czy zamówienie jest opłacone
     */
    @Transient
    public boolean isPaid() {
        return paymentStatus == PaymentStatus.PAID;
    }

    /**
     * Sprawdza czy zamówienie oczekuje na płatność
     */
    @Transient
    public boolean isPendingPayment() {
        return paymentStatus == PaymentStatus.PENDING;
    }

    /**
     * Zlicz produkty w zamówieniu
     */
    @Transient
    public int getTotalItemsCount() {
        if (items == null) {
            return 0;
        }
        return items.stream()
                .mapToInt(OrderItem::getQuantity)
                .sum();
    }

    /**
     * Zmień status zamówienia
     */
    public void changeStatus(OrderStatus newStatus) {
        this.status = newStatus;
        this.statusChangedAt = LocalDateTime.now();

        // Automatyczne aktualizacje przy zmianie statusu
        if (newStatus == OrderStatus.CANCELLED) {
            this.cancelledAt = LocalDateTime.now();
        } else if (newStatus == OrderStatus.DELIVERED) {
            this.deliveredAt = LocalDateTime.now();
            this.paymentStatus = PaymentStatus.PAID;
        }
    }

    /**
     * Anuluj zamówienie
     */
    public void cancel(String reason) {
        changeStatus(OrderStatus.CANCELLED);
        this.cancellationReason = reason;

        // Przywróć stany magazynowe
        if (items != null) {
            items.forEach(item -> {
                Product product = item.getProduct();
                if (product != null) {
                    product.increaseStock(item.getQuantity());
                }
            });
        }

        // Zmniejsz licznik użyć promocji
        if (promotion != null) {
            promotion.setCurrentUsage(promotion.getCurrentUsage() - 1);
        }
    }

    /**
     * Zwraca informację czy używano promocji
     */
    @Transient
    public boolean hasPromotion() {
        return promotion != null ||
                (discountAmount != null && discountAmount.compareTo(BigDecimal.ZERO) > 0);
    }

    /**
     * Zwraca opis zastosowanej promocji
     */
    @Transient
    public String getPromotionDescription() {
        if (promotion != null) {
            return promotion.getName();
        }
        if (promotionCode != null && !promotionCode.isEmpty()) {
            return "Kod: " + promotionCode;
        }
        return null;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Order)) return false;
        Order order = (Order) o;
        return id != null && id.equals(order.getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderNumber='" + orderNumber + '\'' +
                ", status=" + status +
                ", totalAmount=" + totalAmount +
                ", orderDate=" + orderDate +
                '}';
    }


}