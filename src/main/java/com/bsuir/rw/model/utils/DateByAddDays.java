package com.bsuir.rw.model.utils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by USER on 23.04.2017.
 */
public class DateByAddDays implements  DateGetting {
    @Override
    public Date returnDate(int days, Date curDate, String date) {
        Calendar instance = Calendar.getInstance();
        instance.setTime(curDate);
        instance.add(Calendar.DAY_OF_MONTH, days);
        Date newDate = instance.getTime();
        return newDate;
    }
}
