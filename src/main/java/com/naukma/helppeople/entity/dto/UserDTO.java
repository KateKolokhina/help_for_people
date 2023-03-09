package com.naukma.helppeople.entity.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@NoArgsConstructor
public class UserDTO {

    public UserDTO(UserInfoDTO dto) {
        this.id = dto.getId();
        this.login = dto.getLogin();
        this.pib = dto.getPib();
        this.phone = dto.getPhone();
    }

    @NotNull
    private Long id;

    @NotNull
    @Pattern(regexp = "^[a-zA-Z]+$")
    private String pib;

    @NotNull
    private String login;

    private String oldLogin;

    @NotNull
    @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z]).{8,32}$")
    private String password;

    private String confirmedPassword;

    @NotNull
    private String phone;

}
