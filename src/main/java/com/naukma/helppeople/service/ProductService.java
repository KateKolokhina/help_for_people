package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.dto.ProductAddDTO;
import com.naukma.helppeople.entity.dto.ProductDTO;
import com.naukma.helppeople.entity.dto.ProductShowDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.CategoryNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.exceptionHandlers.exceptions.ProductNotFoundException;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.ProductRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Log4j2
public class ProductService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductRepository productRepository;

    @Transactional
    public void deleteRepository(Long id) {
        Optional<Product> product = productRepository.findById(id);
        if (!product.isPresent()) {
            throw new ProductNotFoundException(id.toString());
        } else {
            productRepository.deleteById(id);
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void createProduct(ProductAddDTO product) {
        if (!categoryRepository.findById(product.getCategoryId()).isPresent()) {
            throw new CategoryNotFoundException(product.getCategoryId());
        }
        Category category = categoryRepository.findById(product.getCategoryId()).get();
        String name = createNameForProduct(product, category);
        if (productRepository.findByName(name).isPresent()) {
            throw new EntityDuplicateException("Товар", "name", name);
        }
        Product pr = fromDTO(product);
        pr.setId(null);
        pr.setName(name);
        pr.setCategory(category);
        productRepository.save(pr);
    }

    private String createNameForProduct(ProductAddDTO product, Category category) {
        StringBuilder res = new StringBuilder();
        switch (product.getGender()) {
            case "F":
                res.append("Жіноч ");
                break;
            case "M":
                res.append("Чоловіч ");
                break;
            case "K":
                res.append("Дитяч ");
                break;
        }
        res.append(category.getName()).append(" ");
        res.append(product.getSize()).append("р. ");

        return res.toString();
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void editProduct(Long id, ProductAddDTO product) {

        if (!categoryRepository.findById(product.getCategoryId()).isPresent()) {
            throw new CategoryNotFoundException(product.getCategoryId());
        }
        if (!productRepository.findById(id).isPresent()) {
            throw new ProductNotFoundException(id.toString());
        }
        if (productRepository.findById(product.getId()).isPresent() && !product.getId().equals(id)) {
            throw new EntityDuplicateException("Товар", "id", product.getId().toString());
        }
        Category category = categoryRepository.findById(product.getCategoryId()).get();
        Product pr = fromDTO(product);
        pr.setCategory(category);
        pr.setName(createNameForProduct(product, category));

        Product old = productRepository.findById(id).get();

        if (!old.equals(pr))
            productRepository.save(pr);
    }

    public Product fromDTO(ProductAddDTO dto) {
        Product res = new Product();
        if (dto.getId() != null) {
            res.setId(dto.getId());
        }
        res.setName(dto.getName());
        res.setGender(dto.getGender());
        res.setSeason(dto.getSeason());
        res.setSize(dto.getSize());

        if (dto.getTotalCount() == null)
            res.setTotalCount(0);
        else
            res.setTotalCount(dto.getTotalCount());

        return res;
    }










    public void deleteById(Long id) {
        productRepository.deleteById(id);
    }


    public void createProduct(String name, String gender, String season, Integer size, Integer count, Long category) {

        Category c = categoryRepository.findById(category).orElseThrow(() ->  new CategoryNotFoundException(category));
        if (name == null || name.isEmpty()) throw new RuntimeException("Empty name");
        if (gender == null || !gender.matches("F|M|K")) throw new RuntimeException("Invalid or empty gender");
        if (season == null || !season.matches("Autumn|Winter|Spring|Summer")) throw new RuntimeException("Invalid or empty season");
        if (size == null || size < 0) throw new RuntimeException("Invalid or negative size");
        if (count == null || count < 0) throw new RuntimeException("Invalid or negative count");

        Product product = new Product();

        product.setName(name);
        product.setGender(gender);
        product.setSeason(season);
        product.setSize(size);
        product.setTotalCount(count);
        product.setCategory(c);

        productRepository.save(product);
    }

    public void updateProduct(long id, String name, String gender, String season, Integer size, Integer count, Long category) {
        Product product = productRepository.findById(id).orElseThrow(() -> new ProductNotFoundException("-1L"));
        Category c = categoryRepository.findById(category).orElseThrow(() ->  new CategoryNotFoundException(category));
        if (name == null || name.isEmpty()) throw new RuntimeException("Empty name");
        if (gender == null || !gender.matches("F|M|K")) throw new RuntimeException("Invalid or empty gender");
        if (season == null || !season.matches("Autumn|Winter|Spring|Summer")) throw new RuntimeException("Invalid or empty season");
        if (size == null || size < 0) throw new RuntimeException("Invalid or negative size");
        if (count == null || count < 0) throw new RuntimeException("Invalid or negative count");

        product.setName(name);
        product.setGender(gender);
        product.setSeason(season);
        product.setSize(size);
        product.setTotalCount(count);
        product.setCategory(c);

        productRepository.save(product);
    }


    public List<Product> findProducts(String nameQuery, Long category, String gender, String season) {
        return productRepository.findProducts(nameQuery, category, gender, season);
    }

    public Optional<Product> findById(Long id) {
        return productRepository.findById(id);
    }

    public ProductShowDTO toDTO(Product product) {
        ProductShowDTO dto = new ProductShowDTO();

        dto.setId(product.getId());
        dto.setName(product.getName());
        dto.setGender(product.getGender());
        dto.setSeason(product.getSeason());
        dto.setSize(product.getSize());
        dto.setTotalCount(product.getTotalCount());
        dto.setCategoryName(product.getCategory().getName());

        return dto;
    }
}
