package com.example.zoo.service;

import com.example.zoo.dto.SubcategoryDTO;
import com.example.zoo.entity.Category;
import com.example.zoo.entity.Subcategory;
import com.example.zoo.repository.CategoryRepository;
import com.example.zoo.repository.SubcategoryRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class SubcategoryService {

    private final SubcategoryRepository subcategoryRepository;
    private final CategoryRepository categoryRepository;
    private final FileStorageService fileStorageService;

    public Optional<Subcategory> findById(Long id) {
        return subcategoryRepository.findById(id);
    }

    // ==================== CRUD OPERATIONS ====================

    /**
     * Pobierz wszystkie subkategorie z paginacją
     */
    public Page<Subcategory> getAllSubcategories(Pageable pageable) {
        log.debug("Pobieranie wszystkich subkategorii, strona: {}", pageable.getPageNumber());
        return subcategoryRepository.findAll(pageable);
    }

    /**
     * Pobierz wszystkie aktywne subkategorie
     */
    public List<Subcategory> getAllActiveSubcategories() {
        log.debug("Pobieranie wszystkich aktywnych subkategorii");
        return subcategoryRepository.findByActiveTrue();
    }

    /**
     * Pobierz subkategorię po ID
     */
    public Subcategory getSubcategoryById(Long id) {
        log.debug("Pobieranie subkategorii o ID: {}", id);
        return subcategoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Subkategoria o ID " + id + " nie została znaleziona"));
    }

    /**
     * Pobierz subkategorie według kategorii
     */
    public Page<Subcategory> getSubcategoriesByCategory(Long categoryId, Pageable pageable) {
        log.debug("Pobieranie subkategorii dla kategorii: {}", categoryId);
        return subcategoryRepository.findByCategoryId(categoryId, pageable);
    }

    /**
     * Pobierz aktywne subkategorie według kategorii
     */
    public List<Subcategory> getActiveSubcategoriesByCategory(Long categoryId) {
        log.debug("Pobieranie aktywnych subkategorii dla kategorii: {}", categoryId);
        return subcategoryRepository.findByCategoryIdAndActiveTrue(categoryId);
    }

    /**
     * Utwórz nową subkategorię
     */
    @Transactional
    public Subcategory createSubcategory(SubcategoryDTO dto, MultipartFile imageFile) throws IOException {
        log.info("Tworzenie nowej subkategorii: {}", dto.getName());

        // Walidacja
        validateSubcategoryDTO(dto);

        // Sprawdź czy kategoria istnieje
        Category category = categoryRepository.findById(dto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Kategoria nie znaleziona"));

        // Sprawdź czy nazwa jest unikalna w ramach kategorii
        if (subcategoryRepository.existsByNameAndCategoryId(dto.getName(), dto.getCategoryId())) {
            throw new RuntimeException("Subkategoria o nazwie '" + dto.getName() +
                    "' już istnieje w tej kategorii");
        }

        Subcategory subcategory = new Subcategory();
        subcategory.setName(dto.getName());
        subcategory.setDescription(dto.getDescription());
        subcategory.setCategory(category);
        subcategory.setActive(dto.isActive());

        // Upload obrazu jeśli został podany
        if (imageFile != null && !imageFile.isEmpty()) {
            String imageUrl = fileStorageService.storeFile(imageFile, "categories");
            subcategory.setImageUrl(imageUrl);
        }

        Subcategory saved = subcategoryRepository.save(subcategory);
        log.info("Utworzono subkategorię o ID: {}", saved.getId());

        return saved;
    }

    /**
     * Aktualizuj subkategorię
     */
    @Transactional
    public Subcategory updateSubcategory(Long id, SubcategoryDTO dto, MultipartFile imageFile) throws IOException {
        log.info("Aktualizacja subkategorii o ID: {}", id);

        Subcategory subcategory = getSubcategoryById(id);
        validateSubcategoryDTO(dto);

        // Sprawdź czy kategoria istnieje
        Category category = categoryRepository.findById(dto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Kategoria nie znaleziona"));

        // Sprawdź unikalność nazwy (z wyłączeniem aktualnej subkategorii)
        if (!subcategory.getName().equals(dto.getName())) {
            if (subcategoryRepository.existsByNameAndCategoryId(dto.getName(), dto.getCategoryId())) {
                throw new RuntimeException("Subkategoria o nazwie '" + dto.getName() +
                        "' już istnieje w tej kategorii");
            }
        }

        // Aktualizuj pola
        subcategory.setName(dto.getName());
        subcategory.setDescription(dto.getDescription());
        subcategory.setCategory(category);
        subcategory.setActive(dto.isActive());

        // Upload nowego obrazu jeśli został podany
        if (imageFile != null && !imageFile.isEmpty()) {
            // Usuń stary obraz
            if (subcategory.getImageUrl() != null) {
                try {
                    fileStorageService.deleteFile(subcategory.getImageUrl());
                } catch (Exception e) {
                    log.warn("Nie udało się usunąć starego obrazu: {}", subcategory.getImageUrl(), e);
                }
            }

            String imageUrl = fileStorageService.storeFile(imageFile, "categories");
            subcategory.setImageUrl(imageUrl);
        }

        Subcategory updated = subcategoryRepository.save(subcategory);
        log.info("Zaktualizowano subkategorię o ID: {}", id);

        return updated;
    }

    /**
     * Usuń subkategorię
     */
    @Transactional
    public void deleteSubcategory(Long id) {
        log.info("Usuwanie subkategorii o ID: {}", id);

        Subcategory subcategory = getSubcategoryById(id);

        // Sprawdź czy subkategoria nie zawiera produktów
        if (subcategoryRepository.hasProducts(id)) {
            throw new RuntimeException(
                    "Nie można usunąć subkategorii, która zawiera produkty. " +
                            "Najpierw przenieś lub usuń wszystkie produkty z tej subkategorii."
            );
        }

        // Usuń obraz jeśli istnieje
        if (subcategory.getImageUrl() != null) {
            try {
                fileStorageService.deleteFile(subcategory.getImageUrl());
            } catch (Exception e) {
                log.warn("Nie udało się usunąć obrazu: {}", subcategory.getImageUrl(), e);
            }
        }

        subcategoryRepository.delete(subcategory);
        log.info("Usunięto subkategorię o ID: {}", id);
    }

    // ==================== WYSZUKIWANIE ====================

    /**
     * Wyszukaj subkategorie
     */
    public Page<Subcategory> searchSubcategories(String query, Pageable pageable) {
        log.debug("Wyszukiwanie subkategorii: {}", query);
        return subcategoryRepository.searchSubcategories(query, pageable);
    }

    /**
     * Wyszukaj subkategorie w kategorii
     */
    public Page<Subcategory> searchSubcategoriesInCategory(Long categoryId, String query, Pageable pageable) {
        log.debug("Wyszukiwanie subkategorii w kategorii {}: {}", categoryId, query);
        return subcategoryRepository.searchSubcategoriesInCategory(categoryId, query, pageable);
    }

    // ==================== ZARZĄDZANIE STATUSEM ====================

    /**
     * Aktywuj/dezaktywuj subkategorię
     */
    // W SubcategoryService.java

    @Transactional
    public void toggleActive(Long id) {
        log.info("Przełączanie statusu aktywności dla subkategorii ID: {}", id);

        Subcategory subcategory = subcategoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Subkategoria o ID " + id + " nie została znaleziona"));

        // Przełącz status
        subcategory.setActive(!subcategory.isActive());

        subcategoryRepository.save(subcategory);

        log.info("Status subkategorii ID {} zmieniony na: {}", id, subcategory.isActive());
    }

    /**
     * Aktywuj subkategorię
     */
    @Transactional
    public void activateSubcategory(Long id) {
        Subcategory subcategory = getSubcategoryById(id);
        subcategory.setActive(true);
        subcategoryRepository.save(subcategory);
        log.info("Aktywowano subkategorię o ID: {}", id);
    }

    /**
     * Dezaktywuj subkategorię
     */
    @Transactional
    public void deactivateSubcategory(Long id) {
        Subcategory subcategory = getSubcategoryById(id);
        subcategory.setActive(false);
        subcategoryRepository.save(subcategory);
        log.info("Dezaktywowano subkategorię o ID: {}", id);
    }

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz wszystkie subkategorie
     */
    public long getTotalSubcategoriesCount() {
        return subcategoryRepository.count();
    }

    /**
     * Zlicz aktywne subkategorie
     */
    public long getActiveSubcategoriesCount() {
        return subcategoryRepository.countByActiveTrue();
    }

    /**
     * Zlicz subkategorie w kategorii
     */
    public long getSubcategoriesCountInCategory(Long categoryId) {
        return subcategoryRepository.countByCategoryId(categoryId);
    }

    /**
     * Zlicz aktywne subkategorie w kategorii
     */
    public long getActiveSubcategoriesCountInCategory(Long categoryId) {
        return subcategoryRepository.countByCategoryIdAndActiveTrue(categoryId);
    }

    /**
     * Pobierz subkategorie z liczbą produktów
     */
    public List<Object[]> getSubcategoriesWithProductCount(Long categoryId) {
        return subcategoryRepository.findSubcategoriesWithProductCount(categoryId);
    }

    // ==================== PRZENOSZENIE ====================

    /**
     * Przenieś subkategorię do innej kategorii
     */
    @Transactional
    public void moveToCategory(Long subcategoryId, Long newCategoryId) {
        log.info("Przenoszenie subkategorii {} do kategorii {}", subcategoryId, newCategoryId);

        Subcategory subcategory = getSubcategoryById(subcategoryId);
        Category newCategory = categoryRepository.findById(newCategoryId)
                .orElseThrow(() -> new RuntimeException("Kategoria nie znaleziona"));

        // Sprawdź czy nazwa nie koliduje w nowej kategorii
        if (subcategoryRepository.existsByNameAndCategoryId(subcategory.getName(), newCategoryId)) {
            throw new RuntimeException(
                    "Subkategoria o nazwie '" + subcategory.getName() +
                            "' już istnieje w docelowej kategorii"
            );
        }

        subcategory.setCategory(newCategory);
        subcategoryRepository.save(subcategory);

        log.info("Przeniesiono subkategorię {} do kategorii {}", subcategoryId, newCategoryId);
    }

    /**
     * Przenieś wszystkie produkty do innej subkategorii
     */
    @Transactional
    public void moveAllProductsToSubcategory(Long fromSubcategoryId, Long toSubcategoryId) {
        log.info("Przenoszenie produktów z subkategorii {} do {}", fromSubcategoryId, toSubcategoryId);

        Subcategory fromSubcategory = getSubcategoryById(fromSubcategoryId);
        Subcategory toSubcategory = getSubcategoryById(toSubcategoryId);

        // Sprawdź czy należą do tej samej kategorii
        if (!fromSubcategory.getCategory().getId().equals(toSubcategory.getCategory().getId())) {
            throw new RuntimeException("Subkategorie muszą należeć do tej samej kategorii");
        }

        subcategoryRepository.moveAllProducts(fromSubcategoryId, toSubcategoryId);

        log.info("Przeniesiono produkty z subkategorii {} do {}", fromSubcategoryId, toSubcategoryId);
    }

    // ==================== WALIDACJA ====================

    /**
     * Waliduj DTO subkategorii
     */
    private void validateSubcategoryDTO(SubcategoryDTO dto) {
        if (dto.getName() == null || dto.getName().trim().isEmpty()) {
            throw new RuntimeException("Nazwa subkategorii jest wymagana");
        }

        if (dto.getName().length() < 2 || dto.getName().length() > 100) {
            throw new RuntimeException("Nazwa subkategorii musi mieć od 2 do 100 znaków");
        }

        if (dto.getCategoryId() == null) {
            throw new RuntimeException("Kategoria nadrzędna jest wymagana");
        }
    }

    // ==================== SORTOWANIE ====================

    /**
     * Zmień kolejność wyświetlania
     */
    @Transactional
    public void updateDisplayOrder(Long id, Integer newOrder) {
        Subcategory subcategory = getSubcategoryById(id);
        subcategory.setDisplayOrder(newOrder);
        subcategoryRepository.save(subcategory);
        log.info("Zaktualizowano kolejność wyświetlania subkategorii {}: {}", id, newOrder);
    }

    /**
     * Pobierz subkategorie posortowane według kolejności wyświetlania
     */
    public List<Subcategory> getSubcategoriesByDisplayOrder(Long categoryId) {
        return subcategoryRepository.findByCategoryIdOrderByDisplayOrderAsc(categoryId);
    }

    // ==================== EKSPORT ====================

    /**
     * Eksportuj subkategorie do CSV
     */
    public String exportToCSV(Long categoryId) {
        log.info("Eksportowanie subkategorii do CSV");

        // TODO: Implementacja eksportu CSV

        return "subcategories_export_" + System.currentTimeMillis() + ".csv";
    }
}