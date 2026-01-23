package com.example.zoo.service;

import com.example.zoo.dto.GuestCheckoutDto;
import com.example.zoo.entity.*;
import com.example.zoo.enums.*;
import com.example.zoo.exception.UnauthorizedOrderException;
import com.example.zoo.repository.OrderRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
public class OrderService {

    private final OrderRepository orderRepository;
    private final ProductService productService;
    private final CartService cartService;

    public OrderService(OrderRepository orderRepository,
                        ProductService productService,
                        CartService cartService) {
        this.orderRepository = orderRepository;
        this.productService = productService;
        this.cartService = cartService;
    }


    public Map<String, Double> getMonthlySalesStats() {
        LocalDateTime thirtyDaysAgo = LocalDateTime.now().minusDays(30);
        List<Order> orders = orderRepository.findAllByOrderDateAfter(thirtyDaysAgo);

        // Grupowanie po dacie (np. "2024-01-22") i sumowanie przychodu
        Map<String, Double> stats = new TreeMap<>(); // TreeMap posortuje klucze (daty) chronologicznie

        // Inicjalizacja mapy zerami dla każdego z ostatnich 30 dni (żeby nie było dziur na wykresie)
        for (int i = 30; i >= 0; i--) {
            String date = LocalDate.now().minusDays(i).toString();
            stats.put(date, 0.0);
        }

        for (Order order : orders) {
            String date = order.getOrderDate().toLocalDate().toString();
            stats.put(date, stats.getOrDefault(date, 0.0) + order.getTotalAmount().doubleValue());
        }
        return stats;
    }

    @Transactional
    public void updateOrderDetails(Long id, Order details) {
        Order existingOrder = orderRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Nie znaleziono zamówienia o ID: " + id));

        // Aktualizujemy tylko pola edytowalne przez admina
        existingOrder.setStatus(details.getStatus());
        existingOrder.setPaymentStatus(details.getPaymentStatus());

        // Zakładając, że masz takie pole w encji Order (na podstawie Twojego formularza)
        // Jeśli nie masz pola adminNotes w encji, musisz je dodać
        existingOrder.setAdminNotes(details.getAdminNotes());

        // Jeśli formularz zawierałby edycję adresu:
        // existingOrder.setShippingAddress(details.getShippingAddress());

        orderRepository.save(existingOrder);
    }

    @Transactional
    public Order save(Order order) {
        return orderRepository.save(order);
    }

    // ==================== METODY ISTNIEJĄCE (zachowane) ====================

    public Optional<Order> findById(Long id) {
        return orderRepository.findById(id);
    }

    public Order getOrderById(Long id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Zamówienie o ID " + id + " nie istnieje"));
    }

    @Transactional
    public void changePaymentStatus(Long id, PaymentStatus newStatus) {
        Order order = getOrderById(id);
        order.setPaymentStatus(newStatus);
        orderRepository.save(order);
        log.info("Zmieniono status płatności zamówienia {} na {}", id, newStatus);
    }

    @Transactional
    public void addOrderNote(Long id, String note) {
        Order order = getOrderById(id);
        String existingNotes = order.getAdminNotes() != null ? order.getAdminNotes() : "";
        order.setAdminNotes(existingNotes + "\n[" + LocalDateTime.now() + "]: " + note);
        orderRepository.save(order);
    }

    // W OrderService.java

    public Page<Order> getUserOrders(Long userId, Pageable pageable) {
        // Zakładamy, że w OrderRepository masz metodę findByUserId
        return orderRepository.findByUserId(userId, pageable);
    }

