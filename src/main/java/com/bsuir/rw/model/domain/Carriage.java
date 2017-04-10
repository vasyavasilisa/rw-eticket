package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Carriage {
    private String type;
    private Integer countPlace;
    private Collection<Carriageoftrain> carriageoftrainsByType;

    @Id
    @Column(name = "type", nullable = false, length = 255)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "countPlace", nullable = true)
    public Integer getCountPlace() {
        return countPlace;
    }

    public void setCountPlace(Integer countPlace) {
        this.countPlace = countPlace;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Carriage carriage = (Carriage) o;

        if (type != null ? !type.equals(carriage.type) : carriage.type != null) return false;
        if (countPlace != null ? !countPlace.equals(carriage.countPlace) : carriage.countPlace != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = type != null ? type.hashCode() : 0;
        result = 31 * result + (countPlace != null ? countPlace.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "carriageByType")
    public Collection<Carriageoftrain> getCarriageoftrainsByType() {
        return carriageoftrainsByType;
    }

    public void setCarriageoftrainsByType(Collection<Carriageoftrain> carriageoftrainsByType) {
        this.carriageoftrainsByType = carriageoftrainsByType;
    }
}
