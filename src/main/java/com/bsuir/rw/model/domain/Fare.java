package com.bsuir.rw.model.domain;

import javax.persistence.*;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Fare {
    private int idFare;
    private Integer idRout;
    private Double price;
    private Integer idTrain;
    private Integer idPlace;
    private Trainrouts trainroutsByIdRout;
    private Places placesByIdPlace;

    @Id
    @Column(name = "idFare", nullable = false)
    public int getIdFare() {
        return idFare;
    }

    public void setIdFare(int idFare) {
        this.idFare = idFare;
    }

    @Basic
    @Column(name = "idRout", nullable = true, insertable = false, updatable = false)
    public Integer getIdRout() {
        return idRout;
    }

    public void setIdRout(Integer idRout) {
        this.idRout = idRout;
    }

    @Basic
    @Column(name = "price", nullable = true, precision = 2)
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
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
    @Column(name = "idPlace", nullable = true, insertable = false, updatable = false)
    public Integer getIdPlace() {
        return idPlace;
    }

    public void setIdPlace(Integer idPlace) {
        this.idPlace = idPlace;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Fare fare = (Fare) o;

        if (idFare != fare.idFare) return false;
        if (idRout != null ? !idRout.equals(fare.idRout) : fare.idRout != null) return false;
        if (price != null ? !price.equals(fare.price) : fare.price != null) return false;
        if (idTrain != null ? !idTrain.equals(fare.idTrain) : fare.idTrain != null) return false;
        if (idPlace != null ? !idPlace.equals(fare.idPlace) : fare.idPlace != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idFare;
        result = 31 * result + (idRout != null ? idRout.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (idTrain != null ? idTrain.hashCode() : 0);
        result = 31 * result + (idPlace != null ? idPlace.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "idRout", referencedColumnName = "idRout")
    public Trainrouts getTrainroutsByIdRout() {
        return trainroutsByIdRout;
    }

    public void setTrainroutsByIdRout(Trainrouts trainroutsByIdRout) {
        this.trainroutsByIdRout = trainroutsByIdRout;
    }

    @ManyToOne
    @JoinColumn(name = "idPlace", referencedColumnName = "idPlace")
    public Places getPlacesByIdPlace() {
        return placesByIdPlace;
    }

    public void setPlacesByIdPlace(Places placesByIdPlace) {
        this.placesByIdPlace = placesByIdPlace;
    }
}
