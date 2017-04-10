package com.bsuir.rw.beans;

import java.io.Serializable;

/**
 * Created by USER on 10.04.2017.
 */
public class Train{

   // private static final long serialVersionUID = 1L;


    private String department;
    private String arrive;
    private String date;


    public Train() {

    }

    public Train(String department, String arrive, String date) {
        this.department = department;
        this.arrive = arrive;
        this.date = date;
    }



    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getArrive() {
        return arrive;
    }

    public void setArrive(String arrive) {
        this.arrive = arrive;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
