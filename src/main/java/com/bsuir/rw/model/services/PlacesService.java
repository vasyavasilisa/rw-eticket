package com.bsuir.rw.model.services;

import com.bsuir.rw.model.beans.PlacesBean;
import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.dao.PlacesDao;
import com.bsuir.rw.model.dao.factory.DAOFactory;
import com.bsuir.rw.model.domain.Places;

/**
 * Created by USER on 15.04.2017.
 */
public class PlacesService {


    public PlacesBean convertToPlacesBean(Places entity){
        PlacesBean bean= new PlacesBean();
        bean.setIdPlace(entity.getIdPlace());
        bean.setNumber(entity.getNumber());
        bean.setStatus(entity.getStatus());
        bean.setType(entity.getType());
        return  bean;
    }


    public PlacesBean getPlaceById(int id) {
        PlacesDao dao = DAOFactory.getFactory().getPlacesDao();
        Places entity = dao.loadPlaceById(id);
        return convertToPlacesBean(entity);
    }


}
