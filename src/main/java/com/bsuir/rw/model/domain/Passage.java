package com.bsuir.rw.model.domain;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Passage {
    private int idPassage;
    private Integer idTrain;
    private Date date;

    @Id
    @Column(name = "idPassage", nullable = false)
    public int getIdPassage() {
        return idPassage;
    }

    public void setIdPassage(int idPassage) {
        this.idPassage = idPassage;
    }

    @Basic
    @Column(name = "idTrain", nullable = true)
    public Integer getIdTrain() {
        return idTrain;
    }

    public void setIdTrain(Integer idTrain) {
        this.idTrain = idTrain;
    }

    @Basic
    @Column(name = "date", nullable = true)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Passage passage = (Passage) o;

        if (idPassage != passage.idPassage) return false;
        if (idTrain != null ? !idTrain.equals(passage.idTrain) : passage.idTrain != null) return false;
        if (date != null ? !date.equals(passage.date) : passage.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idPassage;
        result = 31 * result + (idTrain != null ? idTrain.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
