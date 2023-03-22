package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;
import java.util.StringJoiner;

public class ProductRepositoryImpl implements ProductRepositoryCustom{

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<Product> findProducts(String nameQuery, Long category, String gender, String season) {
        String select, where;

        StringJoiner conditions = new StringJoiner(" AND ");
        conditions.add("1 = 1");
        if (category != null) conditions.add("category_id = "+category);
        if (nameQuery != null && !nameQuery.isEmpty()) conditions.add("(LOWER(name) LIKE ?)");
        if (gender != null && !gender.isEmpty()) conditions.add("gender = ?");
        if (season != null && !season.isEmpty()) conditions.add("season = ?");

        where = " WHERE " + conditions;
        select = "SELECT * FROM product";

        int pos = 1;
        Query q = entityManager.createNativeQuery(select+where+";", Product.class);
        if (nameQuery != null && !nameQuery.isEmpty()) q.setParameter(pos++, "%"+nameQuery.toLowerCase()+"%");
        if (gender != null && !gender.isEmpty()) q.setParameter(pos++, gender);
        if (season != null && !season.isEmpty()) q.setParameter(pos, season);
        return q.getResultList();
    }
}
