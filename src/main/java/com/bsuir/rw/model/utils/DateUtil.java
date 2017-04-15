package com.bsuir.rw.model.utils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by USER on 15.04.2017.
 */
public final class DateUtil {

    private DateUtil(){};

    public static Date changeDateByAddDays(int days,Date curDate){
        Calendar instance = Calendar.getInstance();
        instance.setTime(curDate); //устанавливаем дату, с которой будет производить операции
        instance.add(Calendar.DAY_OF_MONTH, days);// прибавляем 3 дня к установленной дате
        Date newDate = instance.getTime(); //
        return newDate;
    }
}