    public Map<String, Object> getUserOrderStatistics(Long userId) {
        List<Order> userOrders = orderRepository.findAllByUserId(userId);

        BigDecimal totalSpent = userOrders.stream()
                .map(Order::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        long count = userOrders.size();

        Map<String, Object> stats = new HashMap<>();
        stats.put("totalSpent", totalSpent);
        stats.put("orderCount", count);
        stats.put("averageValue", count > 0 ? totalSpent.divide(BigDecimal.valueOf(count), 2, RoundingMode.HALF_UP) : BigDecimal.ZERO);

        return stats;
    }

    // Mocki dla powiadomień i dokumentów (do implementacji z bibliotekami i MailService)
    public void sendStatusChangeEmail(Long orderId, OrderStatus status) { log.info("Email wysłany: zmiana statusu na {}", status); }
    public void sendCancellationEmail(Long orderId, String reason) { log.info("Email wysłany: anulowanie z powodu {}", reason); }
    public String generateInvoice(Long id) { return "FV/" + id + "/" + LocalDate.now().getYear() + ".pdf"; }
    public String generateShippingLabel(Long id) { return "LABEL_" + id + ".pdf"; }

    @Transactional
    public Order createOrderForUser(User user, PaymentMethod paymentMethod, DeliveryMethod deliveryMethod) {
        if (cartService.isEmpty()) {
            throw new IllegalStateException("Cannot create order with empty cart");
        }

        Order order = new Order();
        order.setOrderNumber(generateOrderNumber());
        order.setUser(user);
        order.setPaymentMethod(paymentMethod);
        order.setDeliveryMethod(deliveryMethod);
        order.setDeliveryCost(deliveryMethod.getPrice());
        order.setShippingAddress(user.getAddress());

        populateOrderItems(order);
        order.calculateTotal();

        Order savedOrder = orderRepository.save(order);
        cartService.clear();

        return savedOrder;
    }

    /**
     * Oblicza średnią wartość zamówienia (AOV) w podanym okresie
     */
    public BigDecimal getAverageOrderValue(LocalDateTime from, LocalDateTime to) {
        // Pobieramy sumę przychodów i liczbę zamówień w jednym okresie
        BigDecimal totalRevenue = orderRepository.sumTotalAmountByOrderDateBetween(from, to);
        long orderCount = orderRepository.countByOrderDateBetween(from, to);

        if (orderCount == 0 || totalRevenue == null) {
            return BigDecimal.ZERO;
        }

        // Dzielenie sumy przez liczbę zamówień z zaokrągleniem do 2 miejsc po przecinku
        return totalRevenue.divide(new BigDecimal(orderCount), 2, RoundingMode.HALF_UP);
    }

    /**
     * Pobiera statystyki statusów zamówień dla wykresu kołowego w raporcie
     */
    public Map<OrderStatus, Long> getOrdersCountByStatusInPeriod(LocalDateTime from, LocalDateTime to) {
        List<Object[]> results = orderRepository.countOrdersByStatusInPeriod(from, to);

        Map<OrderStatus, Long> statusMap = new HashMap<>();

        // Opcjonalnie: Inicjalizacja mapy zerami dla wszystkich dostępnych statusów
        for (OrderStatus status : OrderStatus.values()) {
            statusMap.put(status, 0L);
        }

        for (Object[] row : results) {
            OrderStatus status = (OrderStatus) row[0];
            Long count = ((Number) row[1]).longValue();
            statusMap.put(status, count);
        }

        return statusMap;
    }

    @Transactional
    public Order createOrderForGuest(GuestCheckoutDto guestDto,
                                     PaymentMethod paymentMethod,
                                     DeliveryMethod deliveryMethod) {
        if (cartService.isEmpty()) {
            throw new IllegalStateException("Cannot create order with empty cart");
        }

        Order order = new Order();
        order.setOrderNumber(generateOrderNumber());
        order.setGuestEmail(guestDto.getEmail());
        order.setGuestName(guestDto.getName());
        order.setGuestPhone(guestDto.getPhone());
        order.setPaymentMethod(paymentMethod);
        order.setDeliveryMethod(deliveryMethod);
        order.setDeliveryCost(deliveryMethod.getPrice());

        Address shippingAddress = new Address();
        shippingAddress.setStreet(guestDto.getStreet());
        shippingAddress.setCity(guestDto.getCity());
        shippingAddress.setZipCode(guestDto.getZipCode());
        shippingAddress.setCountry(guestDto.getCountry());
        order.setShippingAddress(shippingAddress);

        populateOrderItems(order);
        order.calculateTotal();

        Order savedOrder = orderRepository.save(order);
        cartService.clear();

        return savedOrder;
    }

    private void populateOrderItems(Order order) {
        Map<Long, Integer> cartItems = cartService.getCartMap();

        for (Map.Entry<Long, Integer> entry : cartItems.entrySet()) {
            Product product = productService.getProductById(entry.getKey());
            Integer quantity = entry.getValue();

            // Reserve stock
            productService.reserveStock(product.getId(), quantity);

            OrderItem item = new OrderItem();
            item.setProduct(product);
            item.setQuantity(quantity);
            item.setPrice(product.getPrice());
            order.addItem(item);
        }
    }

    public Order getOrderByNumber(String orderNumber) {
        return orderRepository.findByOrderNumber(orderNumber)
                .orElseThrow(() -> new RuntimeException("Order not found: " + orderNumber));
    }

    public List<Order> getOrdersForUser(User user) {
        return orderRepository.findByUserOrderByOrderDateDesc(user);
    }

    public List<Order> getOrdersForGuestEmail(String email) {
        return orderRepository.findByGuestEmailOrderByOrderDateDesc(email);
    }

    public byte[] exportToCSV(OrderStatus status, LocalDateTime from, LocalDateTime to) {
        // 1. Pobierz zamówienia według filtrów
        List<Order> orders;
        if (status != null) {
            orders = orderRepository.findByStatusAndOrderDateBetween(status, from, to);
        } else {
            orders = orderRepository.findByOrderDateBetween(from, to);
        }

        // 2. Buduj zawartość CSV
        StringBuilder csv = new StringBuilder();
        csv.append("ID;Numer;Data;Klient;Suma;Status\n"); // Nagłówek

        for (Order o : orders) {
            csv.append(o.getId()).append(";")
                    .append(o.getOrderNumber()).append(";")
                    .append(o.getOrderDate()).append(";")
                    .append(o.getUser() != null ? o.getUser().getEmail() : "Gość").append(";")
                    .append(o.getTotalAmount()).append(";")
                    .append(o.getStatus()).append("\n");
        }

        return csv.toString().getBytes(StandardCharsets.UTF_8);
    }

    @Transactional
    public void addTrackingNumber(Long orderId, String trackingNumber, DeliveryMethod carrier) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new IllegalArgumentException("Nie znaleziono zamówienia o ID: " + orderId));

