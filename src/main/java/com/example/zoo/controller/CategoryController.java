package com.example.zoo.controller;

import com.example.zoo.StarHelper;
import com.example.zoo.entity.*;
import com.example.zoo.repository.WishlistRepository;
import com.example.zoo.service.CategoryService;
import com.example.zoo.service.ProductService;
import com.example.zoo.service.BrandService;
import com.example.zoo.service.WishlistService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
@RequestMapping("/category")
@RequiredArgsConstructor
public class CategoryController {

    private final CategoryService categoryService;
    private final ProductService productService;
    private final BrandService brandService;
    private final WishlistService wishlistService;

    public record FilterTag(String label, String value) {}


    @GetMapping("/{slug}")
    public String showCategory(
            @PathVariable String slug,
            @RequestParam(required = false) List<Long> subcategory,
            @RequestParam(required = false) List<Long> brands,
            @RequestParam(required = false) Double minPrice,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) String sort,
            @RequestParam(defaultValue = "0") int page,
            HttpSession session,
            Model model) {

        Category category = categoryService.getCategoryBySlug(slug);
        if (category == null) return "redirect:/";

        List<FilterTag> activeFilters = new ArrayList<>();

        // Build active filters for display
        if (subcategory != null && !subcategory.isEmpty()) {
            activeFilters.add(new FilterTag("Subkategorie: " + subcategory.size(), "subcategory"));
        }
        if (brands != null && !brands.isEmpty()) {
            activeFilters.add(new FilterTag("Marki: " + brands.size(), "brands"));
        }
        if (minPrice != null) {
            activeFilters.add(new FilterTag("Cena od: " + minPrice + " zł", "minPrice"));
        }
        if (maxPrice != null) {
            activeFilters.add(new FilterTag("Cena do: " + maxPrice + " zł", "maxPrice"));
        }

        Sort sortOrder;
        switch (sort != null ? sort : "newest") {
            case "price-asc" -> sortOrder = Sort.by("price").ascending();
            case "price-desc" -> sortOrder = Sort.by("price").descending();
            case "popularity" -> sortOrder = Sort.by("stockQuantity").descending();
            case "rating" -> sortOrder = Sort.by("rating").descending();
            case "name-asc" -> sortOrder = Sort.by("name").ascending();
            case "name-desc" -> sortOrder = Sort.by("name").descending();
            default -> sortOrder = Sort.by("id").descending();
        }

        Pageable pageable = PageRequest.of(page, 20, sortOrder);

        java.math.BigDecimal min = (minPrice != null) ? java.math.BigDecimal.valueOf(minPrice) : null;
        java.math.BigDecimal max = (maxPrice != null) ? java.math.BigDecimal.valueOf(maxPrice) : null;

        // Use advanced filtering with subcategories and brands
        List<Long> subcategoryIds = (subcategory != null && !subcategory.isEmpty()) ? subcategory : null;
        List<Long> brandIds = (brands != null && !brands.isEmpty()) ? brands : null;
        
        Page<Product> productPage = productService.getProductsByCategoryAdvanced(category, subcategoryIds, brandIds, min, max, pageable);

        Map<Integer, Long> ratingCounts = productService.getRatingCountsForCategory(slug);

        // Get subcategories with product counts for filter sidebar
        List<Map<String, Object>> subcategoryFilters = productService.getSubcategoryFilters(slug);
        
        // Get brands with product counts for filter sidebar
        List<Map<String, Object>> brandFilters = productService.getBrandsWithCountByCategory(category);

        Set<Long> wishlistProductIds = new HashSet<>();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            wishlistProductIds = wishlistService.getUserWishlistProductIds(user.getId());
        }

        model.addAttribute("ratingCounts", ratingCounts);
        model.addAttribute("category", category);
        model.addAttribute("subCategories", category.getSubcategories());
        model.addAttribute("subcategoryFilters", subcategoryFilters);
        model.addAttribute("brandFilters", brandFilters);
        model.addAttribute("activeFilters", activeFilters);
        model.addAttribute("productPage", productPage);
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("totalProducts", productPage.getTotalElements());
        model.addAttribute("allBrands", brandService.getAllBrands());
        model.addAttribute("wishlistProductIds", wishlistProductIds);
        model.addAttribute("starHelper", new StarHelper());
        
        // Add current filter values for form preservation
        model.addAttribute("currentSort", sort != null ? sort : "newest");
        model.addAttribute("selectedSubcategories", subcategory != null ? subcategory : Collections.emptyList());
        model.addAttribute("selectedBrands", brands != null ? brands : Collections.emptyList());
        model.addAttribute("currentMinPrice", minPrice);
        model.addAttribute("currentMaxPrice", maxPrice);

        return "category";
    }
}