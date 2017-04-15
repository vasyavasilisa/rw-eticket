package com.bsuir.rw.model.services;

import com.bsuir.rw.model.beans.PlacesBean;
import com.bsuir.rw.model.beans.StationsOfTrainBean;
import com.bsuir.rw.model.dao.CarriageoftrainDao;
import com.bsuir.rw.model.dao.CarriageoftrainDaoImpl;
import com.bsuir.rw.model.dao.StationsOfTrainDao;
import com.bsuir.rw.model.dao.StationsOfTrainDaoImpl;
import com.bsuir.rw.model.dao.factory.DAOFactory;
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
