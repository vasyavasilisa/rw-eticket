package com.bsuir.rw.beans;

/**
 * Created by USER on 04.05.2017.
 */
public class TicketBean {

    private String surname;
    private String name;
    private String passport;
    private int carrNum;
    private int placeNum;


    public TicketBean() {

    }

    public TicketBean(String surname, String name, String passport, int carrNum, int placeNum) {
        this.surname = surname;
        this.name = name;
        this.passport = passport;
        this.carrNum = carrNum;
        this.placeNum = placeNum;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public int getCarrNum() {
        return carrNum;
    }

    public void setCarrNum(int carrNum) {
        this.carrNum = carrNum;
    }

    public int getPlaceNum() {
        return placeNum;
    }

    public void setPlaceNum(int placeNum) {
        this.placeNum = placeNum;
    }
}
