package com.bsuir.rw.model.dao;

import com.bsuir.rw.model.beans.PlacesBean;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Users;

import java.util.List;

/**
 * Created by USER on 26.04.2017.
 */
public class XmlCarriageoftrainDao implements CarriageoftrainDao {
    @Override
    public boolean insert(Users ob) {
        return false;
    }

    @Override
    public void update(Users ob) {

    }

    @Override
    public void delete(Users ob) {

    }

    @Override
    public Carriageoftrain findCarriageById(int id) {
        return null;
    }

    @Override
    public List<PlacesBean> findPlacesForCarriage(int idCarriage, int idTrain, String departure, String arrive) {
        return null;
    }
}
