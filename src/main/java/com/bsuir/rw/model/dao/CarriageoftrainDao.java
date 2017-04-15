package com.bsuir.rw.model.dao;

import com.bsuir.rw.model.beans.PlacesBean;
import com.bsuir.rw.model.domain.Carriage;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Users;

import java.util.List;

/**
 * Created by USER on 13.04.2017.
 */
public interface CarriageoftrainDao {

    public boolean insert(Users ob);
    public void update(Users ob);
    public void delete(Users ob);

    public Carriageoftrain findCarriageById(int id);
    public List<PlacesBean> findPlacesForCarriage(int idCarriage, int idTrain, String departure, String arrive);

}
