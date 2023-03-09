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
public class ProductAddDTO {

    private Long id;

    private String name;

    @NotNull
    @NotBlank
    @Pattern(regexp = "CLO|SHO")
    private String type;

    @NotNull
    @Positive
    private Long categoryId;

    @NotNull
    @NotBlank
    @Pattern(regexp = "F|M|K")
    private String gender;

    
    @Pattern(regexp = "Autumn|Winter|Spring|Summer")
    private String season = null;

    @Column(unique = true, nullable = false)
    @Positive()
    private Integer size;

    @Min(0)
    private Integer totalCount = 0;

}
