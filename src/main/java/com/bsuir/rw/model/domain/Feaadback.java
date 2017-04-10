package com.bsuir.rw.model.domain;

import javax.persistence.*;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Feaadback {
    private int idFeedback;
    private Integer idUser;
    private String text;
    private Users usersByIdUser;

    @Id
    @Column(name = "idFeedback", nullable = false)
    public int getIdFeedback() {
        return idFeedback;
    }

    public void setIdFeedback(int idFeedback) {
        this.idFeedback = idFeedback;
    }

    @Basic
    @Column(name = "idUser", nullable = true, insertable = false, updatable = false)
    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "text", nullable = false, length = 255)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Feaadback feaadback = (Feaadback) o;

        if (idFeedback != feaadback.idFeedback) return false;
        if (idUser != null ? !idUser.equals(feaadback.idUser) : feaadback.idUser != null) return false;
        if (text != null ? !text.equals(feaadback.text) : feaadback.text != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idFeedback;
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "idUser", referencedColumnName = "idUser")
    public Users getUsersByIdUser() {
        return usersByIdUser;
    }

    public void setUsersByIdUser(Users usersByIdUser) {
        this.usersByIdUser = usersByIdUser;
    }
}
