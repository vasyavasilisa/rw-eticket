package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Trainrouts {
    private int idRout;
    private Integer idTrain;
    private Integer idDepartureStation;
    private Integer idArriveStation;
    private Collection<Fare> faresByIdRout;
    private Stationsoftrain stationsoftrainByIdDepartureStation;
    private Stationsoftrain stationsoftrainByIdArriveStation;
    private Trains trainsByIdTrain;

    @Id
    @Column(name = "idRout", nullable = false)
    public int getIdRout() {
        return idRout;
    }

    public void setIdRout(int idRout) {
        this.idRout = idRout;
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
    @Column(name = "idDepartureStation", nullable = true, insertable = false, updatable = false)
    public Integer getIdDepartureStation() {
        return idDepartureStation;
    }

    public void setIdDepartureStation(Integer idDepartureStation) {
        this.idDepartureStation = idDepartureStation;
    }

    @Basic
    @Column(name = "idArriveStation", nullable = true, insertable = false, updatable = false)
    public Integer getIdArriveStation() {
        return idArriveStation;
    }

    public void setIdArriveStation(Integer idArriveStation) {
        this.idArriveStation = idArriveStation;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Trainrouts that = (Trainrouts) o;

        if (idRout != that.idRout) return false;
        if (idTrain != null ? !idTrain.equals(that.idTrain) : that.idTrain != null) return false;
        if (idDepartureStation != null ? !idDepartureStation.equals(that.idDepartureStation) : that.idDepartureStation != null)
            return false;
        if (idArriveStation != null ? !idArriveStation.equals(that.idArriveStation) : that.idArriveStation != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idRout;
        result = 31 * result + (idTrain != null ? idTrain.hashCode() : 0);
        result = 31 * result + (idDepartureStation != null ? idDepartureStation.hashCode() : 0);
        result = 31 * result + (idArriveStation != null ? idArriveStation.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "trainroutsByIdRout")
    public Collection<Fare> getFaresByIdRout() {
        return faresByIdRout;
    }

    public void setFaresByIdRout(Collection<Fare> faresByIdRout) {
        this.faresByIdRout = faresByIdRout;
    }

    @ManyToOne
    @JoinColumn(name = "idDepartureStation", referencedColumnName = "idStationOfTrain")
    public Stationsoftrain getStationsoftrainByIdDepartureStation() {
        return stationsoftrainByIdDepartureStation;
    }

    public void setStationsoftrainByIdDepartureStation(Stationsoftrain stationsoftrainByIdDepartureStation) {
        this.stationsoftrainByIdDepartureStation = stationsoftrainByIdDepartureStation;
    }

    @ManyToOne
    @JoinColumn(name = "idArriveStation", referencedColumnName = "idStationOfTrain")
    public Stationsoftrain getStationsoftrainByIdArriveStation() {
        return stationsoftrainByIdArriveStation;
    }

    public void setStationsoftrainByIdArriveStation(Stationsoftrain stationsoftrainByIdArriveStation) {
        this.stationsoftrainByIdArriveStation = stationsoftrainByIdArriveStation;
    }

    @ManyToOne
    @JoinColumn(name = "idTrain", referencedColumnName = "idTrain")
    public Trains getTrainsByIdTrain() {
        return trainsByIdTrain;
    }

    public void setTrainsByIdTrain(Trains trainsByIdTrain) {
        this.trainsByIdTrain = trainsByIdTrain;
    }
}
