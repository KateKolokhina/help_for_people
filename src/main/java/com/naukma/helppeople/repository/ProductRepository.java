package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
    @Query(nativeQuery = true, value = "SELECT * FROM products WHERE category_id = ?1")
    List<Product> findProductsByCategoryId(Long categoryId);

    List<Product> findProductsByTotalCountGreaterThan(Integer at);
    @Override
    Optional<Product> findById(Long aLong);
}
