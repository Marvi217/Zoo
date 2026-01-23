package com.example.zoo.service;

import com.example.zoo.dto.CategoryDTO;
import com.example.zoo.entity.Category;
import com.example.zoo.repository.CategoryRepository;
import com.example.zoo.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class CategoryService {

    private final CategoryRepository categoryRepository;
    private final FileStorageService fileStorageService;
    private final ProductRepository productRepository;

    public Optional<Category> findById(Long id) {
        return categoryRepository.findById(id);
    }

    public List<Category> getTopCategories(int limit) {
        // PageRequest.of(0, limit) pozwala ograniczyć wynik do podanej liczby
        return categoryRepository.findTopCategoriesByProductCount(PageRequest.of(0, limit));
    }

    // ==================== METODY ISTNIEJĄCE (zachowane) ====================

    public double calculateCategoryPercentage(Category category) {
        long totalProducts = productRepository.count();
        if (totalProducts == 0) return 0.0;
        long categoryProducts = productRepository.countByCategory(category);
        return Math.round((double) categoryProducts / totalProducts * 100);
    }

    /**
     * Pobierz wszystkie kategorie
     */
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    /**
     * Pobierz kategorię po slug
     */
    public Category getCategoryBySlug(String slug) {
        return categoryRepository.findBySlug(slug)
                .orElseThrow(() -> new RuntimeException("Category not found: " + slug));
    }

    /**
     * Pobierz kategorię po ID
     */
    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Category not found with ID: " + id));
    }

    // ==================== NOWE METODY DLA PANELU ADMIN ====================

    /**
     * Pobierz wszystkie kategorie z paginacją
     */
    public Page<Category> getAllCategories(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }

    /**
     * Pobierz wszystkie aktywne kategorie
     */
    public List<Category> getAllActiveCategories() {
        return categoryRepository.findByActiveTrue();
    }

    /**
     * Utwórz nową kategorię
     */
    @Transactional
    public Category createCategory(CategoryDTO dto, MultipartFile imageFile) throws IOException {
        log.info("Tworzenie nowej kategorii: {}", dto.getName());

        // Sprawdź czy nazwa jest unikalna
        if (categoryRepository.existsByName(dto.getName())) {
            throw new RuntimeException("Kategoria o nazwie '" + dto.getName() + "' już istnieje");
        }

        // Sprawdź czy slug jest unikalny
        if (categoryRepository.existsBySlug(dto.getSlug())) {
            throw new RuntimeException("Kategoria o slug '" + dto.getSlug() + "' już istnieje");
        }

        Category category = new Category();
        category.setName(dto.getName());
        category.setSlug(dto.getSlug());  // ← DODAJ TO
        category.setIcon(dto.getIcon());  // ← DODAJ TO
        category.setDescription(dto.getDescription());
        category.setActive(dto.isActive());

        // Obsługa obrazka
        if (imageFile != null && !imageFile.isEmpty()) {
            String imageUrl = fileStorageService.storeFile(imageFile, "categories");
            category.setImageUrl(imageUrl);
        }

        Category saved = categoryRepository.save(category);
        log.info("Utworzono kategorię o ID: {}", saved.getId());

        return saved;
    }

    /**
     * Aktualizuj kategorię
     */
    @Transactional
    public Category updateCategory(Long id, CategoryDTO dto) {
        log.info("Aktualizacja kategorii o ID: {}", id);

        Category category = getCategoryById(id);

        // Sprawdź unikalność nazwy (z wyłączeniem aktualnej kategorii)
        if (!category.getName().equals(dto.getName())) {
            if (categoryRepository.existsByName(dto.getName())) {
                throw new RuntimeException("Kategoria o nazwie '" + dto.getName() + "' już istnieje");
            }
        }

        category.setName(dto.getName());
        category.setDescription(dto.getDescription());
        category.setActive(dto.isActive());

        Category updated = categoryRepository.save(category);
        log.info("Zaktualizowano kategorię o ID: {}", id);

        return updated;
    }

    /**
     * Aktualizuj kategorię z obrazem
     */
    @Transactional
    public Category updateCategory(Long id, CategoryDTO dto, MultipartFile imageFile) throws IOException {
        if (fileStorageService == null) {
            throw new RuntimeException("FileStorageService nie został zainicjalizowany");
        }

        log.info("Aktualizacja kategorii o ID: {}", id);

        Category category = getCategoryById(id);

        if (!category.getName().equals(dto.getName())) {
            if (categoryRepository.existsByName(dto.getName())) {
                throw new RuntimeException("Kategoria o nazwie '" + dto.getName() + "' już istnieje");
            }
        }

        category.setName(dto.getName());
        category.setDescription(dto.getDescription());
        category.setActive(dto.isActive());

        // Upload nowego obrazu jeśli został podany
        if (imageFile != null && !imageFile.isEmpty()) {
            // Usuń stary obraz
            if (category.getImageUrl() != null) {
                try {
                    fileStorageService.deleteFile(category.getImageUrl());
                } catch (Exception e) {
                    log.warn("Nie udało się usunąć starego obrazu: {}", category.getImageUrl(), e);
                }
            }

            String imageUrl = fileStorageService.storeFile(imageFile, "categories");
            category.setImageUrl(imageUrl);
        }

        Category updated = categoryRepository.save(category);
        log.info("Zaktualizowano kategorię o ID: {}", id);

        return updated;
    }

    /**
     * Usuń kategorię
     */
    @Transactional
    public void deleteCategory(Long id) {
        log.info("Usuwanie kategorii o ID: {}", id);

        Category category = getCategoryById(id);

        // Sprawdź czy kategoria nie zawiera subkategorii
        if (categoryRepository.hasSubcategories(id)) {
            throw new RuntimeException(
                    "Nie można usunąć kategorii, która zawiera subkategorie. " +
                            "Najpierw usuń wszystkie subkategorie z tej kategorii."
            );
        }

        // Usuń obraz jeśli istnieje i fileStorageService jest dostępny
        if (fileStorageService != null && category.getImageUrl() != null) {
            try {
                fileStorageService.deleteFile(category.getImageUrl());
            } catch (Exception e) {
                log.warn("Nie udało się usunąć obrazu: {}", category.getImageUrl(), e);
            }
        }

        categoryRepository.delete(category);
        log.info("Usunięto kategorię o ID: {}", id);
    }

    // ==================== WYSZUKIWANIE ====================

    /**
     * Wyszukaj kategorie
     */
    public Page<Category> searchCategories(String query, Pageable pageable) {
        return categoryRepository.searchCategories(query, pageable);
    }

    // ==================== ZARZĄDZANIE STATUSEM ====================

    /**
     * Aktywuj/dezaktywuj kategorię
     */
    @Transactional
    public void toggleActive(Long id) {
        Category category = getCategoryById(id);
        category.setActive(!category.isActive());
        categoryRepository.save(category);
        log.info("Zmieniono status kategorii {} na: {}", id, category.isActive());
    }

    /**
     * Aktywuj kategorię
     */
    @Transactional
    public void activateCategory(Long id) {
        Category category = getCategoryById(id);
        category.setActive(true);
        categoryRepository.save(category);
        log.info("Aktywowano kategorię o ID: {}", id);
    }

    /**
     * Dezaktywuj kategorię
     */
    @Transactional
    public void deactivateCategory(Long id) {
        Category category = getCategoryById(id);
        category.setActive(false);
        categoryRepository.save(category);
        log.info("Dezaktywowano kategorię o ID: {}", id);
    }

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz wszystkie kategorie
     */
    public long getTotalCategoriesCount() {
        return categoryRepository.count();
    }

    /**
     * Zlicz aktywne kategorie
     */
    public long getActiveCategoriesCount() {
        return categoryRepository.countByActiveTrue();
    }

    /**
     * Pobierz kategorie z liczbą produktów
     */
    public List<Object[]> getCategoriesWithProductCount() {
        return categoryRepository.findCategoriesWithProductCount();
    }

    // ==================== EKSPORT ====================

    /**
     * Eksportuj kategorie do CSV
     */
    public String exportToCSV() {
        log.info("Eksportowanie kategorii do CSV");
        // TODO: Implementacja eksportu
        return "categories_export_" + System.currentTimeMillis() + ".csv";
    }
}