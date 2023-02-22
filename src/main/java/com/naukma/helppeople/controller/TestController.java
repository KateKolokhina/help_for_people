package com.naukma.helppeople.controller;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.ProductRepository;
import com.naukma.helppeople.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class TestController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    ProductRepository productRepository;


    @GetMapping("/test1")
    @ResponseBody
    public String test1() {
        User user = User.builder().login("usrlgn").password("psw000").phone("097222").pib("A.N.N").role("Client").build();

        userRepository.save(user);

        return "<html><body><h2>"+userRepository.findById(user.getId())+"</h2></body></html>";
    }

    @GetMapping("/test2")
    @ResponseBody
    public String test2() {
        Category category = Category.builder().name("CategoryName").type("CategoryType").seasonIsNeed(true).build();

        Product product1 = Product.builder().category(category).gender("male").season("Spring").name("Boot").size(1).totalCount(10).build();
        Product product2 = Product.builder().category(category).gender("female").season("winter").name("Product2").size(5).totalCount(5).build();
        Product product3 = Product.builder().category(category).gender("male").season("spring").name("Product3").size(3).totalCount(16).build();


        categoryRepository.save(category);
        productRepository.saveAll(List.of(product1, product2, product3));

        StringBuilder html = new StringBuilder();
        html.append("<html><body><h2>");
        productRepository.findProductsByCategoryId(category.getId()).forEach(product -> {
            html.append("<p>").append(product).append("</p>");
        });
        html.append("</h2></body></html>");

        return html.toString();
    }
}