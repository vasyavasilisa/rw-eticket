package com.bsuir.rw.model.services;





import com.bsuir.rw.model.beans.CarriagesBean;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Places;
import com.bsuir.rw.model.domain.Trains;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 03.04.2017.
 */
public class CarriagesBeanConverter {

    public CarriagesBeanConverter() {
        throw new AssertionError("Class contains static methods only. You should not instantiate it!");
    }



    public static List<CarriagesBean> transformToCarriageBean(List<Trains> entities) {
        List<CarriagesBean> result = new ArrayList<CarriagesBean>();

        for (Trains entity : entities) {

            for(Carriageoftrain car: entity.getCarriageoftrainsByIdTrain()){
                CarriagesBean bean= new CarriagesBean();
                bean.setIdCarriage(car.getIdCarriageOfTrain());
                bean.setNumber(car.getNumber());
                int count=0;
                for(Places pl:car.getPlacesByIdCarriageOfTrain()){
                    if(pl.getStatus().equals("свободно")){
                        count++;
                    }
                }
                bean.setCountAvailableseats(count);
                result.add(bean);
            }


        }

        return result;
    }
}
