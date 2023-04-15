package com.naukma.helppeople.utils;

import com.naukma.helppeople.entity.Product;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class AdminSessionAttributes {
    private String nameQuery;
    private Long category;
    private String gender;
    private String season;
}
