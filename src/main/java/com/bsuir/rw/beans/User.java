package com.bsuir.rw.beans;

/**
 * Created by USER on 09.04.2017.
 */
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;



@Component
public class User {

    @NotBlank(message="Поле обязательно для заполнения")
    private String login;

    @NotBlank(message="Поле обязательно для заполнения")
    private String password;

    private String surname;


    private String name;


   public String getLogin() {
        return login;
   }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}