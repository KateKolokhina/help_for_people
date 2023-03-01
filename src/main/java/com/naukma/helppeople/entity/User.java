package com.naukma.helppeople.entity;

import com.naukma.helppeople.entity.dto.UserDTO;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@Getter
@Setter
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

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "id")
    private List<HelpRequest> requests = new ArrayList<>();


    public User changeUser(UserDTO dto) {

        this.login = dto.getLogin();
        this.pib = dto.getPib();
        this.phone = dto.getPhone();

        if (!dto.getPassword().isEmpty()) {
            this.password = dto.getPassword();
        }
        return this;
    }
}
