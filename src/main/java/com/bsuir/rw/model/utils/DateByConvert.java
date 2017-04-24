package com.bsuir.rw.model.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by USER on 23.04.2017.
 */
public class DateByConvert implements DateGetting {
    @Override
    public Date returnDate(int days, Date curDat, String date) {
        SimpleDateFormat format = new SimpleDateFormat();
        format.applyPattern("yyyy-MM-dd");
        Date docDate=null;
        try {
            docDate= format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return  docDate;
    }
}
