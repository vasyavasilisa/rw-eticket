package com.bsuir.rw.beans;

/**
 * Created by USER on 13.04.2017.
 */
public class PlacesBean {

    private int idPlace;
    private int number;
    private String status;
    private String type;
    private double cost;


    public PlacesBean() {
    }

    public PlacesBean(int idPlace, int number, String status, String type, double cost) {
        this.idPlace = idPlace;
        this.number = number;
        this.status = status;
        this.type = type;
        this.cost = cost;
    }

    public int getIdPlace() {
        return idPlace;
    }

    public void setIdPlace(int idPlace) {
        this.idPlace = idPlace;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
