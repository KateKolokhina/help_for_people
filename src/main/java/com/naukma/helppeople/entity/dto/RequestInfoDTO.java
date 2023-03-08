package com.naukma.helppeople.entity.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class RequestInfoDTO {

    @NotNull
    private Long userId;

    private Long adminId;
}
