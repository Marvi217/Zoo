package com.example.zoo.service;

import com.example.zoo.dto.BrandDTO;
import com.example.zoo.entity.Brand;
import com.example.zoo.repository.BrandRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class BrandService {

    private final BrandRepository brandRepository;
    private final FileStorageService fileStorageService;

    public Optional<Brand> findById(Long id) {
        return brandRepository.findById(id);
    }

    // ==================== METODY Z INTERFEJSU (zachowane) ====================

    /**
     * Pobierz wszystkie marki
     */
    public List<Brand> getAllBrands() {
        return brandRepository.findAll();
    }

    /**
     * Pobierz markę po slug
     */
    public Optional<Brand> getBrandBySlug(String slug) {
        return brandRepository.findBySlug(slug);
    }

    // ==================== NOWE METODY DLA PANELU ADMIN ====================

    /**
     * Pobierz wszystkie marki z paginacją
     */
    public Page<Brand> getAllBrands(Pageable pageable) {
        return brandRepository.findAll(pageable);
    }

    /**
     * Pobierz wszystkie aktywne marki
     */
    public List<Brand> getAllActiveBrands() {
        return brandRepository.findByActiveTrue();
    }

    /**
     * Pobierz markę po ID
     */
    public Brand getBrandById(Long id) {
        return brandRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Marka o ID " + id + " nie została znaleziona"));
    }

    /**
     * Pobierz markę po nazwie
     */
    public Optional<Brand> getBrandByName(String name) {
        return brandRepository.findByName(name);
    }

    /**
     * Utwórz nową markę
     */
    @Transactional
    public Brand createBrand(BrandDTO dto) {
        log.info("Tworzenie nowej marki: {}", dto.getName());

        // Sprawdź czy nazwa jest unikalna
        if (brandRepository.existsByName(dto.getName())) {
            throw new RuntimeException("Marka o nazwie '" + dto.getName() + "' już istnieje");
        }

        Brand brand = new Brand();
        brand.setName(dto.getName());
        brand.setDescription(dto.getDescription());
        brand.setActive(dto.isActive());
        brand.setWebsite(dto.getWebsite());
        brand.setCountry(dto.getCountry());

        Brand saved = brandRepository.save(brand);
        log.info("Utworzono markę o ID: {}", saved.getId());

        return saved;
    }

    /**
     * Utwórz nową markę z logo
     */
    @Transactional
    public Brand createBrand(BrandDTO dto, MultipartFile logoFile) throws IOException {
        if (fileStorageService == null) {
            throw new RuntimeException("FileStorageService nie został zainicjalizowany");
        }

        log.info("Tworzenie nowej marki: {}", dto.getName());

        // Sprawdź czy nazwa jest unikalna
        if (brandRepository.existsByName(dto.getName())) {
            throw new RuntimeException("Marka o nazwie '" + dto.getName() + "' już istnieje");
        }

        Brand brand = new Brand();
        brand.setName(dto.getName());
        brand.setDescription(dto.getDescription());
        brand.setActive(dto.isActive());
        brand.setWebsite(dto.getWebsite());
        brand.setCountry(dto.getCountry());

        // Upload logo jeśli zostało podane
        if (logoFile != null && !logoFile.isEmpty()) {
            String logoUrl = fileStorageService.storeFile(logoFile, "brands");
            brand.setLogoUrl(logoUrl);
        }

        Brand saved = brandRepository.save(brand);
        log.info("Utworzono markę o ID: {}", saved.getId());

        return saved;
    }

    /**
     * Aktualizuj markę
     */
    @Transactional
    public Brand updateBrand(Long id, BrandDTO dto) {
        log.info("Aktualizacja marki o ID: {}", id);

        Brand brand = getBrandById(id);

        // Sprawdź unikalność nazwy (z wyłączeniem aktualnej marki)
        if (!brand.getName().equals(dto.getName())) {
            if (brandRepository.existsByName(dto.getName())) {
                throw new RuntimeException("Marka o nazwie '" + dto.getName() + "' już istnieje");
            }
        }

        brand.setName(dto.getName());
        brand.setDescription(dto.getDescription());
        brand.setActive(dto.isActive());
        brand.setWebsite(dto.getWebsite());
        brand.setCountry(dto.getCountry());

        Brand updated = brandRepository.save(brand);
        log.info("Zaktualizowano markę o ID: {}", id);

        return updated;
    }

    /**
     * Aktualizuj markę z logo
     */
    @Transactional
    public Brand updateBrand(Long id, BrandDTO dto, MultipartFile logoFile) throws IOException {
        if (fileStorageService == null) {
            throw new RuntimeException("FileStorageService nie został zainicjalizowany");
        }

        log.info("Aktualizacja marki o ID: {}", id);

        Brand brand = getBrandById(id);

        // Sprawdź unikalność nazwy (z wyłączeniem aktualnej marki)
        if (!brand.getName().equals(dto.getName())) {
            if (brandRepository.existsByName(dto.getName())) {
                throw new RuntimeException("Marka o nazwie '" + dto.getName() + "' już istnieje");
            }
        }

        brand.setName(dto.getName());
        brand.setDescription(dto.getDescription());
        brand.setActive(dto.isActive());
        brand.setWebsite(dto.getWebsite());
        brand.setCountry(dto.getCountry());

        // Upload nowego logo jeśli zostało podane
        if (logoFile != null && !logoFile.isEmpty()) {
            // Usuń stare logo
            if (brand.getLogoUrl() != null) {
                try {
                    fileStorageService.deleteFile(brand.getLogoUrl());
                } catch (Exception e) {
                    log.warn("Nie udało się usunąć starego logo: {}", brand.getLogoUrl(), e);
                }
            }

            String logoUrl = fileStorageService.storeFile(logoFile, "brands");
            brand.setLogoUrl(logoUrl);
        }

        Brand updated = brandRepository.save(brand);
        log.info("Zaktualizowano markę o ID: {}", id);

        return updated;
    }

    /**
     * Usuń markę
     */
    @Transactional
    public void deleteBrand(Long id) {
        log.info("Usuwanie marki o ID: {}", id);

        Brand brand = getBrandById(id);

        // Sprawdź czy marka nie zawiera produktów
        if (brandRepository.hasProducts(id)) {
            throw new RuntimeException(
                    "Nie można usunąć marki, która zawiera produkty. " +
                            "Najpierw usuń lub przenieś wszystkie produkty tej marki."
            );
        }

        // Usuń logo jeśli istnieje i fileStorageService jest dostępny
        if (fileStorageService != null && brand.getLogoUrl() != null) {
            try {
                fileStorageService.deleteFile(brand.getLogoUrl());
            } catch (Exception e) {
                log.warn("Nie udało się usunąć logo: {}", brand.getLogoUrl(), e);
            }
        }

        brandRepository.delete(brand);
        log.info("Usunięto markę o ID: {}", id);
    }

    // ==================== WYSZUKIWANIE ====================

    /**
     * Wyszukaj marki
     */
    public Page<Brand> searchBrands(String query, Pageable pageable) {
        return brandRepository.searchBrands(query, pageable);
    }

    // ==================== ZARZĄDZANIE STATUSEM ====================

    /**
     * Aktywuj/dezaktywuj markę
     */
    @Transactional
    public void toggleActive(Long id) {
        Brand brand = getBrandById(id);
        brand.setActive(!brand.isActive());
        brandRepository.save(brand);
        log.info("Zmieniono status marki {} na: {}", id, brand.isActive());
    }

    /**
     * Aktywuj markę
     */
    @Transactional
    public void activateBrand(Long id) {
        Brand brand = getBrandById(id);
        brand.setActive(true);
        brandRepository.save(brand);
        log.info("Aktywowano markę o ID: {}", id);
    }

    /**
     * Dezaktywuj markę
     */
    @Transactional
    public void deactivateBrand(Long id) {
        Brand brand = getBrandById(id);
        brand.setActive(false);
        brandRepository.save(brand);
        log.info("Dezaktywowano markę o ID: {}", id);
    }

    // ==================== STATYSTYKI ====================

    /**
     * Zlicz wszystkie marki
     */
    public long getTotalBrandsCount() {
        return brandRepository.count();
    }

    /**
     * Zlicz aktywne marki
     */
    public long getActiveBrandsCount() {
        return brandRepository.countByActiveTrue();
    }

    /**
     * Pobierz marki z liczbą produktów
     */
    public List<Object[]> getBrandsWithProductCount() {
        return brandRepository.findBrandsWithProductCount();
    }

    /**
     * Pobierz najpopularniejsze marki (według liczby produktów)
     */
    public List<Brand> getMostPopularBrands(int limit) {
        return brandRepository.findMostPopularBrands(limit);
    }

    // ==================== FILTROWANIE ====================

    /**
     * Filtruj marki według kraju
     */
    public Page<Brand> getBrandsByCountry(String country, Pageable pageable) {
        return brandRepository.findByCountry(country, pageable);
    }

    /**
     * Pobierz listę krajów marek
     */
    public List<String> getAllCountries() {
        return brandRepository.findDistinctCountries();
    }

    // ==================== EKSPORT ====================

    /**
     * Eksportuj marki do CSV
     */
    public String exportToCSV() {
        log.info("Eksportowanie marek do CSV");
        // TODO: Implementacja eksportu
        return "brands_export_" + System.currentTimeMillis() + ".csv";
    }
}