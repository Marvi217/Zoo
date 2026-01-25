package com.example.zoo.controller;

import com.example.zoo.SecurityHelper;
import com.example.zoo.dto.ProductSearchDto;
import com.example.zoo.entity.User;
import com.example.zoo.service.CategoryService;
import com.example.zoo.service.SearchService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/search")
@RequiredArgsConstructor
public class SearchController {

    private final SearchService searchService;
    private final CategoryService categoryService;
    private final SecurityHelper securityHelper;

    @GetMapping
    public String search(@ModelAttribute ProductSearchDto searchDto, Model model, HttpSession session) {
        // Record search
        User user = securityHelper.getCurrentUser(session);
        searchService.recordSearch(searchDto.getQuery(), user, session.getId());
        
        model.addAttribute("products", searchService.searchProducts(searchDto));
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("searchDto", searchDto);
        return "search-results";
    }

    @GetMapping("/quick")
    public String quickSearch(@RequestParam String q, Model model, HttpSession session) {
        // Record search
        User user = securityHelper.getCurrentUser(session);
        searchService.recordSearch(q, user, session.getId());
        
        model.addAttribute("products", searchService.quickSearch(q));
        model.addAttribute("query", q);
        model.addAttribute("categories", categoryService.getAllCategories());
        return "search-results";
    }

    @GetMapping("/api/suggestions")
    @ResponseBody
    public List<SearchService.SearchSuggestion> getSuggestions(
            @RequestParam String q,
            HttpSession session) {
        User user = securityHelper.getCurrentUser(session);
        return searchService.getSuggestions(q, user, session.getId());
    }
}