package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.exceptionHandlers.exceptions.CategoryNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.exceptionHandlers.exceptions.InvalidData;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.ProductRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@Log4j2
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductRepository productRepository;

    @Transactional
    public void deleteCategory(Long id) {
        Optional<Category> category = categoryRepository.findById(id);
        if (!category.isPresent()) {
            throw new CategoryNotFoundException(id);
        } else {
            categoryRepository.deleteById(id);
        }
    }

    public void createCategory(Category newCategory) {
        if (categoryRepository.findByName(newCategory.getName()).isPresent()) {
            throw new EntityDuplicateException("Категорія", "name", newCategory.getName());
        }
        categoryRepository.save(newCategory);
    }

    public boolean editCategory(Long id, Category newCategory) {
        Category old;
        if (categoryRepository.findById(id).isPresent()) {
            old = categoryRepository.findById(id).get();
        } else {
            throw new CategoryNotFoundException(id);
        }
        if (!old.getId().equals(newCategory.getId())) {
            throw new InvalidData(Collections.singletonMap("category_id", id.toString()));
        }
        if (!old.equals(newCategory)) {
            if (categoryRepository.findByName(newCategory.getName()).isPresent()) {
                Category finded = categoryRepository.findByName(newCategory.getName()).get();
                if (finded.getName().equals(newCategory.getName()) && !old.getName().equals(newCategory.getName()))
                    throw new EntityDuplicateException("Категорія", "name", newCategory.getName());
            }
            if (newCategory.isSeasonIsNeed() == false) {
                List<Product> prods = productRepository.findProductsByCategory_Id(newCategory.getId());
                for (Product p : prods) {
                    p.setSeason(null);
                }
                productRepository.saveAll(prods);
            }
            newCategory.setProducts(old.getProducts());
            categoryRepository.save(newCategory);
            return true;
        }
        return false;
    }
}
