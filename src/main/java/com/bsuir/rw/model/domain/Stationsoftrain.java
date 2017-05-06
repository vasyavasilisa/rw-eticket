package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Stationsoftrain {
    private int idStationOfTrain;
    private int idTrain;
    private int idStation;
    private String datetimeOfArrive;
    private String datetimeOfDeparture;
    private Integer distance;
    private Stations stationsByIdStation;
    private Trains trainsByIdTrain;
    private Collection<Trainrouts> trainroutsesByIdStationOfTrain;
    private Collection<Trainrouts> trainroutsesByIdStationOfTrain_0;

    @Id
    @Column(name = "idStationOfTrain", nullable = false)
    public int getIdStationOfTrain() {
        return idStationOfTrain;
    }

    public void setIdStationOfTrain(int idStationOfTrain) {
        this.idStationOfTrain = idStationOfTrain;
    }

    @Basic
    @Column(name = "idTrain", nullable = true, insertable = false, updatable = false)
    public int getIdTrain() {
        return idTrain;
    }

    public void setIdTrain(int idTrain) {
        this.idTrain = idTrain;
    }

    @Basic
    @Column(name = "idStation", nullable = true, insertable = false, updatable = false)
    public int getIdStation() {
        return idStation;
    }

    public void setIdStation(int idStation) {
        this.idStation = idStation;
    }

    @Basic
    @Column(name = "datetimeOfArrive", nullable = true)
    public String getDatetimeOfArrive() {
        return datetimeOfArrive;
    }

    public void setDatetimeOfArrive(String datetimeOfArrive) {
        this.datetimeOfArrive = datetimeOfArrive;
    }

    @Basic
    @Column(name = "datetimeOfDeparture", nullable = true)
    public String getDatetimeOfDeparture() {
        return datetimeOfDeparture;
    }

    public void setDatetimeOfDeparture(String datetimeOfDeparture) {
        this.datetimeOfDeparture = datetimeOfDeparture;
    }

    @Basic
    @Column(name = "distance", nullable = true)
    public Integer getDistance() {
        return distance;
    }

    public void setDistance(Integer distance) {
        this.distance = distance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stationsoftrain that = (Stationsoftrain) o;

        if (idStationOfTrain != that.idStationOfTrain) return false;
        if (idTrain != that.idTrain) return false;
        if (idStation != that.idStation) return false;
        if (datetimeOfArrive != null ? !datetimeOfArrive.equals(that.datetimeOfArrive) : that.datetimeOfArrive != null)
            return false;
        if (datetimeOfDeparture != null ? !datetimeOfDeparture.equals(that.datetimeOfDeparture) : that.datetimeOfDeparture != null)
            return false;
        if (distance != null ? !distance.equals(that.distance) : that.distance != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idStationOfTrain;
        result = 31 * result + idTrain;
        result = 31 * result + idStation;
        result = 31 * result + (datetimeOfArrive != null ? datetimeOfArrive.hashCode() : 0);
        result = 31 * result + (datetimeOfDeparture != null ? datetimeOfDeparture.hashCode() : 0);
        result = 31 * result + (distance != null ? distance.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "idStation", referencedColumnName = "idStation", nullable = false)
    public Stations getStationsByIdStation() {
        return stationsByIdStation;
    }

    public void setStationsByIdStation(Stations stationsByIdStation) {
        this.stationsByIdStation = stationsByIdStation;
    }

    @ManyToOne
    @JoinColumn(name = "idTrain", referencedColumnName = "idTrain", nullable = false)
    public Trains getTrainsByIdTrain() {
        return trainsByIdTrain;
    }

    public void setTrainsByIdTrain(Trains trainsByIdTrain) {
        this.trainsByIdTrain = trainsByIdTrain;
    }

    @OneToMany(mappedBy = "stationsoftrainByIdDepartureStation")
    public Collection<Trainrouts> getTrainroutsesByIdStationOfTrain() {
        return trainroutsesByIdStationOfTrain;
    }

    public void setTrainroutsesByIdStationOfTrain(Collection<Trainrouts> trainroutsesByIdStationOfTrain) {
        this.trainroutsesByIdStationOfTrain = trainroutsesByIdStationOfTrain;
    }

    @OneToMany(mappedBy = "stationsoftrainByIdArriveStation")
    public Collection<Trainrouts> getTrainroutsesByIdStationOfTrain_0() {
        return trainroutsesByIdStationOfTrain_0;
    }

    public void setTrainroutsesByIdStationOfTrain_0(Collection<Trainrouts> trainroutsesByIdStationOfTrain_0) {
        this.trainroutsesByIdStationOfTrain_0 = trainroutsesByIdStationOfTrain_0;
    }
}
