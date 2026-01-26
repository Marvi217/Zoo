package com.example.zoo.service;

import com.example.zoo.dto.PromotionDTO;
import com.example.zoo.entity.*;
import com.example.zoo.enums.PromotionType;
import com.example.zoo.repository.*;
import jakarta.persistence.EntityManager;
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
    private final EntityManager entityManager;

    public Page<Promotion> getAllPromotions(Pageable pageable) {
        log.debug("Pobieranie wszystkich promocji, strona: {}", pageable.getPageNumber());
        return promotionRepository.findAll(pageable);
    }

    public Promotion getPromotionById(Long id) {
        log.debug("Pobieranie promocji o ID: {}", id);
        return promotionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Promocja o ID " + id + " nie została znaleziona"));
    }

    public Optional<Promotion> getPromotionByCode(String code) {
        log.debug("Pobieranie promocji o kodzie: {}", code);
        return promotionRepository.findByCodeIgnoreCase(code);
    }

    @Transactional
    public Promotion createPromotion(PromotionDTO dto) {
        log.info("Tworzenie nowej promocji: {}", dto.getName());

        validatePromotionDTO(dto);

        if (dto.getCode() != null && !dto.getCode().isEmpty()) {
            if (promotionRepository.existsByCode(dto.getCode())) {
                throw new RuntimeException("Kod promocyjny '" + dto.getCode() + "' już istnieje");
            }
        }

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
                .buyQuantity(dto.getBuyQuantity())
                .getQuantity(dto.getGetQuantity())
                .build();

        Set<Product> productsSet = new HashSet<>();
        if (dto.getProductIds() != null && !dto.getProductIds().isEmpty()) {
            productsSet.addAll(productRepository.findAllById(dto.getProductIds()));
        }

        if (dto.getBrandIds() != null && !dto.getBrandIds().isEmpty()) {
            for (Long brandId : dto.getBrandIds()) {
                List<Product> brandProducts = productRepository.findByBrandId(brandId);
                productsSet.addAll(brandProducts);
            }
        }
        promotion.setProducts(productsSet);

        if (dto.getCategoryIds() != null && !dto.getCategoryIds().isEmpty()) {
            Set<Category> categories = new HashSet<>(
                    categoryRepository.findAllById(dto.getCategoryIds())
            );
            promotion.setCategories(categories);
        }

        Promotion saved = promotionRepository.save(promotion);
        return saved;
    }

    @Transactional
    public Promotion updatePromotion(Long id, PromotionDTO dto) {
        log.info("Aktualizacja promocji o ID: {}", id);

        Promotion promotion = getPromotionById(id);

        validatePromotionDTO(dto);

        if (dto.getCode() != null && !dto.getCode().isEmpty()) {
            if (promotionRepository.existsByCodeAndIdNot(dto.getCode(), id)) {
                throw new RuntimeException("Kod promocyjny '" + dto.getCode() + "' już istnieje");
            }
        }

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
        promotion.setBuyQuantity(dto.getBuyQuantity());
        promotion.setGetQuantity(dto.getGetQuantity());

        Set<Product> productsSet = new HashSet<>();
        if (dto.getProductIds() != null && !dto.getProductIds().isEmpty()) {
            productsSet.addAll(productRepository.findAllById(dto.getProductIds()));
        }

        if (dto.getBrandIds() != null && !dto.getBrandIds().isEmpty()) {
            for (Long brandId : dto.getBrandIds()) {
                List<Product> brandProducts = productRepository.findByBrandId(brandId);
                productsSet.addAll(brandProducts);
            }
        }
        promotion.getProducts().clear();
        promotion.setProducts(productsSet);

        if (dto.getCategoryIds() != null) {
            promotion.getCategories().clear();
            if (!dto.getCategoryIds().isEmpty()) {
                Set<Category> categories = new HashSet<>(
                        categoryRepository.findAllById(dto.getCategoryIds())
                );
                promotion.setCategories(categories);
            }
        }

        return promotionRepository.save(promotion);
    }

    @Transactional
    public void deletePromotion(Long id) {
        if (!promotionRepository.existsById(id)) {
            throw new RuntimeException("Promocja o ID " + id + " nie została znaleziona");
        }

        entityManager.createNativeQuery("UPDATE orders SET promotion_id = NULL WHERE promotion_id = ?1")
                .setParameter(1, id)
                .executeUpdate();

        entityManager.createNativeQuery("DELETE FROM promotion_products WHERE promotion_id = ?1")
                .setParameter(1, id)
                .executeUpdate();

        entityManager.createNativeQuery("DELETE FROM promotion_categories WHERE promotion_id = ?1")
                .setParameter(1, id)
                .executeUpdate();

        entityManager.flush();

        entityManager.createNativeQuery("DELETE FROM promotions WHERE id = ?1")
                .setParameter(1, id)
                .executeUpdate();
    }

    @Transactional
    public void toggleActive(Long id) {
        Promotion promotion = getPromotionById(id);
        promotion.setActive(!promotion.isActive());
        promotionRepository.save(promotion);
    }

    @Transactional
    public void activatePromotion(Long id) {
        Promotion promotion = getPromotionById(id);
        promotion.setActive(true);
        promotionRepository.save(promotion);
    }

    @Transactional
    public void deactivatePromotion(Long id) {
        Promotion promotion = getPromotionById(id);
        promotion.setActive(false);
        promotionRepository.save(promotion);
    }

    public Page<Promotion> getActivePromotions(Pageable pageable) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findActivePromotionsForDate(now, pageable);
    }

    public Page<Promotion> getUpcomingPromotions(Pageable pageable) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findUpcomingPromotions(now, pageable);
    }

    public Page<Promotion> getExpiredPromotions(Pageable pageable) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findExpiredPromotions(now, pageable);
    }

    public Page<Promotion> getPromotionsByType(PromotionType type, Pageable pageable) {
        return promotionRepository.findByType(type, pageable);
    }

    public Page<Promotion> searchPromotions(String search, Pageable pageable) {
        return promotionRepository.searchPromotions(search, pageable);
    }

    public List<Promotion> getActivePromotionsForProduct(Long productId) {
        LocalDate now = LocalDate.now();
        return promotionRepository.findActivePromotionsForProduct(productId, now);
    }

    public Optional<Promotion> getBestPromotionForProduct(Long productId) {
        LocalDate now = LocalDate.now();
        List<Promotion> promotions = promotionRepository.findBestPromotionForProduct(
                productId, now, PageRequest.of(0, 1)
        );
        return promotions.isEmpty() ? Optional.empty() : Optional.of(promotions.get(0));
    }

    @Transactional
    public void applyPromotionToProducts(Long promotionId, List<Long> productIds) {
        Promotion promotion = getPromotionById(promotionId);
        List<Product> products = productRepository.findAllById(productIds);
        products.forEach(promotion::addProduct);
        promotionRepository.save(promotion);
    }

    @Transactional
    public void removePromotionFromProducts(Long promotionId, List<Long> productIds) {
        Promotion promotion = getPromotionById(promotionId);
        List<Product> products = productRepository.findAllById(productIds);

        products.forEach(promotion::removeProduct);

        promotionRepository.save(promotion);
    }

    public BigDecimal calculateDiscountForProduct(Product product) {
        List<Promotion> promotions = getActivePromotionsForProduct(product.getId());

        if (promotions.isEmpty()) {
            return BigDecimal.ZERO;
        }

        return promotions.stream()
                .map(promo -> promo.calculateDiscount(product.getPrice()))
                .max(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);
    }

    public BigDecimal calculateDiscountedPriceForProduct(Product product) {
        BigDecimal discount = calculateDiscountForProduct(product);
        return product.getPrice().subtract(discount).max(BigDecimal.ZERO);
    }

    public Optional<Promotion> validatePromotionCode(String code, BigDecimal orderAmount) {
        Optional<Promotion> promotionOpt = getPromotionByCode(code);

        if (promotionOpt.isEmpty()) {
            return Optional.empty();
        }

        Promotion promotion = promotionOpt.get();
        if (!promotion.isCurrentlyActive()) {
            return Optional.empty();
        }

        if (!promotion.isApplicableForAmount(orderAmount)) {
            return Optional.empty();
        }
        return Optional.of(promotion);
    }

    @Transactional
    public void incrementPromotionUsage(Long promotionId) {
        Promotion promotion = getPromotionById(promotionId);
        promotion.incrementUsage();
        promotionRepository.save(promotion);
    }

    @Transactional
    public void decrementPromotionUsage(Long promotionId) {
        Promotion promotion = getPromotionById(promotionId);
        if (promotion.getCurrentUsage() > 0) {
            promotion.setCurrentUsage(promotion.getCurrentUsage() - 1);
            promotionRepository.save(promotion);
        }
    }

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

        BigDecimal totalDiscount = promotion.getOrders().stream()
                .map(Order::getDiscountAmount)
                .filter(Objects::nonNull)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        stats.put("totalDiscountAmount", totalDiscount);

        return stats;
    }

    public long getActivePromotionsCount() {
        return promotionRepository.countActivePromotions(LocalDate.now());
    }

    public long getUpcomingPromotionsCount() {
        return promotionRepository.countUpcomingPromotions(LocalDate.now());
    }

    public long getTotalUsageCount() {
        return promotionRepository.sumTotalUsage();
    }

    public List<Promotion> getPromotionsEndingSoon(int days) {
        LocalDate now = LocalDate.now();
        LocalDate futureDate = now.plusDays(days);
        return promotionRepository.findPromotionsEndingSoon(now, futureDate);
    }

    @Transactional
    public Promotion duplicatePromotion(Long id) {
        Promotion original = getPromotionById(id);

        Promotion duplicate = Promotion.builder()
                .name(original.getName() + " (kopia)")
                .description(original.getDescription())
                .type(original.getType())
                .discountPercentage(original.getDiscountPercentage())
                .discountAmount(original.getDiscountAmount())
                .startDate(LocalDate.now())
                .endDate(original.getEndDate())
                .active(false)
                .code(null)
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

        duplicate.setProducts(new HashSet<>(original.getProducts()));

        duplicate.setCategories(new HashSet<>(original.getCategories()));

        Promotion saved = promotionRepository.save(duplicate);
        return saved;
    }

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

    private void validatePromotionDTO(PromotionDTO dto) {
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
                break;

            default:
                break;
        }

        if (dto.getEndDate() != null && dto.getStartDate().isAfter(dto.getEndDate())) {
            throw new RuntimeException("Data zakończenia musi być późniejsza niż data rozpoczęcia");
        }
    }

    public String exportToCSV() {
        log.info("Eksportowanie promocji do CSV");
        return "promotions_" + System.currentTimeMillis() + ".csv";
    }
}