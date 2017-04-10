package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Trains {
    private int idTrain;
    private String number;
    private String nameTrain;
    private Collection<Carriageoftrain> carriageoftrainsByIdTrain;
    private Collection<Stationsoftrain> stationsoftrainsByIdTrain;
    private Collection<Trainrouts> trainroutsesByIdTrain;

    @Id
    @Column(name = "idTrain", nullable = false)
    public int getIdTrain() {
        return idTrain;
    }

    public void setIdTrain(int idTrain) {
        this.idTrain = idTrain;
    }

    @Basic
    @Column(name = "number", nullable = false, length = 255)
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Basic
    @Column(name = "nameTrain", nullable = false, length = 255)
    public String getNameTrain() {
        return nameTrain;
    }

    public void setNameTrain(String nameTrain) {
        this.nameTrain = nameTrain;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Trains trains = (Trains) o;

        if (idTrain != trains.idTrain) return false;
        if (number != null ? !number.equals(trains.number) : trains.number != null) return false;
        if (nameTrain != null ? !nameTrain.equals(trains.nameTrain) : trains.nameTrain != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idTrain;
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + (nameTrain != null ? nameTrain.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "trainsByIdTrain")
    public Collection<Carriageoftrain> getCarriageoftrainsByIdTrain() {
        return carriageoftrainsByIdTrain;
    }

    public void setCarriageoftrainsByIdTrain(Collection<Carriageoftrain> carriageoftrainsByIdTrain) {
        this.carriageoftrainsByIdTrain = carriageoftrainsByIdTrain;
    }

    @OneToMany(mappedBy = "trainsByIdTrain")
    public Collection<Stationsoftrain> getStationsoftrainsByIdTrain() {
        return stationsoftrainsByIdTrain;
    }

    public void setStationsoftrainsByIdTrain(Collection<Stationsoftrain> stationsoftrainsByIdTrain) {
        this.stationsoftrainsByIdTrain = stationsoftrainsByIdTrain;
    }

    @OneToMany(mappedBy = "trainsByIdTrain")
    public Collection<Trainrouts> getTrainroutsesByIdTrain() {
        return trainroutsesByIdTrain;
    }

    public void setTrainroutsesByIdTrain(Collection<Trainrouts> trainroutsesByIdTrain) {
        this.trainroutsesByIdTrain = trainroutsesByIdTrain;
    }
}