        // 1. Aktualizacja danych przesyłki
        order.setTrackingNumber(trackingNumber);
        order.setDeliveryMethod(carrier);

        // 2. Automatyczna zmiana statusu na wysłane
        order.setStatus(OrderStatus.SHIPPED);

        // 3. Dodanie notatki o wysyłce
        String shippingNote = String.format("[%s] Zamówienie wysłane. Przewoźnik: %s, Numer: %s",
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                carrier,
                trackingNumber);

        order.setAdminNotes(order.getAdminNotes() != null ?
                order.getAdminNotes() + "\n" + shippingNote : shippingNote);

        orderRepository.save(order);
        log.info("Zamówienie {} zostało oznaczone jako wysłane. Przewoźnik: {}", orderId, carrier);
    }

    @Transactional
    public void updateOrderStatus(Long orderId, OrderStatus newStatus, User currentUser) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Zamówienie o ID " + orderId + " nie istnieje"));

        // Sprawdzenie uprawnień na podstawie Enuma (zamiast getRoles().contains())
        if (currentUser == null || currentUser.getRole() != UserRole.ADMIN) {
            throw new RuntimeException("Tylko administratorzy mogą zmieniać status zamówienia");
        }

        order.setStatus(newStatus);
        orderRepository.save(order);

        log.info("Zmieniono status zamówienia {} na {} przez {}", orderId, newStatus, currentUser.getEmail());
    }

    @Transactional
    public void updatePaymentStatus(Long orderId, PaymentStatus newStatus) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new IllegalArgumentException("Nie znaleziono zamówienia o ID: " + orderId));

        order.setPaymentStatus(newStatus);

        if (newStatus == PaymentStatus.PAID && order.getStatus() == OrderStatus.PENDING) {
            order.setStatus(OrderStatus.PROCESSING);
        }

        String paymentNote = String.format("[%s] Status płatności zmieniony na: %s",
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                newStatus.name()); // Używamy .name(), aby wyciągnąć tekst z Enuma

        order.setAdminNotes(order.getAdminNotes() != null ?
                order.getAdminNotes() + "\n" + paymentNote : paymentNote);

        orderRepository.save(order);
    }

    private String generateOrderNumber() {
        return "ORD-" + LocalDateTime.now().getYear() +
                String.format("%08d", UUID.randomUUID().getMostSignificantBits() & 0xFFFFFFFFL);
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public long getTotalOrdersCount(User user) {
        return orderRepository.countByUser(user);
    }

    public BigDecimal getTotalAmountSpent(User user) {
        BigDecimal total = orderRepository.sumTotalSpentByUser(user);
        return total != null ? total : BigDecimal.ZERO;
    }

    public List<Order> findRecentByUser(User user, int limit) {
        return orderRepository.findTop3ByUserOrderByOrderDateDesc(user);
    }

    public List<Order> findAllByUser(User user) {
        return orderRepository.findAllByUserOrderByOrderDateDesc(user);
    }

    @Transactional
    public void cancelOrder(Long orderId, User user) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new IllegalArgumentException("Zamówienie nie istnieje"));

        // Sprawdzenie uprawnień (chyba że to Admin)
        if (user.getRole() != UserRole.ADMIN && !order.getUser().getId().equals(user.getId())) {
            throw new IllegalStateException("Nie masz uprawnień do tego zamówienia.");
        }

        // Wywołanie bazowej logiki anulowania
        performCancellation(order, "Anulowano przez użytkownika: " + user.getEmail());
    }

    @Transactional
    public void cancelOrderByAdmin(Long orderId, String reason) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new IllegalArgumentException("Zamówienie nie istnieje"));

        performCancellation(order, "Anulowano przez administratora. Powód: " + reason);
    }

    // Wspólna logika (Prywatna)
    private void performCancellation(Order order, String note) {
        if (order.getStatus() == OrderStatus.CANCELLED) {
            throw new IllegalStateException("Zamówienie jest już anulowane.");
        }

        // ✅ KLUCZOWE: Przywracanie stanów magazynowych
        for (OrderItem item : order.getItems()) {
            Product product = item.getProduct();
            if (product != null) {
                product.setStockQuantity(product.getStockQuantity() + item.getQuantity());
                // productRepository.save(product); // Nie jest konieczne przy @Transactional, ale bezpieczne
            }
        }

        order.setStatus(OrderStatus.CANCELLED);
        order.setAdminNotes(order.getAdminNotes() != null ?
                order.getAdminNotes() + "\n" + note : note);

        orderRepository.save(order);
    }

    // Filtrowanie po statusie zamówienia
    public Page<Order> findByStatus(OrderStatus status, Pageable pageable) {
        return orderRepository.findByStatus(status, pageable);
    }

    // Filtrowanie po statusie płatności (jeśli masz takie pole w encji)
    public Page<Order> findByPaymentStatus(PaymentStatus paymentStatus, Pageable pageable) {
        // Zakładam, że masz pole paymentStatus typu String lub Enum
        return orderRepository.findByPaymentStatus(paymentStatus, pageable);
    }

    // Metoda dla statystyk (zwraca listę zamówień o danym statusie)
    public List<Order> getOrdersByStatus(OrderStatus status) {
        return orderRepository.findByStatus(status);
    }

    // ==================== NOWE METODY DLA PANELU ADMIN ====================

    // ==================== STATYSTYKI ZAMÓWIEŃ ====================

    /**
     * Zlicz zamówienia dzisiejsze
     */
    public long getTodayOrdersCount() {
        LocalDateTime startOfDay = LocalDateTime.now().withHour(0).withMinute(0).withSecond(0);
        LocalDateTime endOfDay = LocalDateTime.now().withHour(23).withMinute(59).withSecond(59);
        return orderRepository.countByOrderDateBetween(startOfDay, endOfDay);
    }

    /**
     * Zlicz zamówienia oczekujące
     */
    public long getPendingOrdersCount() {
        return orderRepository.countByStatus(OrderStatus.PENDING);
    }

    /**
     * Zlicz zamówienia w realizacji
     */
    public long getProcessingOrdersCount() {
        return orderRepository.countByStatus(OrderStatus.PROCESSING);
    }

    @Transactional
    public void processItemReturn(Long orderId, Long itemId, Integer quantity, String reason) {
        // 1. Pobierz zamówienie
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Zamówienie nie znalezione"));

        // 2. Znajdź konkretną pozycję w zamówieniu
        OrderItem item = order.getItems().stream()
                .filter(i -> i.getId().equals(itemId))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Nie znaleziono pozycji o ID: " + itemId));

        // 3. Walidacja ilości
        if (quantity <= 0) {
            throw new IllegalArgumentException("Ilość zwracana musi być większa od zera");
        }
        if (quantity > item.getQuantity()) {
            throw new IllegalArgumentException("Nie można zwrócić więcej niż zakupiono (max: " + item.getQuantity() + ")");
        }

        // 4. Zwiększ stan magazynowy produktu (powrót na półkę)
        productService.increaseStock(item.getProduct().getId(), quantity);

        // 5. Zaktualizuj pozycję w zamówieniu (opcjonalnie - zależy czy robisz korektę faktury)
        // Jeśli chcesz zachować historię, lepiej dodać pole 'returnedQuantity' do OrderItem

        // 6. Dodaj notatkę o zwrocie
        String returnNote = String.format("ZWROT [%s]: Produkt: %s, Ilość: %d. Powód: %s",
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                item.getProduct().getName(),
                quantity,
                (reason != null && !reason.isEmpty() ? reason : "nie podano"));

        order.setAdminNotes(order.getAdminNotes() != null ?
                order.getAdminNotes() + "\n" + returnNote : returnNote);

        // 7. Zapisz zmiany
        orderRepository.save(order);

        log.info("Przetworzono zwrot dla zamówienia {}: {}x {}", orderId, quantity, item.getProduct().getName());
    }

    /**
     * Pobierz przychód dzisiejszy
     */
    public BigDecimal getTodayRevenue() {
        LocalDateTime startOfDay = LocalDateTime.now().withHour(0).withMinute(0).withSecond(0);
        LocalDateTime endOfDay = LocalDateTime.now().withHour(23).withMinute(59).withSecond(59);
        BigDecimal revenue = orderRepository.sumTotalAmountByOrderDateBetween(startOfDay, endOfDay);
        return revenue != null ? revenue : BigDecimal.ZERO;
    }

    /**
     * Pobierz przychód tygodniowy
     */
    public BigDecimal getWeekRevenue() {
        LocalDateTime weekAgo = LocalDateTime.now().minusWeeks(1);
        LocalDateTime now = LocalDateTime.now();
        BigDecimal revenue = orderRepository.sumTotalAmountByOrderDateBetween(weekAgo, now);
        return revenue != null ? revenue : BigDecimal.ZERO;
    }

    /**
     * Pobierz przychód miesięczny
     */
    public BigDecimal getMonthRevenue() {
        LocalDateTime monthAgo = LocalDateTime.now().minusMonths(1);
        LocalDateTime now = LocalDateTime.now();
        BigDecimal revenue = orderRepository.sumTotalAmountByOrderDateBetween(monthAgo, now);
        return revenue != null ? revenue : BigDecimal.ZERO;
    }

    /**
     * Pobierz przychód w okresie
     */
    public BigDecimal getRevenueInPeriod(LocalDateTime from, LocalDateTime to) {
        BigDecimal revenue = orderRepository.sumTotalAmountByOrderDateBetween(from, to);
        return revenue != null ? revenue : BigDecimal.ZERO;
    }

    /**
     * Zlicz zamówienia w okresie
     */
    public long getOrdersCountInPeriod(LocalDateTime from, LocalDateTime to) {
        return orderRepository.countByOrderDateBetween(from, to);
    }

    /**
     * Oblicz procent wzrostu
     */
    public Double calculateGrowthPercentage(BigDecimal previousValue, BigDecimal currentValue) {
        if (previousValue == null || previousValue.compareTo(BigDecimal.ZERO) == 0) {
            return currentValue.compareTo(BigDecimal.ZERO) > 0 ? 100.0 : 0.0;
        }

        BigDecimal difference = currentValue.subtract(previousValue);
        BigDecimal percentage = difference.multiply(new BigDecimal("100"))
                .divide(previousValue, 2, RoundingMode.HALF_UP);
        return percentage.doubleValue();
    }

    /**
     * Oblicz procent wzrostu (dla long)
     */
    public Double calculateGrowthPercentage(long previousValue, long currentValue) {
        return calculateGrowthPercentage(
                new BigDecimal(previousValue),
                new BigDecimal(currentValue)
        );
    }

    public Map<String, Double> getWeeklySalesStats() {
        List<Object[]> results = orderRepository.findWeeklySalesRaw();
        Map<String, Double> stats = new LinkedHashMap<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM");

        for (Object[] result : results) {
            LocalDate localDate;

            if (result[0] instanceof java.sql.Date) {
                localDate = ((java.sql.Date) result[0]).toLocalDate();
            } else if (result[0] instanceof LocalDate) {
                localDate = (LocalDate) result[0];
            } else {
                throw new IllegalStateException("Unexpected date type: " + result[0].getClass());
            }

            String date = localDate.format(formatter);
            Double total = ((Number) result[1]).doubleValue();
            stats.put(date, total);
        }
        return stats;
    }


    // ==================== OSTATNIE ZAMÓWIENIA ====================

    /**
     * Pobierz ostatnie zamówienia
     */
    public List<Order> getRecentOrders(int limit) {
        return orderRepository.findRecentOrders(PageRequest.of(0, limit));
    }

    /**
     * Pobierz oczekujące zamówienia
     */
    public List<Order> getPendingOrders(int limit) {
        return orderRepository.findByStatusOrderByOrderDateDesc(
                OrderStatus.PENDING,
                PageRequest.of(0, limit)
        );
    }

    // ==================== BESTSELLERY ====================

    /**
     * Pobierz najlepiej sprzedające się produkty
     */
    public List<Map<String, Object>> getTopSellingProducts(LocalDateTime from, LocalDateTime to, int limit) {
        List<Object[]> results = orderRepository.findTopSellingProducts(from, to, PageRequest.of(0, limit));

        return results.stream().map(row -> {
            Map<String, Object> productData = new HashMap<>();
            productData.put("product", row[0]); // Product object
            productData.put("totalQuantity", ((Number) row[1]).longValue());
            productData.put("totalRevenue", (BigDecimal) row[2]);
            return productData;
        }).collect(Collectors.toList());
    }

    // ==================== WYKRESY ====================

    /**
     * Pobierz dzienny przychód (dla wykresów)
     */
    public Map<LocalDate, BigDecimal> getDailyRevenue(LocalDateTime from, LocalDateTime to) {
        List<Object[]> results = orderRepository.findDailyRevenue(from, to);

        Map<LocalDate, BigDecimal> revenueMap = new LinkedHashMap<>();

        for (Object[] row : results) {
            LocalDate date = ((java.sql.Date) row[0]).toLocalDate();
            BigDecimal revenue = (BigDecimal) row[1];
            revenueMap.put(date, revenue);
        }

        return revenueMap;
    }

    /**
     * Pobierz dzienną liczbę zamówień (dla wykresów)
     */
    public Map<LocalDate, Long> getDailyOrdersCount(LocalDateTime from, LocalDateTime to) {
        List<Object[]> results = orderRepository.findDailyOrdersCount(from, to);

        Map<LocalDate, Long> ordersMap = new LinkedHashMap<>();

        for (Object[] row : results) {
            LocalDate date = ((java.sql.Date) row[0]).toLocalDate();
            Long count = ((Number) row[1]).longValue();
            ordersMap.put(date, count);
        }

        return ordersMap;
    }

    /**
     * Pobierz liczbę zamówień według statusu (dla wykresów kołowych)
     */
    public Map<OrderStatus, Long> getOrdersCountByStatus() {
        List<Object[]> results = orderRepository.countOrdersByStatus();

        Map<OrderStatus, Long> statusMap = new HashMap<>();

        for (Object[] row : results) {
            OrderStatus status = (OrderStatus) row[0];
            Long count = ((Number) row[1]).longValue();
            statusMap.put(status, count);
        }

        return statusMap;
    }

    // ==================== FILTROWANIE I WYSZUKIWANIE ====================

    /**
     * Pobierz wszystkie zamówienia z paginacją
     */
    public Page<Order> getAllOrders(Pageable pageable) {
        return orderRepository.findAll(pageable);
    }

    /**
     * Filtruj zamówienia
     */
    public Page<Order> filterOrders(
            OrderStatus status,
            PaymentStatus paymentStatus,
            LocalDateTime dateFrom,
            LocalDateTime dateTo,
            String search,
            Pageable pageable) {

        return orderRepository.filterOrders(status, paymentStatus, dateFrom, dateTo, search, pageable);
    }

    /**
     * Wyszukaj zamówienia
     */
    public Page<Order> searchOrders(String query, Pageable pageable) {
        return orderRepository.searchOrders(query, pageable);
    }

    // ==================== ZARZĄDZANIE STATUSEM (rozszerzone) ====================

    /**
     * Zmień status zamówienia (z notyfikacjami)
     */
    @Transactional
    public void changeOrderStatus(Long orderId, OrderStatus newStatus, String note) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Zamówienie nie znalezione"));

        OrderStatus oldStatus = order.getStatus();
        order.changeStatus(newStatus);

        if (note != null && !note.isEmpty()) {
            order.setAdminNotes(order.getAdminNotes() != null ?
                    order.getAdminNotes() + "\n" + note : note);
        }

        orderRepository.save(order);

        // TODO: Wyślij email o zmianie statusu
        log.info("Zmieniono status zamówienia {} z {} na {}", orderId, oldStatus, newStatus);
    }

    /**
     * Anuluj zamówienie (przez admina)
     */
    @Transactional
    public void adminCancelOrder(Long orderId, String reason) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Zamówienie nie znalezione"));

        order.cancel(reason);
        orderRepository.save(order);

        log.info("Admin anulował zamówienie {}: {}", orderId, reason);
    }

    // ==================== RAPORTY ====================

    /**
     * Pobierz raport sprzedaży
     */
    public Map<String, Object> getSalesReport(LocalDateTime from, LocalDateTime to) {
        Map<String, Object> report = new HashMap<>();

        // Podstawowe statystyki
        long totalOrders = getOrdersCountInPeriod(from, to);
        BigDecimal totalRevenue = getRevenueInPeriod(from, to);

        // Średnia wartość zamówienia
        BigDecimal avgOrderValue = totalOrders > 0 ?
                totalRevenue.divide(new BigDecimal(totalOrders), 2, RoundingMode.HALF_UP) :
                BigDecimal.ZERO;

        // Zamówienia według statusu
        Map<OrderStatus, Long> ordersByStatus = getOrdersCountByStatus();

        // Top produkty
        List<Map<String, Object>> topProducts = getTopSellingProducts(from, to, 10);

        report.put("totalOrders", totalOrders);
        report.put("totalRevenue", totalRevenue);
        report.put("avgOrderValue", avgOrderValue);
        report.put("ordersByStatus", ordersByStatus);
        report.put("topProducts", topProducts);
        report.put("period", Map.of("from", from, "to", to));

        return report;
    }

    /**
     * Pobierz top klientów
     */
    public List<Map<String, Object>> getTopCustomers(int limit) {
        List<Object[]> results = orderRepository.findTopCustomers(PageRequest.of(0, limit));

        return results.stream().map(row -> {
            Map<String, Object> customerData = new HashMap<>();
            customerData.put("user", row[0]); // User object
            customerData.put("orderCount", ((Number) row[1]).longValue());
            customerData.put("totalSpent", (BigDecimal) row[2]);
            return customerData;
        }).collect(Collectors.toList());
    }

    // ==================== EKSPORT ====================

    /**
     * Eksportuj zamówienia do CSV
     */
    public String exportToCSV(
            OrderStatus status,
            PaymentStatus paymentStatus,
            LocalDateTime dateFrom,
            LocalDateTime dateTo) {

        log.info("Rozpoczynanie eksportu zamówień do CSV. Filtry - Status: {}, PaymentStatus: {}", status, paymentStatus);

        // 1. Pobierz dane z bazy przy użyciu istniejącej metody filtrującej
        // Używamy Pageable.unpaged(), aby pobrać wszystkie rekordy spełniające kryteria
        List<Order> orders = orderRepository.filterOrders(
                status, paymentStatus, dateFrom, dateTo, null, org.springframework.data.domain.Pageable.unpaged()
        ).getContent();

        String filename = "orders_export_" + System.currentTimeMillis() + ".csv";

        // 2. Generowanie treści CSV
        StringBuilder csvContent = new StringBuilder();
        csvContent.append("Numer Zamowienia;Data;Klient;Status;Status Platnosci;Suma\n");

        for (Order order : orders) {
            String client = order.getUser() != null ? order.getUser().getEmail() : order.getGuestEmail();
            csvContent.append(String.format("%s;%s;%s;%s;%s;%s\n",
                    order.getOrderNumber(),
                    order.getOrderDate(),
                    client,
                    order.getStatus(),
                    order.getPaymentStatus(),
                    order.getTotalAmount()
            ));
        }

        // 3. Zapis do pliku (w realnej aplikacji użyłbyś biblioteki np. OpenCSV lub zapisał do zasobu/dysku)
        // Na potrzeby tego etapu zwracamy wygenerowaną nazwę
        log.info("Wyeksportowano {} zamówień do pliku {}", orders.size(), filename);

        return filename;
    }

    @Transactional
    public int bulkStatusChange(List<Long> orderIds, OrderStatus newStatus) {
        if (orderIds == null || orderIds.isEmpty()) {
            log.warn("Próba masowej zmiany statusu dla pustej listy ID");
            return 0;
        }

        log.info("Rozpoczynanie masowej zmiany statusu na {} dla {} zamówień", newStatus, orderIds.size());

        // Wywołanie zoptymalizowanego zapytania w repozytorium
        int updatedCount = orderRepository.updateStatusForIds(orderIds, newStatus);

        log.info("Pomyślnie zaktualizowano {} zamówień", updatedCount);
        return updatedCount;
    }

    // ==================== STATYSTYKI ZAAWANSOWANE ====================

    /**
     * Pobierz statystyki zamówień według metody płatności
     */
    public Map<PaymentMethod, Long> getOrdersByPaymentMethod() {
        List<Object[]> results = orderRepository.countOrdersByPaymentMethod();

        Map<PaymentMethod, Long> paymentMap = new HashMap<>();
        for (Object[] row : results) {
            PaymentMethod method = (PaymentMethod) row[0];
            Long count = ((Number) row[1]).longValue();
            paymentMap.put(method, count);
        }

        return paymentMap;
    }

    /**
     * Pobierz statystyki zamówień według metody dostawy
     */
    public Map<DeliveryMethod, Long> getOrdersByDeliveryMethod() {
        List<Object[]> results = orderRepository.countOrdersByDeliveryMethod();

        Map<DeliveryMethod, Long> deliveryMap = new HashMap<>();
        for (Object[] row : results) {
            DeliveryMethod method = (DeliveryMethod) row[0];
            Long count = ((Number) row[1]).longValue();
            deliveryMap.put(method, count);
        }

        return deliveryMap;
    }

    /**
     * Pobierz średni czas realizacji zamówienia
     */
