package com.naukma.helppeople.entity.dto;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;


@Data
@NoArgsConstructor
public class UserDTO {

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
