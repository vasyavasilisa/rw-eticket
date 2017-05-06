package com.bsuir.rw.utils;

import java.util.Date;

/**
 * Created by USER on 23.04.2017.
 */
public class Context  {
    private DateGetting dateGetting;

    public Context(DateGetting algorithm) {
        this.dateGetting = algorithm;
    }

    public void setAlgorithm(DateGetting algorithm) {
        this.dateGetting = algorithm;
    }

    public Date returnDate(int days, Date curDate, String strdate) {
        return dateGetting.returnDate(days,curDate,strdate);
    }

}
