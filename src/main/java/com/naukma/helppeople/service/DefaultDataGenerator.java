package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.ProductRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DefaultDataGenerator implements CommandLineRunner {

    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;

    public DefaultDataGenerator(CategoryRepository categoryRepository, ProductRepository productRepository) {
        this.categoryRepository = categoryRepository;
        this.productRepository = productRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        // Generate default data for Category entity
        Category category1 = new Category();
        category1.setName("Clothing");
        category1.setType("Apparel");
        category1.setSeasonIsNeed(true);
        categoryRepository.save(category1);

        Category category2 = new Category();
        category2.setName("Shoes");
        category2.setType("Footwear");
        category2.setSeasonIsNeed(false);
        categoryRepository.save(category2);

        // Generate default data for Product entity
        Product product1 = new Product();
        product1.setName("T-shirt");
        product1.setGender("M");
        product1.setSeason("Summer");
        product1.setSize(2);
        product1.setTotalCount(50);
        product1.setCategory(category1);
        productRepository.save(product1);

        Product product2 = new Product();
        product2.setName("Sneakers");
        product2.setGender("F");
        product2.setSeason("Spring");
        product2.setSize(6);
        product2.setTotalCount(30);
        product2.setCategory(category2);
        productRepository.save(product2);
    }
}

