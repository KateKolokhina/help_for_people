package com.naukma.helppeople.entity;

import com.naukma.helppeople.entity.dto.UserDTO;
import com.naukma.helppeople.entity.request.Request;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@Table(name = "users")
public class User implements Serializable {

    @Id
    @Column(nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //FIO
    @Column(nullable = false)
    private String pib;

    @Column(nullable = false)
    private String login;

    @Column(nullable = false)
    private String password;

    @Column()
    private String phone;

    @Column(nullable = false)
    private String role;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "id")
    private List<Request> requests = new ArrayList<>();


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
