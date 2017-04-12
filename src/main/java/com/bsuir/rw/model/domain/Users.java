package com.bsuir.rw.model.domain;

import net.bytebuddy.implementation.bind.annotation.Empty;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;

import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Users {
    private int idUser;


    @NotBlank(message="Поле обязательно для заполнения")

    private String surname;


    @NotBlank(message="Поле обязательно для заполнения")
    private String name;

    private String lastname;


    @Pattern(regexp="^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$",message="Некорректное поле 'Телефон'")
    private String phone;

    @Pattern(regexp ="^([a-z0-9_-]+\\.)*[a-z0-9_-]+@[a-z0-9_-]+(\\.[a-z0-9_-]+)*\\.[a-z]{2,6}$",
            message="Некорректное поле 'Адрес электронной почты'")
        private String email;
    private String gender;

    @NotBlank(message="Поле обязательно для заполнения")
    private String login;

    @NotBlank(message="Поле обязательно для заполнения")
    private String password;

    private double balance;
    private  String role;
    private Collection<Feaadback> feaadbacksByIdUser;
    private Collection<Tickets> ticketsesByIdUser;

    @Id
    @Column(name = "idUser", nullable = false)
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }



    @Basic
    @Column(name = "surname", nullable = false, length = 255)
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "lastname", nullable = true, length = 255)
    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }


    @Basic
    @Column(name = "phone", nullable = false, length = 255)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    @Basic
    @Column(name = "email", nullable = false, length = 255)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "gender", nullable = false, length = 255)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    @Basic
    @Column(name = "login", nullable = false, length = 255)
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }


    @Basic
    @Column(name = "password", nullable = false, length = 255)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "balance", nullable = false, precision = 2)
    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Basic
    @Column(name = "role", nullable = false, length = 255,insertable=false, updatable=false/*,columnDefinition = "String default '0'"*/)
    @ColumnDefault("'0'")
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Users users = (Users) o;

        if (idUser != users.idUser) return false;
        if (Double.compare(users.balance, balance) != 0) return false;
        if (surname != null ? !surname.equals(users.surname) : users.surname != null) return false;
        if (name != null ? !name.equals(users.name) : users.name != null) return false;
        if (lastname != null ? !lastname.equals(users.lastname) : users.lastname != null) return false;
        if (phone != null ? !phone.equals(users.phone) : users.phone != null) return false;
        if (email != null ? !email.equals(users.email) : users.email != null) return false;
        if (gender != null ? !gender.equals(users.gender) : users.gender != null) return false;
        if (login != null ? !login.equals(users.login) : users.login != null) return false;
        if (password != null ? !password.equals(users.password) : users.password != null) return false;
        if (role != null ? !role.equals(users.role) : users.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = idUser;
        result = 31 * result + (surname != null ? surname.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (lastname != null ? lastname.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        temp = Double.doubleToLongBits(balance);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "usersByIdUser")
    public Collection<Feaadback> getFeaadbacksByIdUser() {
        return feaadbacksByIdUser;
    }

    public void setFeaadbacksByIdUser(Collection<Feaadback> feaadbacksByIdUser) {
        this.feaadbacksByIdUser = feaadbacksByIdUser;
    }

    @OneToMany(mappedBy = "usersByIdUser")
    public Collection<Tickets> getTicketsesByIdUser() {
        return ticketsesByIdUser;
    }

    public void setTicketsesByIdUser(Collection<Tickets> ticketsesByIdUser) {
        this.ticketsesByIdUser = ticketsesByIdUser;
    }
}
