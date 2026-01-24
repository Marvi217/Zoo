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

    private String guestEmail;
    private String guestName;
    private String guestPhone;

    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name = "street", column = @Column(name = "shipping_street")),
            @AttributeOverride(name = "city", column = @Column(name = "shipping_city")),
            @AttributeOverride(name = "zipCode", column = @Column(name = "shipping_zip")),
            @AttributeOverride(name = "country", column = @Column(name = "shipping_country"))
    })
    private Address shippingAddress;

    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name = "street", column = @Column(name = "billing_street")),
            @AttributeOverride(name = "city", column = @Column(name = "billing_city")),
            @AttributeOverride(name = "zipCode", column = @Column(name = "billing_zip")),
            @AttributeOverride(name = "country", column = @Column(name = "billing_country"))
    })
    private Address billingAddress;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    @Builder.Default
    private List<OrderItem> items = new ArrayList<>();

    @Builder.Default
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal subtotal = BigDecimal.ZERO;

    @Builder.Default
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount = BigDecimal.ZERO;

    @Builder.Default
    @Column(precision = 10, scale = 2)
    private BigDecimal deliveryCost = BigDecimal.ZERO;

    @Builder.Default
    @Column(name = "discount_amount", precision = 10, scale = 2)
    private BigDecimal discountAmount = BigDecimal.ZERO;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "promotion_id")
    private Promotion promotion;

    @Column(length = 50)
    private String promotionCode;

    @Column(length = 1000)
    private String notes;

    @Column(length = 1000)
    private String adminNotes;

    @Column(length = 100)
    private String trackingNumber;

    private LocalDateTime cancelledAt;

    @Column(length = 500)
    private String cancellationReason;

    private LocalDateTime deliveredAt;

    private LocalDateTime statusChangedAt;

    @Transient
    public boolean isGuestOrder() {
        return user == null && guestEmail != null;
    }

    @Transient
    public String getCustomerEmail() {
        return user != null ? user.getEmail() : guestEmail;
    }

    @Transient
    public String getCustomerName() {
        if (user != null) {
            return user.getFirstName() + " " + user.getLastName();
        }
        return guestName;
    }

    public void addItem(OrderItem item) {
        if (items == null) {
            items = new ArrayList<>();
        }
        items.add(item);
        item.setOrder(this);
    }

    public void removeItem(OrderItem item) {
        if (items != null) {
            items.remove(item);
            item.setOrder(null);
        }
    }

    public void calculateTotal() {
        BigDecimal itemsTotal = items.stream()
                .map(item -> item.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        this.subtotal = itemsTotal;

        BigDecimal totalAfterDiscount = itemsTotal.subtract(discountAmount != null ? discountAmount : BigDecimal.ZERO);

        this.totalAmount = totalAfterDiscount.add(deliveryCost != null ? deliveryCost : BigDecimal.ZERO);
    }

    public void applyPromotion(Promotion promo) {
        if (promo == null || !promo.isCurrentlyActive()) {
            return;
        }

        this.promotion = promo;
        this.promotionCode = promo.getCode();

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
                this.discountAmount = BigDecimal.ZERO;
                break;

            default:
                this.discountAmount = BigDecimal.ZERO;
                break;
        }

        calculateTotal();
    }

    public void removePromotion() {
        this.promotion = null;
        this.promotionCode = null;
        this.discountAmount = BigDecimal.ZERO;
        calculateTotal();
    }

    @Transient
    public String getStatusDisplay() {
        return status != null ? status.getDisplayName() : "";
    }

    @Transient
    public boolean canBeCancelled() {
        if (status == OrderStatus.CANCELLED ||
                status == OrderStatus.DELIVERED ||
                status == OrderStatus.RETURNED) {
            return false;
        }

        if (orderDate != null) {
            LocalDateTime fiveHoursAgo = LocalDateTime.now().minusHours(5);
            return orderDate.isAfter(fiveHoursAgo);
        }

        return false;
    }

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

    @Transient
    public boolean isPaid() {
        return paymentStatus == PaymentStatus.PAID;
    }

    @Transient
    public boolean isPendingPayment() {
        return paymentStatus == PaymentStatus.PENDING;
    }

    @Transient
    public int getTotalItemsCount() {
        if (items == null) {
            return 0;
        }
        return items.stream()
                .mapToInt(OrderItem::getQuantity)
                .sum();
    }

    public void changeStatus(OrderStatus newStatus) {
        this.status = newStatus;
        this.statusChangedAt = LocalDateTime.now();

        if (newStatus == OrderStatus.CANCELLED) {
            this.cancelledAt = LocalDateTime.now();
        } else if (newStatus == OrderStatus.DELIVERED) {
            this.deliveredAt = LocalDateTime.now();
            this.paymentStatus = PaymentStatus.PAID;
        }
    }

    public void cancel(String reason) {
        changeStatus(OrderStatus.CANCELLED);
        this.cancellationReason = reason;

        if (items != null) {
            items.forEach(item -> {
                Product product = item.getProduct();
                if (product != null) {
                    product.increaseStock(item.getQuantity());
                }
            });
        }

        if (promotion != null) {
            promotion.setCurrentUsage(promotion.getCurrentUsage() - 1);
        }
    }

    @Transient
    public boolean hasPromotion() {
        return promotion != null ||
                (discountAmount != null && discountAmount.compareTo(BigDecimal.ZERO) > 0);
    }

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
        if (!(o instanceof Order order)) return false;
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