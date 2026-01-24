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

    List<Order> findAllByUserId(Long userId);


    @Query("SELECT o.user, COUNT(o), SUM(o.totalAmount) FROM Order o " +
            "WHERE o.orderDate BETWEEN :from AND :to AND o.user IS NOT NULL " +
            "GROUP BY o.user ORDER BY SUM(o.totalAmount) DESC")
    List<Object[]> findTopCustomersInPeriod(@Param("from") LocalDateTime from,
                                            @Param("to") LocalDateTime to,
                                            Pageable pageable);

    Optional<Order> findByOrderNumber(String orderNumber);

    @Modifying
    @Transactional
    @Query("UPDATE Order o SET o.status = :status WHERE o.id IN :ids")
    int updateStatusForIds(@Param("ids") List<Long> ids, @Param("status") OrderStatus status);

    List<Order> findByUserOrderByOrderDateDesc(User user);

    List<Order> findAllByUserOrderByOrderDateDesc(User user);

    @Query("SELECT o.status, COUNT(o) FROM Order o WHERE o.orderDate BETWEEN :from AND :to GROUP BY o.status")
    List<Object[]> countOrdersByStatusInPeriod(@Param("from") LocalDateTime from, @Param("to") LocalDateTime to);

    List<Order> findTop3ByUserOrderByOrderDateDesc(User user);

    List<Order> findByGuestEmailOrderByOrderDateDesc(String email);

    List<Order> findByStatusOrderByOrderDateDesc(OrderStatus status, Pageable pageable);

    long countByUser(User user);

    long countByStatus(OrderStatus status);

    long countByOrderDateBetween(LocalDateTime from, LocalDateTime to);

    @Query("SELECT SUM(o.totalAmount - o.deliveryCost) FROM Order o WHERE o.user = :user " +
            "AND o.paymentStatus = com.example.zoo.enums.PaymentStatus.PAID")
    BigDecimal sumTotalSpentByUser(@Param("user") User user);

    @Query("SELECT SUM(o.totalAmount - o.deliveryCost) FROM Order o WHERE o.orderDate BETWEEN :from AND :to " +
            "AND o.paymentStatus = com.example.zoo.enums.PaymentStatus.PAID")
    BigDecimal sumTotalAmountByOrderDateBetween(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to
    );

    @Query("SELECT o FROM Order o ORDER BY o.orderDate DESC")
    List<Order> findRecentOrders(Pageable pageable);

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

    @Query("SELECT CAST(o.orderDate AS date) as orderDate, COUNT(o) as orderCount " +
            "FROM Order o " +
            "WHERE o.orderDate BETWEEN :from AND :to " +
            "GROUP BY CAST(o.orderDate AS date) " +
            "ORDER BY CAST(o.orderDate AS date)")
    List<Object[]> findDailyOrdersCount(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to
    );

    @Query("SELECT o.status, COUNT(o) FROM Order o GROUP BY o.status")
    List<Object[]> countOrdersByStatus();

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

    @Query("SELECT o FROM Order o WHERE " +
            "LOWER(o.orderNumber) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.guestEmail) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.guestName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.user.email) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.user.firstName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(o.user.lastName) LIKE LOWER(CONCAT('%', :query, '%'))")
    Page<Order> searchOrders(@Param("query") String query, Pageable pageable);

    @Query("SELECT o.user, COUNT(o) as orderCount, SUM(o.totalAmount) as totalSpent " +
            "FROM Order o " +
            "WHERE o.user IS NOT NULL " +
            "AND o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " +
            "com.example.zoo.enums.OrderStatus.FAILED) " +
            "GROUP BY o.user " +
            "ORDER BY totalSpent DESC")
    List<Object[]> findTopCustomers(Pageable pageable);

    @Query("SELECT o.paymentMethod, COUNT(o) FROM Order o " +
            "WHERE o.paymentMethod IS NOT NULL " +
            "GROUP BY o.paymentMethod")
    List<Object[]> countOrdersByPaymentMethod();

    @Query("SELECT o.deliveryMethod, COUNT(o) FROM Order o " +
            "WHERE o.deliveryMethod IS NOT NULL " +
            "GROUP BY o.deliveryMethod")
    List<Object[]> countOrdersByDeliveryMethod();

    @Query("SELECT o FROM Order o WHERE o.status = 'PENDING' " +
            "AND o.orderDate < :threshold " +
            "ORDER BY o.orderDate ASC")
    List<Order> findPendingOrdersOlderThan(@Param("threshold") LocalDateTime threshold);

    @Query("SELECT o FROM Order o WHERE o.promotion IS NOT NULL")
    Page<Order> findOrdersWithPromotion(Pageable pageable);

    @Query("SELECT COUNT(o) FROM Order o WHERE o.promotion.id = :promotionId")
    long countOrdersByPromotionId(@Param("promotionId") Long promotionId);

    @Query("SELECT SUM(o.discountAmount) FROM Order o WHERE o.promotion.id = :promotionId")
    BigDecimal sumDiscountByPromotionId(@Param("promotionId") Long promotionId);

    @Query("SELECT AVG(o.totalAmount) FROM Order o " +
            "WHERE o.status NOT IN (com.example.zoo.enums.OrderStatus.CANCELLED, " + "com.example.zoo.enums.OrderStatus.FAILED) ")
    BigDecimal calculateAverageOrderValue();

    @Query("SELECT " +
            "CAST(COUNT(CASE WHEN o.status = 'DELIVERED' THEN 1 END) AS double) / " +
            "CAST(COUNT(o) AS double) * 100 " +
            "FROM Order o")
    Double calculateConversionRate();

    @Query("SELECT HOUR(o.orderDate) as hour, COUNT(o) as orderCount " +
            "FROM Order o " +
            "GROUP BY HOUR(o.orderDate) " +
            "ORDER BY hour")
    List<Object[]> countOrdersByHourOfDay();

    @Query("SELECT DAYOFWEEK(o.orderDate) as dayOfWeek, COUNT(o) as orderCount " +
            "FROM Order o " +
            "GROUP BY DAYOFWEEK(o.orderDate) " +
            "ORDER BY dayOfWeek")
    List<Object[]> countOrdersByDayOfWeek();

    @Query("SELECT o FROM Order o WHERE " +
            "(o.status = 'PENDING' AND o.orderDate < :pendingThreshold) OR " +
            "(o.status = 'PROCESSING' AND o.orderDate < :processingThreshold)")
    List<Order> findOrdersRequiringAttention(
            @Param("pendingThreshold") LocalDateTime pendingThreshold,
            @Param("processingThreshold") LocalDateTime processingThreshold
    );

    @Query("SELECT o FROM Order o WHERE o.paymentStatus IN (com.example.zoo.enums.PaymentStatus.FAILED, com.example.zoo.enums.PaymentStatus.PENDING) " +
            "AND o.orderDate < :threshold " +
            "ORDER BY o.orderDate ASC")
    List<Order> findOrdersWithPaymentIssues(@Param("threshold") LocalDateTime threshold);

    Page<Order> findByStatus(OrderStatus status, Pageable pageable);

    List<Order> findByStatus(OrderStatus status);

    Page<Order> findByPaymentStatus(PaymentStatus paymentStatus, Pageable pageable);

    @Query("SELECT SUM(o.totalAmount - o.deliveryCost) FROM Order o WHERE o.paymentStatus = com.example.zoo.enums.PaymentStatus.PAID")
    BigDecimal sumTotalRevenue();

    @Query(value = "SELECT CAST(order_date AS DATE) as d, SUM(total_amount - COALESCE(delivery_cost, 0)) " +
            "FROM orders " +
            "WHERE order_date >= DATEADD('DAY', -7, CURRENT_DATE) " +
            "AND payment_status = 'PAID' " +
            "GROUP BY CAST(order_date AS DATE) " +
            "ORDER BY d ASC", nativeQuery = true)
    List<Object[]> findWeeklySalesRaw();

    List<Order> findByStatusAndOrderDateBetween(OrderStatus status, LocalDateTime start, LocalDateTime end);

    List<Order> findByOrderDateBetween(LocalDateTime start, LocalDateTime end);

    @Query("SELECT CASE WHEN COUNT(oi) > 0 THEN true ELSE false END " +
            "FROM OrderItem oi JOIN oi.order o " +
            "WHERE o.user.id = :userId AND oi.product.id = :productId " +
            "AND o.status IN (com.example.zoo.enums.OrderStatus.DELIVERED, com.example.zoo.enums.OrderStatus.RETURNED)")
    boolean hasUserPurchasedProduct(@Param("userId") Long userId, @Param("productId") Long productId);

    @Query("SELECT DISTINCT oi.product FROM OrderItem oi JOIN oi.order o " +
            "WHERE o.user.id = :userId " +
            "AND o.status IN (com.example.zoo.enums.OrderStatus.DELIVERED, com.example.zoo.enums.OrderStatus.RETURNED)")
    List<com.example.zoo.entity.Product> findReviewableProductsForUser(@Param("userId") Long userId);

}