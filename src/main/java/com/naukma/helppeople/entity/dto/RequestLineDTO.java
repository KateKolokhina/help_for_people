package com.naukma.helppeople.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestLineDTO {

    Long id;

    String gender;
    String category;
    String season;
    Integer size;
    Integer amount;

    Integer totalCount;
}
