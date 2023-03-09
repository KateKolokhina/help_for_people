package com.naukma.helppeople.entity.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.validation.constraints.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ProductChangeAmountDTO {

    @Positive
    private Integer add;

    @Positive
    private Integer remove;

}
