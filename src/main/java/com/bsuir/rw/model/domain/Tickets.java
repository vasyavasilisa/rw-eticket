package com.bsuir.rw.model.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 * Created by USER on 10.04.2017.
 */
@Entity
public class Tickets {
    private int idTicket;
    private Integer idUser;
    private String ticketNumber;
    private String rout;
    private String dateDeparture;
    private String timeDeparture;
    private String timeArrive;
    private String trainNumber;
    private int carriageNumber;
    private int placeNumber;
    private double price;
    private String status;
    private String datetimeCreation;
    private String datetimeCancel;
    private String passangerSurname;
    private String passangerName;
    private String passportNumber;
    private Integer idFare;
    private Users usersByIdUser;

    @Id
    @Column(name = "idTicket", nullable = false)
    public int getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(int idTicket) {
        this.idTicket = idTicket;
    }

    @Basic
    @Column(name = "idUser", nullable = true, insertable = false, updatable = false)
    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    @Basic
    @Column(name = "ticketNumber", nullable = false, length = 255)
    public String getTicketNumber() {
        return ticketNumber;
    }

    public void setTicketNumber(String ticketNumber) {
        this.ticketNumber = ticketNumber;
    }

    @Basic
    @Column(name = "rout", nullable = false, length = 255)
    public String getRout() {
        return rout;
    }

    public void setRout(String rout) {
        this.rout = rout;
    }

    @Basic
    @Column(name = "dateDeparture", nullable = false)
    public String getDateDeparture() {
        return dateDeparture;
    }

    public void setDateDeparture(String dateDeparture) {
        this.dateDeparture = dateDeparture;
    }

    @Basic
    @Column(name = "timeDeparture", nullable = false)
    public String getTimeDeparture() {
        return timeDeparture;
    }

    public void setTimeDeparture(String timeDeparture) {
        this.timeDeparture = timeDeparture;
    }

    @Basic
    @Column(name = "timeArrive", nullable = false)
    public String getTimeArrive() {
        return timeArrive;
    }

    public void setTimeArrive(String timeArrive) {
        this.timeArrive = timeArrive;
    }

    @Basic
    @Column(name = "trainNumber", nullable = false, length = 255)
    public String getTrainNumber() {
        return trainNumber;
    }

    public void setTrainNumber(String trainNumber) {
        this.trainNumber = trainNumber;
    }

    @Basic
    @Column(name = "carriageNumber", nullable = false)
    public int getCarriageNumber() {
        return carriageNumber;
    }

    public void setCarriageNumber(int carriageNumber) {
        this.carriageNumber = carriageNumber;
    }

    @Basic
    @Column(name = "placeNumber", nullable = false)
    public int getPlaceNumber() {
        return placeNumber;
    }

    public void setPlaceNumber(int placeNumber) {
        this.placeNumber = placeNumber;
    }

    @Basic
    @Column(name = "price", nullable = false, precision = 2)
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "status", nullable = false, length = 255)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "datetimeCreation", nullable = false)
    public String getDatetimeCreation() {
        return datetimeCreation;
    }

    public void setDatetimeCreation(String datetimeCreation) {
        this.datetimeCreation = datetimeCreation;
    }

    @Basic
    @Column(name = "datetimeCancel", nullable = false)
    public String getDatetimeCancel() {
        return datetimeCancel;
    }

    public void setDatetimeCancel(String datetimeCancel) {
        this.datetimeCancel = datetimeCancel;
    }

    @Basic
    @Column(name = "passangerSurname", nullable = false, length = 255)
    public String getPassangerSurname() {
        return passangerSurname;
    }

    public void setPassangerSurname(String passangerSurname) {
        this.passangerSurname = passangerSurname;
    }

    @Basic
    @Column(name = "passangerName", nullable = false, length = 255)
    public String getPassangerName() {
        return passangerName;
    }

    public void setPassangerName(String passangerName) {
        this.passangerName = passangerName;
    }

    @Basic
    @Column(name = "passportNumber", nullable = false, length = 255)
    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    @Basic
    @Column(name = "idFare", nullable = true)
    public Integer getIdFare() {
        return idFare;
    }

    public void setIdFare(Integer idFare) {
        this.idFare = idFare;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tickets tickets = (Tickets) o;

        if (idTicket != tickets.idTicket) return false;
        if (carriageNumber != tickets.carriageNumber) return false;
        if (placeNumber != tickets.placeNumber) return false;
        if (Double.compare(tickets.price, price) != 0) return false;
        if (idUser != null ? !idUser.equals(tickets.idUser) : tickets.idUser != null) return false;
        if (ticketNumber != null ? !ticketNumber.equals(tickets.ticketNumber) : tickets.ticketNumber != null)
            return false;
        if (rout != null ? !rout.equals(tickets.rout) : tickets.rout != null) return false;
        if (dateDeparture != null ? !dateDeparture.equals(tickets.dateDeparture) : tickets.dateDeparture != null)
            return false;
        if (timeDeparture != null ? !timeDeparture.equals(tickets.timeDeparture) : tickets.timeDeparture != null)
            return false;
        if (timeArrive != null ? !timeArrive.equals(tickets.timeArrive) : tickets.timeArrive != null) return false;
        if (trainNumber != null ? !trainNumber.equals(tickets.trainNumber) : tickets.trainNumber != null) return false;
        if (status != null ? !status.equals(tickets.status) : tickets.status != null) return false;
        if (datetimeCreation != null ? !datetimeCreation.equals(tickets.datetimeCreation) : tickets.datetimeCreation != null)
            return false;
        if (datetimeCancel != null ? !datetimeCancel.equals(tickets.datetimeCancel) : tickets.datetimeCancel != null)
            return false;
        if (passangerSurname != null ? !passangerSurname.equals(tickets.passangerSurname) : tickets.passangerSurname != null)
            return false;
        if (passangerName != null ? !passangerName.equals(tickets.passangerName) : tickets.passangerName != null)
            return false;
        if (passportNumber != null ? !passportNumber.equals(tickets.passportNumber) : tickets.passportNumber != null)
            return false;
        if (idFare != null ? !idFare.equals(tickets.idFare) : tickets.idFare != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = idTicket;
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        result = 31 * result + (ticketNumber != null ? ticketNumber.hashCode() : 0);
        result = 31 * result + (rout != null ? rout.hashCode() : 0);
        result = 31 * result + (dateDeparture != null ? dateDeparture.hashCode() : 0);
        result = 31 * result + (timeDeparture != null ? timeDeparture.hashCode() : 0);
        result = 31 * result + (timeArrive != null ? timeArrive.hashCode() : 0);
        result = 31 * result + (trainNumber != null ? trainNumber.hashCode() : 0);
        result = 31 * result + carriageNumber;
        result = 31 * result + placeNumber;
        temp = Double.doubleToLongBits(price);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (datetimeCreation != null ? datetimeCreation.hashCode() : 0);
        result = 31 * result + (datetimeCancel != null ? datetimeCancel.hashCode() : 0);
        result = 31 * result + (passangerSurname != null ? passangerSurname.hashCode() : 0);
        result = 31 * result + (passangerName != null ? passangerName.hashCode() : 0);
        result = 31 * result + (passportNumber != null ? passportNumber.hashCode() : 0);
        result = 31 * result + (idFare != null ? idFare.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "idUser", referencedColumnName = "idUser")
    public Users getUsersByIdUser() {
        return usersByIdUser;
    }

    public void setUsersByIdUser(Users usersByIdUser) {
        this.usersByIdUser = usersByIdUser;
    }
}
