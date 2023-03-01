package com.naukma.helppeople;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }

    /**
     * Encoder of password
     */
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * Method builder for security configuration
     */
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery(
                        "select login, password, 'true' from USERS " +
                                "where login=?")
                .authoritiesByUsernameQuery(
                        "select login, role from USERS " +
                                "where login=?");
    }

    /**
     * Method for security configuration
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.headers().frameOptions().disable();
        http
                .csrf().disable()
                .logout()
                .logoutSuccessUrl("/")
                .and()
                .authorizeRequests()
                .antMatchers("/index", "/where-find", "/donate", "/help").permitAll()
                .antMatchers("/category/**", "/product/**").hasAuthority("ADMIN")
                .antMatchers("/user/**", "receipt/**").hasAnyAuthority("USER", "ADMIN")
                .and().exceptionHandling().accessDeniedPage("/accessDenied")
                .and()
                .formLogin()
                .defaultSuccessUrl("/")
                .defaultSuccessUrl("/success_login")
                .permitAll();
    }

}