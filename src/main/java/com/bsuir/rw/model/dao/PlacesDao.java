package com.bsuir.rw.model.dao;

import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.domain.Places;
import com.bsuir.rw.model.domain.Trains;

import java.util.List;

/**
 * Created by USER on 15.04.2017.
 */
public interface PlacesDao {
    public void insert(Places ob);
    public void update(Places ob);
    public void delete(Places ob);

    public Places loadPlaceById(int id);

}
