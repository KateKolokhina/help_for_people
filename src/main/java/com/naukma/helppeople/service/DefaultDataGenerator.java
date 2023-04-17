package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.ProductRepository;
import com.naukma.helppeople.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DefaultDataGenerator implements CommandLineRunner {

    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    @Override
    public void run(String... args) throws Exception {
        // Generate default data for Category entity
        Category category1 = new Category();
        category1.setName("Clothing");
        category1.setType("CLO");
        category1.setSeasonIsNeed(true);
        categoryRepository.save(category1);

        Category category2 = new Category();
        category2.setName("Shoes");
        category2.setType("SHO");
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

        User admin = new User();
        admin.setLogin("admin@gmail.com");
        admin.setPassword("$2a$10$MRGJAmBFcspvs/lhud2r5.QD7FKUO29eKdfTWfV/6bjfFb6YGQbDi");
        admin.setRole("ADMIN");
        admin.setPib("admin");
        admin.setPhone("+100000000");
        userRepository.save(admin);

        User user = new User();
        user.setLogin("at.cat.smile@gmail.com");
        user.setPassword("$2a$10$MRGJAmBFcspvs/lhud2r5.QD7FKUO29eKdfTWfV/6bjfFb6YGQbDi");
        user.setRole("USER");
        user.setPib("Ткаченко Андрій Тарасович");
        user.setPhone("+380961581077");
        userRepository.save(user);
    }
}

