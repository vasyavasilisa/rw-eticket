package com.bsuir.rw.model.beans;

import java.io.Serializable;

/**
 * Created by USER on 03.04.2017.
 */
public class CarriagesBean implements Serializable{

    private static final long serialVersionUID = 1L;

    private int idCarriage;
    private int number;
    private int countAvailableseats;

    public CarriagesBean() {

    }

    public CarriagesBean(int idCarriage, int number, int countAvailableseats) {
        this.idCarriage = idCarriage;
        this.number = number;
        this.countAvailableseats = countAvailableseats;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getIdCarriage() {
        return idCarriage;
    }

    public void setIdCarriage(int idCarriage) {
        this.idCarriage = idCarriage;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getCountAvailableseats() {
        return countAvailableseats;
    }

    public void setCountAvailableseats(int countAvailableseats) {
        this.countAvailableseats = countAvailableseats;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CarriagesBean that = (CarriagesBean) o;

        if (idCarriage != that.idCarriage) return false;
        if (number != that.number) return false;
        return countAvailableseats == that.countAvailableseats;

    }

    @Override
    public int hashCode() {
        int result = idCarriage;
        result = 31 * result + number;
        result = 31 * result + countAvailableseats;
        return result;
    }

    @Override
    public String toString() {
        return "CarriagesBean{" +
                "idCarriage=" + idCarriage +
                ", number=" + number +
                ", countAvailableseats=" + countAvailableseats +
                '}';
    }
}