//    public Double getAverageProcessingTime() {
//        Double avgHours = orderRepository.calculateAverageProcessingTime();
//        return avgHours != null ? avgHours : 0.0;
//    }

    /**
     * Zlicz wszystkie zamówienia
     */
    public long getTotalOrdersCount() {
        return orderRepository.count();
    }

    public long getCompletedOrdersCount() {
        return orderRepository.countByStatus(OrderStatus.DELIVERED);
    }

    public List<Map<String, Object>> getTopCustomers(LocalDateTime from, LocalDateTime to, int limit) {
        // Implementacja pobierająca klientów z największą sumą zamówień w okresie
        List<Object[]> results = orderRepository.findTopCustomersInPeriod(from, to, PageRequest.of(0, limit));
        return results.stream().map(row -> Map.of(
                "user", row[0],
                "orderCount", row[1],
                "totalSpent", row[2]
        )).toList();
    }

    public Map<LocalDate, BigDecimal> getRevenueChartData(int days) {
        LocalDateTime from = LocalDateTime.now().minusDays(days);
        LocalDateTime to = LocalDateTime.now();
        return getDailyRevenue(from, to);
    }

    public List<String> getOrderStatusHistory(Long orderId) {
        // Jeśli nie masz tabeli historycznej, możesz zwracać adminNotes podzielone na linie
        Order order = getOrderById(orderId);
        return order.getAdminNotes() != null ?
                Arrays.asList(order.getAdminNotes().split("\n")) :
                List.of("Brak historii dla tego zamówienia");
    }

    public BigDecimal getTotalRevenue() {
        BigDecimal revenue = orderRepository.sumTotalRevenue();
        return revenue != null ? revenue : BigDecimal.ZERO;
    }

    // ==================== SPRAWDZANIE ZAKUPU PRODUKTU ====================

    /**
     * Sprawdź czy użytkownik kupił produkt i może go ocenić
     * (zamówienie dostarczone lub zwrócone)
     */
    public boolean canUserReviewProduct(Long userId, Long productId) {
        return orderRepository.hasUserPurchasedProduct(userId, productId);
    }

    /**
     * Pobierz produkty które użytkownik może ocenić
     */
    public List<Product> getReviewableProductsForUser(Long userId) {
        return orderRepository.findReviewableProductsForUser(userId);
    }

}