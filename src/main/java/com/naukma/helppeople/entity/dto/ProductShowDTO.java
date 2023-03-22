package com.naukma.helppeople.entity.dto;

import com.naukma.helppeople.entity.Category;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Getter
@Setter
public class ProductShowDTO {
    Long id;
    String name;
    String gender;
    String season;
    Integer size;
    Integer totalCount;
    String categoryName;
}
