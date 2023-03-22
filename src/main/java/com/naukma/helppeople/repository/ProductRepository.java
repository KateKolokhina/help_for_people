package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>, ProductRepositoryCustom {
    @Override
    Iterable<Product> findAll();

    List<Product> findProductsByTotalCountGreaterThan(Integer at);

    List<Product> findProductsByCategory_Id(Long id);

    @Override
    Optional<Product> findById(Long aLong);

    Optional<Product> findByName(String name);

}