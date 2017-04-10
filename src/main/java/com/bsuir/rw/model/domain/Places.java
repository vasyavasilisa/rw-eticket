package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Places {
    private int idPlace;
    private Integer number;
    private String type;
    private String status;
    private Integer idCarriage;
    private Collection<Fare> faresByIdPlace;
    private Carriageoftrain carriageoftrainByIdCarriage;

    @Id
    @Column(name = "idPlace", nullable = false)
    public int getIdPlace() {
        return idPlace;
    }

    public void setIdPlace(int idPlace) {
        this.idPlace = idPlace;
    }

    @Basic
    @Column(name = "number", nullable = true)
    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 255)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "status", nullable = true, length = 255)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "idCarriage", nullable = true, insertable = false, updatable = false)
    public Integer getIdCarriage() {
        return idCarriage;
    }

    public void setIdCarriage(Integer idCarriage) {
        this.idCarriage = idCarriage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Places places = (Places) o;

        if (idPlace != places.idPlace) return false;
        if (number != null ? !number.equals(places.number) : places.number != null) return false;
        if (type != null ? !type.equals(places.type) : places.type != null) return false;
        if (status != null ? !status.equals(places.status) : places.status != null) return false;
        if (idCarriage != null ? !idCarriage.equals(places.idCarriage) : places.idCarriage != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idPlace;
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (idCarriage != null ? idCarriage.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "placesByIdPlace")
    public Collection<Fare> getFaresByIdPlace() {
        return faresByIdPlace;
    }

    public void setFaresByIdPlace(Collection<Fare> faresByIdPlace) {
        this.faresByIdPlace = faresByIdPlace;
    }

    @ManyToOne
    @JoinColumn(name = "idCarriage", referencedColumnName = "idCarriageOfTrain")
    public Carriageoftrain getCarriageoftrainByIdCarriage() {
        return carriageoftrainByIdCarriage;
    }

    public void setCarriageoftrainByIdCarriage(Carriageoftrain carriageoftrainByIdCarriage) {
        this.carriageoftrainByIdCarriage = carriageoftrainByIdCarriage;
    }
}
