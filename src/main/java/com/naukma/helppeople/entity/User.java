package com.naukma.helppeople.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.io.Serializable;
import java.util.Set;

@Entity
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "users")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @NotBlank
    @Size(max = 255)
    @Column(name = "login", nullable = false, length = 255)
    private String login;

    @NotBlank
    @Size(max = 255)
    @Column(name = "password", nullable = false, length = 255)
    private String password;

    @NotBlank
    @Size(max = 255)
    @Column(name = "phone", nullable = false, length = 255)
    private String phone;

    @NotBlank
    @Size(max = 255)
    @Column(name = "pib", nullable = false, length = 255)
    private String pib;

    @NotBlank
    @Size(max = 255)
    @Column(name = "role", nullable = false, length = 255)
    private String role;
}
