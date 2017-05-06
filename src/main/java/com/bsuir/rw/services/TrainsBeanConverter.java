package com.bsuir.rw.services;

import com.bsuir.rw.beans.TrainsBean;
import com.bsuir.rw.model.domain.Trains;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 03.05.2017.
 */
public class TrainsBeanConverter {


    public static List<TrainsBean> transformToTrainsBean(List<Trains> entities) {
        List<TrainsBean> result = new ArrayList<>();

        for (Trains entity : entities) {

                TrainsBean bean= new TrainsBean();
                bean.setIdTrain(entity.getIdTrain());
                bean.setNumber(entity.getNumber());
                bean.setNameTrain(entity.getNameTrain());
                result.add(bean);
            }

        return result;
    }
}
