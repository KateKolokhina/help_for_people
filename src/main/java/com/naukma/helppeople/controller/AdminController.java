package com.naukma.helppeople.controller;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.exceptionHandlers.exceptions.CategoryNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.ProductNotFoundException;
import com.naukma.helppeople.repository.UserRepository;
import com.naukma.helppeople.service.CategoryService;
import com.naukma.helppeople.service.ProductService;
import com.naukma.helppeople.service.UserService;
import com.naukma.helppeople.utils.AdminSessionAttributes;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@Log4j2
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private HttpSession session;




    @GetMapping("/admin/products/show")
    public String showProducts(Model model) {
        List<Product> products = productService.findProducts(getAttributes().getNameQuery(),
                                                             getAttributes().getCategory(),
                                                             getAttributes().getGender(),
                                                             getAttributes().getSeason());


        model.addAttribute("nameQuery", getAttributes().getNameQuery());
        model.addAttribute("category", getAttributes().getCategory());
        model.addAttribute("gender", getAttributes().getGender());
        model.addAttribute("season", getAttributes().getSeason());

        model.addAttribute("categories", categoryService.findAll().stream().map(category -> categoryService.toDTO(category)).collect(Collectors.toList()));
        model.addAttribute("products", products.stream().map(product -> productService.toDTO(product)).collect(Collectors.toList()));

        return "admin/products";
    }

    @GetMapping("/admin/product/create/show")
    public String showProductCreate(Model model) {
        model.addAttribute("categories", categoryService.findAll().stream().map(category -> categoryService.toDTO(category)).collect(Collectors.toList()));
        return "admin/product_create";
    }

    @GetMapping("/admin/product/edit/show")
    public String showProductEdit(@RequestParam Long id, Model model) {
        Product product = productService.findById(id).orElseThrow(() -> new ProductNotFoundException(""));

        model.addAttribute("id", product.getId());
        model.addAttribute("name", product.getName());
        model.addAttribute("gender", product.getGender());
        model.addAttribute("season", product.getSeason());
        model.addAttribute("size", product.getSize());
        model.addAttribute("totalCount", product.getTotalCount());
        model.addAttribute("category", product.getCategory().getId());
        model.addAttribute("categories", categoryService.findAll().stream().map(category -> categoryService.toDTO(category)).collect(Collectors.toList()));
        return "admin/product_edit";
    }



    @GetMapping("/admin/categories/show")
    public String showCategories(Model model) {
        model.addAttribute("categories", categoryService.findAll().stream().map(category -> categoryService.toDTO(category)).collect(Collectors.toList()));
        return "admin/categories";
    }

    @GetMapping("/admin/category/create/show")
    public String showCategoryCreate() {
        return "admin/category_create";
    }

    @GetMapping("/admin/category/edit/show")
    public String showCategoryEdit(@RequestParam Long id, Model model) {
        Category category = categoryService.findById(id).orElseThrow(() -> new CategoryNotFoundException(id));

        model.addAttribute("name", category.getName());
        model.addAttribute("type", category.getType());
        model.addAttribute("id", category.getId());

        return "admin/category_edit";
    }

    @PostMapping("/admin/products/find")
    public String findProducts(@RequestParam(required = false) String nameQuery,
                               @RequestParam(required = false) Long category,
                               @RequestParam(required = false) String gender,
                               @RequestParam(required = false) String season) {

        getAttributes().setNameQuery(nameQuery);
        getAttributes().setCategory(category);
        getAttributes().setGender(gender);
        getAttributes().setSeason(season);

        return "redirect:/admin/products/show";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@RequestParam String name,
                                @RequestParam String gender,
                                @RequestParam String season,
                                @RequestParam Integer size,
                                @RequestParam Integer totalCount,
                                @RequestParam Long category) {

        productService.createProduct(name, gender, season, size, totalCount, category);

        return "redirect:/admin/products/show";
    }

    @PostMapping("/admin/product/edit")
    public String editProduct(@RequestParam Long id,
                              @RequestParam String name,
                              @RequestParam String gender,
                              @RequestParam String season,
                              @RequestParam Integer size,
                              @RequestParam Integer totalCount,
                              @RequestParam Long category) {

        productService.updateProduct(id, name, gender, season, size, totalCount, category);

        return "redirect:/admin/products/show";
    }

    @GetMapping("/admin/product/delete")
    public String deleteProduct(@RequestParam Long id) {

        productService.deleteById(id);

        return "redirect:/admin/products/show";
    }

    @PostMapping("/admin/category/create")
    public String createCategory(@RequestParam String name,
                                 @RequestParam String type) {

        categoryService.createCategory(name, type);

        return "redirect:/admin/categories/show";
    }

    @PostMapping("/admin/category/edit")
    public String editCategory(@RequestParam Long id,
                               @RequestParam String name,
                               @RequestParam String type) {

        categoryService.updateCategory(id, name, type);

        return "redirect:/admin/categories/show";
    }

    @GetMapping("/admin/category/delete")
    public String deleteCategory(@RequestParam Long id) {

        categoryService.deleteById(id);

        return "redirect:/admin/categories/show";
    }


    private AdminSessionAttributes getAttributes() {
        Object object = session.getAttribute("adminSessionAttributes");
        if (object instanceof AdminSessionAttributes) {
            return (AdminSessionAttributes) object;
        } else {
            AdminSessionAttributes adminAttributes = new AdminSessionAttributes();
            session.setAttribute("adminSessionAttributes", adminAttributes);
            return adminAttributes;
        }
    }

}
