package com.naukma.helppeople.controller;

import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.dto.ProductAddDTO;
import com.naukma.helppeople.entity.dto.ProductChangeAmountDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.ProductNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.UserNotFoundException;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.ProductRepository;
import com.naukma.helppeople.repository.UserRepository;
import com.naukma.helppeople.service.ProductService;
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
public class ProductController {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;

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

    @GetMapping("/product/all")
    public ModelAndView getAllProducts() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product_all");
        mav.addObject("products", productRepository.findAll());
        return mav;
    }


    @PutMapping("/product/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView updateProduct(@PathVariable Long id, @Valid ProductAddDTO product) {
        productService.editProduct(id, product);
        return new RedirectView("/product/all");
    }

    @PostMapping("/product/amount/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView updateAmount(@PathVariable Long id, @Valid ProductChangeAmountDTO obj) {
        if (!productRepository.findById(id).isPresent()) {
            throw new ProductNotFoundException(id.toString());
        }
        if (obj.getAdd() == null) {
            obj.setAdd(0);
        }
        if (obj.getRemove() == null) {
            obj.setRemove(0);
        }
        Product product = productRepository.findById(id).get();
        product.setTotalCount(product.getTotalCount() + obj.getAdd());
        product.setTotalCount(product.getTotalCount() - obj.getRemove());
        productRepository.save(product);
        return new RedirectView("/product/" + id);
    }

    @GetMapping("/product/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView getProduct(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product_edit");

        if (!productRepository.findById(id).isPresent()) {
            throw new ProductNotFoundException(id.toString());
        }
        Product product = productRepository.findById(id).get();

        mav.addObject("categories", categoryRepository.findAll());
        mav.addObject("product", toDto(product));
        mav.addObject("amountObj", new ProductChangeAmountDTO());
        return mav;
    }

    @GetMapping("/product/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView getAddProductPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product_add");
        ProductAddDTO product = new ProductAddDTO();
        mav.addObject("categories", categoryRepository.findAll());
        mav.addObject("product", product);

        return mav;
    }

    @PostMapping("/product/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView createProduct(@Valid ProductAddDTO product) {
        log.info(product);
        productService.createProduct(product);
        return new RedirectView("/product/all");
    }

    @DeleteMapping("/product/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView deleteProduct(@PathVariable Long id) {
        productService.deleteRepository(id);
        return new RedirectView("/product/all");
    }

    public ProductAddDTO toDto(Product product) {
        ProductAddDTO res = new ProductAddDTO();
        if (product.getId() != null) {
            res.setId(product.getId());
        }
        res.setName(product.getName());
        res.setType(product.getCategory().getType());
        res.setCategoryId(product.getCategory().getId());
        res.setGender(product.getGender());
        res.setSeason(product.getSeason());
        res.setSize(product.getSize());

        if (product.getTotalCount() == null)
            res.setTotalCount(0);
        else
            res.setTotalCount(product.getTotalCount());

        return res;
    }
}