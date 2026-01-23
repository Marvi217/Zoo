package com.example.zoo.service;

import com.example.zoo.dto.PromotionDTO;
import com.example.zoo.entity.*;
import com.example.zoo.enums.PromotionType;
import com.example.zoo.repository.*;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class PromotionService {

    private final PromotionRepository promotionRepository;
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;

    // ==================== CRUD OPERATIONS ====================

    /**
     * Pobierz wszystkie promocje z paginacją
     */
    public Page<Promotion> getAllPromotions(Pageable pageable) {
        log.debug("Pobieranie wszystkich promocji, strona: {}", pageable.getPageNumber());
        return promotionRepository.findAll(pageable);
    }

    /**
     * Pobierz promocję po ID
     */
    public Promotion getPromotionById(Long id) {
        log.debug("Pobieranie promocji o ID: {}", id);
        return promotionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Promocja o ID " + id + " nie została znaleziona"));
    }

    /**
     * Pobierz promocję po kodzie
     */
    public Optional<Promotion> getPromotionByCode(String code) {
        log.debug("Pobieranie promocji o kodzie: {}", code);
        return promotionRepository.findByCodeIgnoreCase(code);
    }

    /**
     * Utwórz nową promocję
     */
    @Transactional
    public Promotion createPromotion(PromotionDTO dto) {
        log.info("Tworzenie nowej promocji: {}", dto.getName());

        // Walidacja
        validatePromotionDTO(dto);

        // Sprawdź unikalność kodu
        if (dto.getCode() != null && !dto.getCode().isEmpty()) {
            if (promotionRepository.existsByCode(dto.getCode())) {
                throw new RuntimeException("Kod promocyjny '" + dto.getCode() + "' już istnieje");
            }
        }

        // Utwórz encję
        Promotion promotion = Promotion.builder()
                .name(dto.getName())
                .description(dto.getDescription())
                .type(dto.getType())
                .discountPercentage(dto.getDiscountPercentage())
                .discountAmount(dto.getDiscountAmount())
                .startDate(dto.getStartDate())
                .endDate(dto.getEndDate())
                .active(dto.isActive())
                .code(dto.getCode())
                .minOrderAmount(dto.getMinOrderAmount())
                .maxUsage(dto.getMaxUsage())
                .currentUsage(0)
                .priority(0)
                .stackable(false)
                .featured(false)
                .build();

        // Przypisz produkty jeśli podano
        if (dto.getProductIds() != null && !dto.getProductIds().isEmpty()) {
            Set<Product> products = new HashSet<>(
                    productRepository.findAllById(dto.getProductIds())
            );
            promotion.setProducts(products);
        }

        Promotion saved = promotionRepository.save(promotion);
        log.info("Utworzono promocję o ID: {}", saved.getId());

        return saved;
    }

    /**
     * Aktualizuj promocję
     */
    @Transactional
    public Promotion updatePromotion(Long id, PromotionDTO dto) {
        log.info("Aktualizacja promocji o ID: {}", id);

        Promotion promotion = getPromotionById(id);

        // Walidacja
        validatePromotionDTO(dto);

        // Sprawdź unikalność kodu (z wyłączeniem aktualnej promocji)
        if (dto.getCode() != null && !dto.getCode().isEmpty()) {
            if (promotionRepository.existsByCodeAndIdNot(dto.getCode(), id)) {
                throw new RuntimeException("Kod promocyjny '" + dto.getCode() + "' już istnieje");
            }
        }

        // Aktualizuj pola
        promotion.setName(dto.getName());
        promotion.setDescription(dto.getDescription());
        promotion.setType(dto.getType());
        promotion.setDiscountPercentage(dto.getDiscountPercentage());
        promotion.setDiscountAmount(dto.getDiscountAmount());
        promotion.setStartDate(dto.getStartDate());
        promotion.setEndDate(dto.getEndDate());
        promotion.setActive(dto.isActive());
        promotion.setCode(dto.getCode());
        promotion.setMinOrderAmount(dto.getMinOrderAmount());
        promotion.setMaxUsage(dto.getMaxUsage());

        // Aktualizuj produkty
        if (dto.getProductIds() != null) {
            promotion.getProducts().clear();
            if (!dto.getProductIds().isEmpty()) {
                Set<Product> products = new HashSet<>(
                        productRepository.findAllById(dto.getProductIds())
                );
                promotion.setProducts(products);
            }
        }

        Promotion updated = promotionRepository.save(promotion);
        log.info("Zaktualizowano promocję o ID: {}", id);

        return updated;
    }

    /**
     * Usuń promocję
     */
    @Transactional
    public void deletePromotion(Long id) {
        log.info("Usuwanie promocji o ID: {}", id);

        Promotion promotion = getPromotionById(id);

        // Sprawdź czy promocja nie była użyta w zamówieniach
        if (!promotion.getOrders().isEmpty()) {
            throw new RuntimeException(
                    "Nie można usunąć promocji, która była użyta w zamówieniach. " +
                            "Możesz ją zdezaktywować zamiast usuwać."
            );
        }

        // Usuń powiązania z produktami
        promotion.getProducts().forEach(product ->
                product.getPromotions().remove(promotion)
        );
        promotion.getProducts().clear();

        promotionRepository.delete(promotion);
        log.info("Usunięto promocję o ID: {}", id);
    }

    // ==================== ZARZĄDZANIE STATUSEM ====================

    /**
     * Aktywuj/dezaktywuj promocję
     */
    @Transactional
    public void toggleActive(Long id) {
        Promotion promotion = getPromotionById(id);
        promotion.setActive(!promotion.isActive());
        promotionRepository.save(promotion);
        log.info("Zmieniono status promocji {} na: {}", id, promotion.isActive());
    }

    /**
     * Aktywuj promocję
     */
    @Transactional
    public void activatePromotion(Long id) {
        Promotion promotion = getPromotionById(id);
        promotion.setActive(true);
        promotionRepository.save(promotion);
        log.info("Aktywowano promocję o ID: {}", id);
    }

    /**
     * Dezaktywuj promocję
     */
    @Transactional
    public void deactivatePromotion(Long id) {
        Promotion promotion = getPromotionById(id);
        promotion.setActive(false);
        promotionRepository.save(promotion);
        log.info("Dezaktywowano promocję o ID: {}", id);
    }

    // ==================== WYSZUKIWANIE ====================

    /**
     * Pobierz aktywne promocje
     */
    public Page<Promotion> getActivePromotions(Pageable pageable) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findActivePromotionsForDate(now, pageable);
    }

    /**
     * Pobierz nadchodzące promocje
     */
    public Page<Promotion> getUpcomingPromotions(Pageable pageable) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findUpcomingPromotions(now, pageable);
    }

    /**
     * Pobierz wygasłe promocje
     */
    public Page<Promotion> getExpiredPromotions(Pageable pageable) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findExpiredPromotions(now, pageable);
    }

    /**
     * Pobierz promocje według typu
     */
    public Page<Promotion> getPromotionsByType(PromotionType type, Pageable pageable) {
        return promotionRepository.findByType(type, pageable);
    }

    /**
     * Wyszukaj promocje
     */
    public Page<Promotion> searchPromotions(String search, Pageable pageable) {
        return promotionRepository.searchPromotions(search, pageable);
    }

    // ==================== PROMOCJE DLA PRODUKTÓW ====================

    /**
     * Pobierz aktywne promocje dla produktu
     */
    public List<Promotion> getActivePromotionsForProduct(Long productId) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findActivePromotionsForProduct(productId, now);
    }

    /**
     * Pobierz najlepszą promocję dla produktu
     */
    public Optional<Promotion> getBestPromotionForProduct(Long productId) {
        LocalDate now = LocalDate.now();
        List<Promotion> promotions = promotionRepository.findBestPromotionForProduct(
                productId, now, PageRequest.of(0, 1)
        );
        return promotions.isEmpty() ? Optional.empty() : Optional.of(promotions.get(0));
    }

    /**
     * Zastosuj promocję do produktów
     */
    @Transactional
    public void applyPromotionToProducts(Long promotionId, List<Long> productIds) {
        log.info("Stosowanie promocji {} do {} produktów", promotionId, productIds.size());

        Promotion promotion = getPromotionById(promotionId);
        List<Product> products = productRepository.findAllById(productIds);

        products.forEach(promotion::addProduct);

        promotionRepository.save(promotion);
        log.info("Zastosowano promocję do produktów");
    }

    /**
     * Usuń promocję z produktów
     */
    @Transactional
    public void removePromotionFromProducts(Long promotionId, List<Long> productIds) {
        log.info("Usuwanie promocji {} z {} produktów", promotionId, productIds.size());

        Promotion promotion = getPromotionById(promotionId);
        List<Product> products = productRepository.findAllById(productIds);

        products.forEach(promotion::removeProduct);

        promotionRepository.save(promotion);
        log.info("Usunięto promocję z produktów");
    }

    // ==================== OBLICZENIA ====================

    /**
     * Oblicz zniżkę dla produktu
     */
    public BigDecimal calculateDiscountForProduct(Product product) {
        List<Promotion> promotions = getActivePromotionsForProduct(product.getId());

        if (promotions.isEmpty()) {
            return BigDecimal.ZERO;
        }

        // Znajdź największą zniżkę
        return promotions.stream()
                .map(promo -> promo.calculateDiscount(product.getPrice()))
                .max(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);
    }

    /**
     * Oblicz cenę po rabacie dla produktu
     */
    public BigDecimal calculateDiscountedPriceForProduct(Product product) {
        BigDecimal discount = calculateDiscountForProduct(product);
        return product.getPrice().subtract(discount).max(BigDecimal.ZERO);
    }

    /**
     * Waliduj kod promocyjny
     */
    public Optional<Promotion> validatePromotionCode(String code, BigDecimal orderAmount) {
        Optional<Promotion> promotionOpt = getPromotionByCode(code);

        if (promotionOpt.isEmpty()) {
            log.debug("Kod promocyjny '{}' nie istnieje", code);
            return Optional.empty();
        }

        Promotion promotion = promotionOpt.get();

        // Sprawdź czy promocja jest aktywna
        if (!promotion.isCurrentlyActive()) {
            log.debug("Promocja '{}' nie jest obecnie aktywna", code);
            return Optional.empty();
        }

        // Sprawdź minimalną kwotę zamówienia
        if (!promotion.isApplicableForAmount(orderAmount)) {
            log.debug("Zamówienie nie spełnia minimalnej kwoty dla promocji '{}'", code);
            return Optional.empty();
        }

        return Optional.of(promotion);
    }

    // ==================== UŻYCIE PROMOCJI ====================

    /**
     * Zwiększ licznik użyć promocji
     */
    @Transactional
    public void incrementPromotionUsage(Long promotionId) {
        Promotion promotion = getPromotionById(promotionId);
        promotion.incrementUsage();
        promotionRepository.save(promotion);
        log.debug("Zwiększono licznik użyć promocji {}: {}", promotionId, promotion.getCurrentUsage());
    }

    /**
     * Zmniejsz licznik użyć promocji (np. przy anulowaniu zamówienia)
     */
    @Transactional
    public void decrementPromotionUsage(Long promotionId) {
        Promotion promotion = getPromotionById(promotionId);
        if (promotion.getCurrentUsage() > 0) {
            promotion.setCurrentUsage(promotion.getCurrentUsage() - 1);
            promotionRepository.save(promotion);
            log.debug("Zmniejszono licznik użyć promocji {}: {}", promotionId, promotion.getCurrentUsage());
        }
    }

    // ==================== STATYSTYKI ====================

    /**
     * Pobierz statystyki promocji
     */
    public Map<String, Object> getPromotionStatistics(Long promotionId) {
        Promotion promotion = getPromotionById(promotionId);

        Map<String, Object> stats = new HashMap<>();
        stats.put("totalUsage", promotion.getCurrentUsage());
        stats.put("maxUsage", promotion.getMaxUsage());
        stats.put("usagePercentage",
                promotion.getMaxUsage() != null ?
                        (promotion.getCurrentUsage() * 100.0 / promotion.getMaxUsage()) : null
        );
        stats.put("isActive", promotion.isCurrentlyActive());
        stats.put("daysRemaining",
                promotion.getEndDate() != null ?
                        java.time.temporal.ChronoUnit.DAYS.between(LocalDate.now(), promotion.getEndDate()) : null
        );
        stats.put("productsCount", promotion.getProducts().size());
        stats.put("ordersCount", promotion.getOrders().size());

        // Oblicz całkowitą wartość zniżek
        BigDecimal totalDiscount = promotion.getOrders().stream()
                .map(Order::getDiscountAmount)
                .filter(Objects::nonNull)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        stats.put("totalDiscountAmount", totalDiscount);

        return stats;
    }

    /**
     * Zlicz aktywne promocje
     */
    public long getActivePromotionsCount() {
        return promotionRepository.countActivePromotions(LocalDate.now());
    }

    /**
     * Pobierz promocje kończące się wkrótce
     */
    public List<Promotion> getPromotionsEndingSoon(int days) {
        LocalDate now = LocalDate.now();
        LocalDate futureDate = now.plusDays(days);
        return promotionRepository.findPromotionsEndingSoon(now, futureDate);
    }

    // ==================== DUPLIKOWANIE ====================

    /**
     * Duplikuj promocję
     */
    @Transactional
    public Promotion duplicatePromotion(Long id) {
        log.info("Duplikowanie promocji o ID: {}", id);

        Promotion original = getPromotionById(id);

        Promotion duplicate = Promotion.builder()
                .name(original.getName() + " (kopia)")
                .description(original.getDescription())
                .type(original.getType())
                .discountPercentage(original.getDiscountPercentage())
                .discountAmount(original.getDiscountAmount())
                .startDate(LocalDate.now())
                .endDate(original.getEndDate())
                .active(false) // Domyślnie nieaktywna
                .code(null) // Kod musi być unikalny
                .minOrderAmount(original.getMinOrderAmount())
                .maxUsage(original.getMaxUsage())
                .currentUsage(0)
                .maxUsagePerUser(original.getMaxUsagePerUser())
                .stackable(original.isStackable())
                .priority(original.getPriority())
                .buyQuantity(original.getBuyQuantity())
                .getQuantity(original.getGetQuantity())
                .imageUrl(original.getImageUrl())
                .featured(false)
                .build();

        // Kopiuj produkty
        duplicate.setProducts(new HashSet<>(original.getProducts()));

        // Kopiuj kategorie
        duplicate.setCategories(new HashSet<>(original.getCategories()));

        Promotion saved = promotionRepository.save(duplicate);
        log.info("Zduplikowano promocję, nowe ID: {}", saved.getId());

        return saved;
    }

    // ==================== WALIDACJA ====================

    /**
     * Sprawdź czy kod jest unikalny
     */
    public boolean isCodeUnique(String code, Long excludeId) {
        if (code == null || code.isEmpty()) {
            return true;
        }

        if (excludeId != null) {
            return !promotionRepository.existsByCodeAndIdNot(code, excludeId);
        } else {
            return !promotionRepository.existsByCode(code);
        }
    }

    /**
     * Waliduj DTO promocji
     */
    private void validatePromotionDTO(PromotionDTO dto) {
        // Walidacja typów rabatu
        switch (dto.getType()) {
            case PERCENTAGE_DISCOUNT:
                if (dto.getDiscountPercentage() == null ||
                        dto.getDiscountPercentage().compareTo(BigDecimal.ZERO) <= 0 ||
                        dto.getDiscountPercentage().compareTo(new BigDecimal("100")) > 0) {
                    throw new RuntimeException("Procent zniżki musi być między 0 a 100");
                }
                break;

            case FIXED_AMOUNT_DISCOUNT:
                if (dto.getDiscountAmount() == null ||
                        dto.getDiscountAmount().compareTo(BigDecimal.ZERO) <= 0) {
                    throw new RuntimeException("Kwota zniżki musi być większa od 0");
                }
                break;

            case BUY_X_GET_Y:
                // Dodatkowa walidacja dla tego typu może być wymagana
                break;

            default:
                // FREE_SHIPPING i inne nie wymagają kwot
                break;
        }

        // Walidacja dat
        if (dto.getEndDate() != null && dto.getStartDate().isAfter(dto.getEndDate())) {
            throw new RuntimeException("Data zakończenia musi być późniejsza niż data rozpoczęcia");
        }
    }

    // ==================== EKSPORT ====================

    /**
     * Eksportuj promocje do CSV
     */
    public String exportToCSV() {
        // Implementacja eksportu do CSV
        log.info("Eksportowanie promocji do CSV");
        // TODO: Implement CSV export
        return "promotions_" + System.currentTimeMillis() + ".csv";
    }
}