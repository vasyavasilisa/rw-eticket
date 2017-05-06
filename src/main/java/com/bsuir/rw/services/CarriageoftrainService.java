package com.bsuir.rw.services;

import com.bsuir.rw.beans.PlacesBean;
import com.bsuir.rw.dao.CarriageoftrainDao;
import com.bsuir.rw.dao.factory.DAOFactory;
import com.bsuir.rw.model.domain.Carriageoftrain;

import java.util.List;

/**
 * Created by USER on 13.04.2017.
 */
public class CarriageoftrainService {

    public Carriageoftrain getCarriageoftrain(int id) {
        CarriageoftrainDao dao = DAOFactory.getFactory().getCarriageostrainDao();
        Carriageoftrain entity = dao.findCarriageById(id);
        return entity;
    }

    public List<PlacesBean> getPlacesForCarriage(int idCarriage,int idTrain,String departure,String arrive) {
        CarriageoftrainDao dao = DAOFactory.getFactory().getCarriageostrainDao();
        List<PlacesBean> places = dao.findPlacesForCarriage(idCarriage,idTrain,departure,arrive);
        return places;
    }
}
