package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Stations {
    private int idStation;
    private String name;
    private Collection<Stationsoftrain> stationsoftrainsByIdStation;

    @Id
    @Column(name = "idStation", nullable = false)
    public int getIdStation() {
        return idStation;
    }

    public void setIdStation(int idStation) {
        this.idStation = idStation;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stations stations = (Stations) o;

        if (idStation != stations.idStation) return false;
        if (name != null ? !name.equals(stations.name) : stations.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idStation;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "stationsByIdStation")
    public Collection<Stationsoftrain> getStationsoftrainsByIdStation() {
        return stationsoftrainsByIdStation;
    }

    public void setStationsoftrainsByIdStation(Collection<Stationsoftrain> stationsoftrainsByIdStation) {
        this.stationsoftrainsByIdStation = stationsoftrainsByIdStation;
    }
}
