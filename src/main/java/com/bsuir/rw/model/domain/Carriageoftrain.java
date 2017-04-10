package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Carriageoftrain {
    private int idCarriageOfTrain;
    private String type;
    private Integer idTrain;
    private Integer number;
    private Trains trainsByIdTrain;
    private Carriage carriageByType;
    private Collection<Places> placesByIdCarriageOfTrain;

    @Id
    @Column(name = "idCarriageOfTrain", nullable = false)
    public int getIdCarriageOfTrain() {
        return idCarriageOfTrain;
    }

    public void setIdCarriageOfTrain(int idCarriageOfTrain) {
        this.idCarriageOfTrain = idCarriageOfTrain;
    }

    @Basic
    @Column(name = "type", nullable = true, insertable = false, updatable = false)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "idTrain", nullable = true, insertable = false, updatable = false)
    public Integer getIdTrain() {
        return idTrain;
    }

    public void setIdTrain(Integer idTrain) {
        this.idTrain = idTrain;
    }

    @Basic
    @Column(name = "number", nullable = true)
    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Carriageoftrain that = (Carriageoftrain) o;

        if (idCarriageOfTrain != that.idCarriageOfTrain) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (idTrain != null ? !idTrain.equals(that.idTrain) : that.idTrain != null) return false;
        if (number != null ? !number.equals(that.number) : that.number != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idCarriageOfTrain;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (idTrain != null ? idTrain.hashCode() : 0);
        result = 31 * result + (number != null ? number.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "idTrain", referencedColumnName = "idTrain")
    public Trains getTrainsByIdTrain() {
        return trainsByIdTrain;
    }

    public void setTrainsByIdTrain(Trains trainsByIdTrain) {
        this.trainsByIdTrain = trainsByIdTrain;
    }

    @ManyToOne
    @JoinColumn(name = "type", referencedColumnName = "type")
    public Carriage getCarriageByType() {
        return carriageByType;
    }

    public void setCarriageByType(Carriage carriageByType) {
        this.carriageByType = carriageByType;
    }

    @OneToMany(mappedBy = "carriageoftrainByIdCarriage")
    public Collection<Places> getPlacesByIdCarriageOfTrain() {
        return placesByIdCarriageOfTrain;
    }

    public void setPlacesByIdCarriageOfTrain(Collection<Places> placesByIdCarriageOfTrain) {
        this.placesByIdCarriageOfTrain = placesByIdCarriageOfTrain;
    }
}
