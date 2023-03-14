package com.naukma.helppeople.controller;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.dto.CategoryDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.CategoryNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.UserNotFoundException;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.UserRepository;
import com.naukma.helppeople.service.CategoryService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;

@Controller
@Log4j2
public class CategoryController {

    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserRepository userRepository;

    @ModelAttribute("userId")
    public String getCurrentUserIpn(Authentication authentication) {
        UserDetails det = (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
        if (det == null) {
            return "";
        } else {
            String login = det.getUsername();
            if (!userRepository.findByLogin(login).isPresent()) {
                throw new UserNotFoundException(login);
            } else
                return userRepository.findByLogin(login).get().getId().toString();
        }
    }

    @ModelAttribute("currentUser")
    public UserDetails getCurrentUser(Authentication authentication) {
        return (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
    }

    @GetMapping("/category/all")
    public ModelAndView getAllCategories() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("category_all");
        mav.addObject("categories", categoryRepository.getCategoriesInformation());
        return mav;
    }

    @GetMapping("/category/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView getCategory(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("category");
        CategoryDTO category = categoryRepository.getCategoryInformation(id);
        if (category == null) {
            throw new CategoryNotFoundException(id);
        }
        mav.addObject("category", category);
        return mav;
    }

    @PutMapping("/category/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView updateCategory(@PathVariable Long id, @Valid Category category) {

        categoryService.editCategory(id, category);
        return new RedirectView("/category/" + id);
    }

    @GetMapping("/category/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView getAddCategoryPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("category_add");
        Category category = new Category();
        mav.addObject("category", category);
        return mav;
    }

    @PostMapping("/category/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView createCategory(@Valid Category category) {
        log.info(category.toString());
        categoryService.createCategory(category);
        return new RedirectView("/category/all");
    }

    @DeleteMapping("/category/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView deleteCategory(@PathVariable Long id) {
        categoryService.deleteCategory(id);
        return new RedirectView("/category/all");
    }
}