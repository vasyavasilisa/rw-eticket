package com.bsuir.rw.model.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by USER on 15.04.2017.
 */
public final class DateUtil {

    private DateUtil(){};

   /* public static Date changeDateByAddDays(int days,Date curDate,String date){
        Calendar instance = Calendar.getInstance();
        instance.setTime(curDate);
        instance.add(Calendar.DAY_OF_MONTH, days);
        Date newDate = instance.getTime();
        return newDate;
    }

    public static Date converStringToDate(int days,Date curDate,String date){
        SimpleDateFormat format = new SimpleDateFormat();
        format.applyPattern("yyyy-MM-dd");
        Date docDate=null;
        try {
            docDate= format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return  docDate;
    }*/

    public static boolean isPassed(Date date){
        Date curDate= new Date();
        return date.getTime()<curDate.getTime();
    }
}
