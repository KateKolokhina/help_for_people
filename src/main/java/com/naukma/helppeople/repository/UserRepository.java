package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.entity.dto.UserInfoDTO;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    Optional<User> findByLogin(String login);

    Optional<User> findByPhone(String phone);


    Optional<User> findUserById(Long id);

    List<User> findUsersByRole(String role);


    @Query(nativeQuery = true,
            value = "SELECT id, login, password, role , pib, phone " +
                    "FROM users " +
                    "WHERE id = :id")
    UserInfoDTO findUserDtoById(@Param("id") Long id);

}