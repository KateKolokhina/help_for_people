package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.dto.CategoryDTO1;
import com.naukma.helppeople.exceptionHandlers.exceptions.CategoryNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.exceptionHandlers.exceptions.InvalidData;
import com.naukma.helppeople.repository.CategoryRepository;
import com.naukma.helppeople.repository.ProductRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
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

    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        categoryRepository.findAll().forEach(categories::add);
        return categories;
    }

    public Optional<Category> findById(Long id) {
        return categoryRepository.findById(id);
    }

    public void deleteById(Long id) {
        categoryRepository.deleteById(id);
    }

    public void createCategory(String name, String type) {
        if (name == null || name.isEmpty()) throw new RuntimeException("Empty name");
        if (type == null || type.isEmpty()) throw new RuntimeException("Empty type");


        Category category = new Category();

        category.setName(name);
        category.setType(type);

        categoryRepository.save(category);
    }

    public void updateCategory(long id, String name, String type) {
        Category category = categoryRepository.findById(id).orElseThrow(() -> new CategoryNotFoundException(id));

        if (name == null || name.isEmpty()) throw new RuntimeException("Empty name");
        if (type == null || type.isEmpty()) throw new RuntimeException("Empty type");

        category.setName(name);
        category.setType(type);

        categoryRepository.save(category);
    }

    public CategoryDTO1 toDTO(Category category) {
        CategoryDTO1 dto = new CategoryDTO1();

        dto.setId(category.getId());
        dto.setName(category.getName());
        dto.setType(category.getType());

        return dto;
    }
}
