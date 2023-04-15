package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.Product;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ProductRepositoryCustom {
    List<Product> findProducts(String nameQuery, Long category, String gender, String season);
}
