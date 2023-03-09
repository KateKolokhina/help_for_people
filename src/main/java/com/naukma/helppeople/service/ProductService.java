package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.dto.ProductAddDTO;
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
}
