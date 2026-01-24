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
public class SubcategoryService {

    private final SubcategoryRepository subcategoryRepository;
    private final CategoryRepository categoryRepository;
    private final FileStorageService fileStorageService;

    public Optional<Subcategory> findById(Long id) {
        return subcategoryRepository.findById(id);
    }
    public Page<Subcategory> getAllSubcategories(Pageable pageable) {
        return subcategoryRepository.findAll(pageable);
    }

    public List<Subcategory> getAllActiveSubcategories() {
        return subcategoryRepository.findByActiveTrue();
    }

    public Subcategory getSubcategoryById(Long id) {
        return subcategoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Subkategoria o ID " + id + " nie została znaleziona"));
    }

    public Page<Subcategory> getSubcategoriesByCategory(Long categoryId, Pageable pageable) {
        return subcategoryRepository.findByCategoryId(categoryId, pageable);
    }

    public List<Subcategory> getActiveSubcategoriesByCategory(Long categoryId) {
        return subcategoryRepository.findByCategoryIdAndActiveTrue(categoryId);
    }

    @Transactional
    public Subcategory createSubcategory(SubcategoryDTO dto, MultipartFile imageFile) throws IOException {

        validateSubcategoryDTO(dto);

        Category category = categoryRepository.findById(dto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Kategoria nie znaleziona"));

        if (subcategoryRepository.existsByNameAndCategoryId(dto.getName(), dto.getCategoryId())) {
            throw new RuntimeException("Subkategoria o nazwie '" + dto.getName() +
                    "' już istnieje w tej kategorii");
        }

        Subcategory subcategory = new Subcategory();
        subcategory.setName(dto.getName());
        subcategory.setDescription(dto.getDescription());
        subcategory.setCategory(category);
        subcategory.setActive(dto.isActive());

        if (imageFile != null && !imageFile.isEmpty()) {
            String imageUrl = fileStorageService.storeFile(imageFile, "categories");
            subcategory.setImageUrl(imageUrl);
        }

        Subcategory saved = subcategoryRepository.save(subcategory);
        return saved;
    }

    @Transactional
    public Subcategory updateSubcategory(Long id, SubcategoryDTO dto, MultipartFile imageFile) throws IOException {

        Subcategory subcategory = getSubcategoryById(id);
        validateSubcategoryDTO(dto);

        Category category = categoryRepository.findById(dto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Kategoria nie znaleziona"));

        if (!subcategory.getName().equals(dto.getName())) {
            if (subcategoryRepository.existsByNameAndCategoryId(dto.getName(), dto.getCategoryId())) {
                throw new RuntimeException("Subkategoria o nazwie '" + dto.getName() +
                        "' już istnieje w tej kategorii");
            }
        }

        subcategory.setName(dto.getName());
        subcategory.setDescription(dto.getDescription());
        subcategory.setCategory(category);
        subcategory.setActive(dto.isActive());

        if (imageFile != null && !imageFile.isEmpty()) {
            if (subcategory.getImageUrl() != null) {
                try {
                    fileStorageService.deleteFile(subcategory.getImageUrl());
                } catch (Exception ignored) {
                }
            }

            String imageUrl = fileStorageService.storeFile(imageFile, "categories");
            subcategory.setImageUrl(imageUrl);
        }

        Subcategory updated = subcategoryRepository.save(subcategory);
        return updated;
    }

    @Transactional
    public void deleteSubcategory(Long id) {
        Subcategory subcategory = getSubcategoryById(id);

        if (subcategoryRepository.hasProducts(id)) {
            throw new RuntimeException(
                    "Nie można usunąć subkategorii, która zawiera produkty. " +
                            "Najpierw przenieś lub usuń wszystkie produkty z tej subkategorii."
            );
        }

        if (subcategory.getImageUrl() != null) {
            try {
                fileStorageService.deleteFile(subcategory.getImageUrl());
            } catch (Exception ignored) {
            }
        }

        subcategoryRepository.delete(subcategory);
    }

    public Page<Subcategory> searchSubcategories(String query, Pageable pageable) {
        return subcategoryRepository.searchSubcategories(query, pageable);
    }

    public Page<Subcategory> searchSubcategoriesInCategory(Long categoryId, String query, Pageable pageable) {
        return subcategoryRepository.searchSubcategoriesInCategory(categoryId, query, pageable);
    }

    @Transactional
    public void toggleActive(Long id) {
        Subcategory subcategory = subcategoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Subkategoria o ID " + id + " nie została znaleziona"));
        subcategory.setActive(!subcategory.isActive());

        subcategoryRepository.save(subcategory);

    }

    @Transactional
    public void activateSubcategory(Long id) {
        Subcategory subcategory = getSubcategoryById(id);
        subcategory.setActive(true);
        subcategoryRepository.save(subcategory);
    }

    @Transactional
    public void deactivateSubcategory(Long id) {
        Subcategory subcategory = getSubcategoryById(id);
        subcategory.setActive(false);
        subcategoryRepository.save(subcategory);
    }

    public long getTotalSubcategoriesCount() {
        return subcategoryRepository.count();
    }

    public long getActiveSubcategoriesCount() {
        return subcategoryRepository.countByActiveTrue();
    }

    public long getSubcategoriesCountInCategory(Long categoryId) {
        return subcategoryRepository.countByCategoryId(categoryId);
    }

    public long getActiveSubcategoriesCountInCategory(Long categoryId) {
        return subcategoryRepository.countByCategoryIdAndActiveTrue(categoryId);
    }

    public List<Object[]> getSubcategoriesWithProductCount(Long categoryId) {
        return subcategoryRepository.findSubcategoriesWithProductCount(categoryId);
    }

    @Transactional
    public void moveToCategory(Long subcategoryId, Long newCategoryId) {
        Subcategory subcategory = getSubcategoryById(subcategoryId);
        Category newCategory = categoryRepository.findById(newCategoryId)
                .orElseThrow(() -> new RuntimeException("Kategoria nie znaleziona"));

        if (subcategoryRepository.existsByNameAndCategoryId(subcategory.getName(), newCategoryId)) {
            throw new RuntimeException(
                    "Subkategoria o nazwie '" + subcategory.getName() +
                            "' już istnieje w docelowej kategorii"
            );
        }

        subcategory.setCategory(newCategory);
        subcategoryRepository.save(subcategory);
    }

    @Transactional
    public void moveAllProductsToSubcategory(Long fromSubcategoryId, Long toSubcategoryId) {
        Subcategory fromSubcategory = getSubcategoryById(fromSubcategoryId);
        Subcategory toSubcategory = getSubcategoryById(toSubcategoryId);

        if (!fromSubcategory.getCategory().getId().equals(toSubcategory.getCategory().getId())) {
            throw new RuntimeException("Subkategorie muszą należeć do tej samej kategorii");
        }

        subcategoryRepository.moveAllProducts(fromSubcategoryId, toSubcategoryId);
    }

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

    @Transactional
    public void updateDisplayOrder(Long id, Integer newOrder) {
        Subcategory subcategory = getSubcategoryById(id);
        subcategory.setDisplayOrder(newOrder);
        subcategoryRepository.save(subcategory);
    }

    public List<Subcategory> getSubcategoriesByDisplayOrder(Long categoryId) {
        return subcategoryRepository.findByCategoryIdOrderByDisplayOrderAsc(categoryId);
    }

    public String exportToCSV(Long categoryId) {
        return "subcategories_export_" + System.currentTimeMillis() + ".csv";
    }
}