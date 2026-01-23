package com.example.zoo.repository;

import com.example.zoo.entity.Order;
import com.example.zoo.entity.User;
import com.example.zoo.enums.DeliveryMethod;
import com.example.zoo.enums.OrderStatus;
import com.example.zoo.enums.PaymentMethod;
import com.example.zoo.enums.PaymentStatus;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    Page<Order> findByUserId(Long userId, Pageable pageable);

    List<Order> findAllByOrderDateAfter(LocalDateTime date);

    // Ta metoda przyda się do statystyk (np. getUserOrderStatistics)
    List<Order> findAllByUserId(Long userId);

    // ==================== WYSZUKIWANIE PODSTAWOWE ====================

    @Query("SELECT o.user, COUNT(o), SUM(o.totalAmount) FROM Order o " +
            "WHERE o.orderDate BETWEEN :from AND :to AND o.user IS NOT NULL " +
            "GROUP BY o.user ORDER BY SUM(o.totalAmount) DESC")
    List<Object[]> findTopCustomersInPeriod(@Param("from") LocalDateTime from,
                                            @Param("to") LocalDateTime to,
                                            Pageable pageable);

    /**
     * Znajdź zamówienie po numerze
     */
    Optional<Order> findByOrderNumber(String orderNumber);

    @Modifying
    @Transactional
    @Query("UPDATE Order o SET o.status = :status WHERE o.id IN :ids")
    int updateStatusForIds(@Param("ids") List<Long> ids, @Param("status") OrderStatus status);

    /**
     * Znajdź zamówienia użytkownika
     */
    List<Order> findByUserOrderByOrderDateDesc(User user);

    /**
     * Znajdź wszystkie zamówienia użytkownika
     */
    List<Order> findAllByUserOrderByOrderDateDesc(User user);

    @Query("SELECT o.status, COUNT(o) FROM Order o WHERE o.orderDate BETWEEN :from AND :to GROUP BY o.status")
    List<Object[]> countOrdersByStatusInPeriod(@Param("from") LocalDateTime from, @Param("to") LocalDateTime to);

    /**
     * Znajdź ostatnie 3 zamówienia użytkownika
     */
    List<Order> findTop3ByUserOrderByOrderDateDesc(User user);

    /**
     * Znajdź zamówienia gościa po email
     */
    List<Order> findByGuestEmailOrderByOrderDateDesc(String email);

    /**
     * Znajdź zamówienia według statusu
     */
    List<Order> findByStatusOrderByOrderDateDesc(OrderStatus status, Pageable pageable);

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz zamówienia użytkownika
     */
    long countByUser(User user);

    /**
     * Zlicz zamówienia według statusu
     */
    long countByStatus(OrderStatus status);

    /**
     * Zlicz zamówienia w przedziale czasowym
     */
    long countByOrderDateBetween(LocalDateTime from, LocalDateTime to);

    /**
     * Suma wydanych pieniędzy przez użytkownika
     */
    @Query("SELECT SUM(o.totalAmount) FROM Order o WHERE o.user = :user " +
            "AND o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, com.example.zoo.enums.OrderStatus.FAILED)")
    BigDecimal sumTotalSpentByUser(@Param("user") User user);

    /**
     * Suma przychodów w przedziale czasowym
     */
    @Query("SELECT SUM(o.totalAmount) FROM Order o WHERE o.orderDate BETWEEN :from AND :to " +
            "AND o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, com.example.zoo.enums.OrderStatus.FAILED)")
    BigDecimal sumTotalAmountByOrderDateBetween(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to
    );

    // ==================== OSTATNIE ZAMÓWIENIA ====================

    /**
     * Pobierz ostatnie zamówienia
     */
    @Query("SELECT o FROM Order o ORDER BY o.orderDate DESC")
    List<Order> findRecentOrders(Pageable pageable);

    // ==================== BESTSELLERY ====================

    /**
     * Znajdź najlepiej sprzedające się produkty
     */
    @Query("SELECT oi.product, SUM(oi.quantity) as totalQuantity, " +
            "SUM(oi.price * oi.quantity) as totalRevenue " +
            "FROM OrderItem oi " +
            "JOIN oi.order o " +
            "WHERE o.orderDate BETWEEN :from AND :to " +
            "AND o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " +
            "com.example.zoo.enums.OrderStatus.FAILED) " +
            "GROUP BY oi.product " +
            "ORDER BY totalQuantity DESC")
    List<Object[]> findTopSellingProducts(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to,
            Pageable pageable
    );

    // ==================== WYKRESY ====================

    /**
     * Pobierz dzienny przychód
     */
    @Query("SELECT CAST(o.orderDate AS date) as orderDate, SUM(o.totalAmount) as revenue " +
            "FROM Order o " +
            "WHERE o.orderDate BETWEEN :from AND :to " +
            "AND o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " +
            "com.example.zoo.enums.OrderStatus.FAILED) " +
            "GROUP BY CAST(o.orderDate AS date) " +
            "ORDER BY CAST(o.orderDate AS date)")
    List<Object[]> findDailyRevenue(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to
    );

    /**
     * Pobierz dzienną liczbę zamówień
     */
    @Query("SELECT CAST(o.orderDate AS date) as orderDate, COUNT(o) as orderCount " +
            "FROM Order o " +
            "WHERE o.orderDate BETWEEN :from AND :to " +
            "GROUP BY CAST(o.orderDate AS date) " +
            "ORDER BY CAST(o.orderDate AS date)")
    List<Object[]> findDailyOrdersCount(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to
    );

    /**
     * Zlicz zamówienia według statusu
     */
    @Query("SELECT o.status, COUNT(o) FROM Order o GROUP BY o.status")
    List<Object[]> countOrdersByStatus();

    // ==================== FILTROWANIE ====================

    /**
     * Filtrowanie zaawansowane zamówień
     */
    @Query("SELECT o FROM Order o WHERE " +
            "(:status IS NULL OR o.status = :status) AND " +
            "(:paymentStatus IS NULL OR o.paymentStatus = :paymentStatus) AND " +
            "(:dateFrom IS NULL OR o.orderDate >= :dateFrom) AND " +
            "(:dateTo IS NULL OR o.orderDate <= :dateTo) AND " +
            "(:search IS NULL OR :search = '' OR " +
            " LOWER(o.orderNumber) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            " LOWER(o.guestEmail) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            " LOWER(o.guestName) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            " LOWER(o.user.email) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            " LOWER(o.user.firstName) LIKE LOWER(CONCAT('%', :search, '%')) OR " + // ZMIANA
            " LOWER(o.user.lastName) LIKE LOWER(CONCAT('%', :search, '%')))")    // ZMIANA
    Page<Order> filterOrders(
            @Param("status") OrderStatus status,
            @Param("paymentStatus") PaymentStatus paymentStatus,
            @Param("dateFrom") LocalDateTime dateFrom,
            @Param("dateTo") LocalDateTime dateTo,
            @Param("search") String search,
            Pageable pageable
    );

    /**
     * Wyszukiwanie pełnotekstowe
     */
    @Query("SELECT o FROM Order o WHERE " +
            "LOWER(o.orderNumber) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.guestEmail) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.guestName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.user.email) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.user.firstName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.user.lastName) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<Order> searchOrders(@Param("query") String query, Pageable pageable);

    // ==================== TOP KLIENCI ====================

    /**
     * Znajdź top klientów (najwięcej zamówień i wydanych pieniędzy)
     */
    @Query("SELECT o.user, COUNT(o) as orderCount, SUM(o.totalAmount) as totalSpent " +
            "FROM Order o " +
            "WHERE o.user IS NOT NULL " +
            "AND o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " +
            "com.example.zoo.enums.OrderStatus.FAILED) " +
            "GROUP BY o.user " +
            "ORDER BY totalSpent DESC")
    List<Object[]> findTopCustomers(Pageable pageable);

    // ==================== METODY PŁATNOŚCI I DOSTAWY ====================

    /**
     * Zlicz zamówienia według metody płatności
     */
    @Query("SELECT o.paymentMethod, COUNT(o) FROM Order o " +
            "WHERE o.paymentMethod IS NOT NULL " +
            "GROUP BY o.paymentMethod")
    List<Object[]> countOrdersByPaymentMethod();

    /**
     * Zlicz zamówienia według metody dostawy
     */
    @Query("SELECT o.deliveryMethod, COUNT(o) FROM Order o " +
            "WHERE o.deliveryMethod IS NOT NULL " +
            "GROUP BY o.deliveryMethod")
    List<Object[]> countOrdersByDeliveryMethod();

    // ==================== CZAS REALIZACJI ====================

    /**
     * Oblicz średni czas realizacji zamówienia (od złożenia do dostarczenia)
     */
//    @Query("SELECT AVG(TIMESTAMPDIFF(HOUR, o.orderDate, o.deliveredAt)) " +
//            "FROM Order o " +
//            "WHERE o.deliveredAt IS NOT NULL")
//    Double calculateAverageProcessingTime();

    /**
     * Znajdź zamówienia oczekujące dłużej niż określona liczba dni
     */
    @Query("SELECT o FROM Order o WHERE o.status = 'PENDING' " +
            "AND o.orderDate < :threshold " +
            "ORDER BY o.orderDate ASC")
    List<Order> findPendingOrdersOlderThan(@Param("threshold") LocalDateTime threshold);

    // ==================== PROMOCJE ====================

    /**
     * Znajdź zamówienia z promocją
     */
    @Query("SELECT o FROM Order o WHERE o.promotion IS NOT NULL")
    Page<Order> findOrdersWithPromotion(Pageable pageable);

    /**
     * Zlicz użycia promocji
     */
    @Query("SELECT COUNT(o) FROM Order o WHERE o.promotion.id = :promotionId")
    long countOrdersByPromotionId(@Param("promotionId") Long promotionId);

    /**
     * Suma zniżek z promocji
     */
    @Query("SELECT SUM(o.discountAmount) FROM Order o WHERE o.promotion.id = :promotionId")
    BigDecimal sumDiscountByPromotionId(@Param("promotionId") Long promotionId);

    // ==================== ZAAWANSOWANE STATYSTYKI ====================

    /**
     * Średnia wartość zamówienia
     * "AND o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " +
     *             "com.example.zoo.enums.OrderStatus.FAILED) " +
     */
    @Query("SELECT AVG(o.totalAmount) FROM Order o " +
            "WHERE o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " + "com.example.zoo.enums.OrderStatus.FAILED) ")
    BigDecimal calculateAverageOrderValue();

    /**
     * Współczynnik konwersji (procent zamówień dostarczonych)
     */
    @Query("SELECT " +
            "CAST(COUNT(CASE WHEN o.status = 'DELIVERED' THEN 1 END) AS double) / " +
            "CAST(COUNT(o) AS double) * 100 " +
            "FROM Order o")
    Double calculateConversionRate();

    /**
     * Zamówienia według godzin dnia
     */
    @Query("SELECT HOUR(o.orderDate) as hour, COUNT(o) as orderCount " +
            "FROM Order o " +
            "GROUP BY HOUR(o.orderDate) " +
            "ORDER BY hour")
    List<Object[]> countOrdersByHourOfDay();

    /**
     * Zamówienia według dni tygodnia
     */
    @Query("SELECT DAYOFWEEK(o.orderDate) as dayOfWeek, COUNT(o) as orderCount " +
            "FROM Order o " +
            "GROUP BY DAYOFWEEK(o.orderDate) " +
            "ORDER BY dayOfWeek")
    List<Object[]> countOrdersByDayOfWeek();

    // ==================== ALERTY ====================

    /**
     * Znajdź zamówienia wymagające uwagi (stare oczekujące)
     */
    @Query("SELECT o FROM Order o WHERE " +
            "(o.status = 'PENDING' AND o.orderDate < :pendingThreshold) OR " +
            "(o.status = 'PROCESSING' AND o.orderDate < :processingThreshold)")
    List<Order> findOrdersRequiringAttention(
            @Param("pendingThreshold") LocalDateTime pendingThreshold,
            @Param("processingThreshold") LocalDateTime processingThreshold
    );

    /**
     * Znajdź zamówienia z problemami płatności
     * NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " +
     *      *             "com.example.zoo.enums.OrderStatus.FAILED) "
     */
    @Query("SELECT o FROM Order o WHERE o.paymentStatus IN (com.example.zoo.enums.PaymentStatus.FAILED, com.example.zoo.enums.PaymentStatus.PENDING) " +
            "AND o.orderDate < :threshold " +
            "ORDER BY o.orderDate ASC")
    List<Order> findOrdersWithPaymentIssues(@Param("threshold") LocalDateTime threshold);

    Page<Order> findByStatus(OrderStatus status, Pageable pageable);

    List<Order> findByStatus(OrderStatus status);

    // Jeśli masz pole paymentStatus w encji Order
    Page<Order> findByPaymentStatus(PaymentStatus paymentStatus, Pageable pageable);

    @Query("SELECT SUM(o.totalAmount) FROM Order o WHERE o.status = com.example.zoo.enums.OrderStatus.DELIVERED OR o.status =  com.example.zoo.enums.OrderStatus.CONFIRMED")
    BigDecimal sumTotalRevenue();

    @Query(value = "SELECT CAST(order_date AS DATE) as d, SUM(total_amount) " +
            "FROM orders " +
            "WHERE order_date >= DATEADD('DAY', -7, CURRENT_DATE) " +
            "AND status <> 'CANCELLED' " +
            "GROUP BY CAST(order_date AS DATE) " +
            "ORDER BY d ASC", nativeQuery = true)
    List<Object[]> findWeeklySalesRaw();

    List<Order> findByStatusAndOrderDateBetween(OrderStatus status, LocalDateTime start, LocalDateTime end);

    List<Order> findByOrderDateBetween(LocalDateTime start, LocalDateTime end);

}