package com.bsuir.rw.beans;

/**
 * Created by USER on 31.03.2017.
 */
public class TrainsBean {

    private String number;
    private String nameTrain;
    private int  idTrain;
    private String timeDeparture;
    private String timeArrive;
    private String travelTime;
    private int numberOfAvailSeats;


    public TrainsBean() {

    }


    public TrainsBean(String number, String nameTrain, int idTrain, String timeDeparture, String timeArrive, String travelTime, int numberOfAvailSeats) {
        this.number = number;
        this.nameTrain = nameTrain;
        this.idTrain = idTrain;
        this.timeDeparture = timeDeparture;
        this.timeArrive = timeArrive;
        this.travelTime = travelTime;
        this.numberOfAvailSeats = numberOfAvailSeats;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getNameTrain() {
        return nameTrain;
    }

    public void setNameTrain(String nameTrain) {
        this.nameTrain = nameTrain;
    }

    public int getIdTrain() {
        return idTrain;
    }

    public void setIdTrain(int idTrain) {
        this.idTrain = idTrain;
    }

    public String getTimeDeparture() {
        return timeDeparture;
    }

    public void setTimeDeparture(String timeDeparture) {
        this.timeDeparture = timeDeparture;
    }

    public String getTimeArrive() {
        return timeArrive;
    }

    public void setTimeArrive(String timeArrive) {
        this.timeArrive = timeArrive;
    }

    public String getTravelTime() {
        return travelTime;
    }

    public void setTravelTime(String travelTime) {
        this.travelTime = travelTime;
    }

    public int getNumberOfAvailSeats() {
        return numberOfAvailSeats;
    }

    public void setNumberOfAvailSeats(int numberOfAvailSeats) {
        this.numberOfAvailSeats = numberOfAvailSeats;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TrainsBean that = (TrainsBean) o;

        if (idTrain != that.idTrain) return false;
        if (numberOfAvailSeats != that.numberOfAvailSeats) return false;
        if (!number.equals(that.number)) return false;
        if (!nameTrain.equals(that.nameTrain)) return false;
        if (!timeDeparture.equals(that.timeDeparture)) return false;
        if (!timeArrive.equals(that.timeArrive)) return false;
        return travelTime.equals(that.travelTime);

    }

    @Override
    public int hashCode() {
        int result = number.hashCode();
        result = 31 * result + nameTrain.hashCode();
        result = 31 * result + idTrain;
        result = 31 * result + timeDeparture.hashCode();
        result = 31 * result + timeArrive.hashCode();
        result = 31 * result + travelTime.hashCode();
        result = 31 * result + numberOfAvailSeats;
        return result;
    }

    @Override
    public String toString() {
        return "TrainsBean{" +
                "number='" + number + '\'' +
                ", nameTrain='" + nameTrain + '\'' +
                ", idTrain=" + idTrain +
                ", timeDeparture='" + timeDeparture + '\'' +
                ", timeArrive='" + timeArrive + '\'' +
                ", travelTime='" + travelTime + '\'' +
                ", numberOfAvailSeats=" + numberOfAvailSeats +
                '}';
    }
}
