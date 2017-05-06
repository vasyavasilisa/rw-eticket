package com.bsuir.rw.beans;

/**
 * Created by USER on 31.03.2017.
 */
public class StationsOfTrainBean {

    private String numberTrain;
    private String name;
    private String timeDeparture;
    private String timeArrive;
    private String timeStanding;
    private String distance;

    public StationsOfTrainBean() {
       ;
    }

    public StationsOfTrainBean(String numberTrain, String name, String timeDeparture, String timeArrive, String timeStanding, String distance) {
        this.numberTrain = numberTrain;
        this.name = name;
        this.timeDeparture = timeDeparture;
        this.timeArrive = timeArrive;
        this.timeStanding = timeStanding;
        this.distance = distance;
    }

    public String getNumberTrain() {
        return numberTrain;
    }

    public void setNumberTrain(String numberTrain) {
        this.numberTrain = numberTrain;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getTimeStanding() {
        return timeStanding;
    }

    public void setTimeStanding(String timeStanding) {
        this.timeStanding = timeStanding;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StationsOfTrainBean that = (StationsOfTrainBean) o;

        if (!numberTrain.equals(that.numberTrain)) return false;
        if (!name.equals(that.name)) return false;
        if (!timeDeparture.equals(that.timeDeparture)) return false;
        if (!timeArrive.equals(that.timeArrive)) return false;
        if (!timeStanding.equals(that.timeStanding)) return false;
        return distance.equals(that.distance);

    }

    @Override
    public int hashCode() {
        int result = numberTrain.hashCode();
        result = 31 * result + name.hashCode();
        result = 31 * result + timeDeparture.hashCode();
        result = 31 * result + timeArrive.hashCode();
        result = 31 * result + timeStanding.hashCode();
        result = 31 * result + distance.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "StationsOfTrainBean{" +
                "numberTrain='" + numberTrain + '\'' +
                ", name='" + name + '\'' +
                ", timeDeparture='" + timeDeparture + '\'' +
                ", timeArrive='" + timeArrive + '\'' +
                ", timeStanding='" + timeStanding + '\'' +
                ", distance='" + distance + '\'' +
                '}';
    }
}
