package com.bsuir.rw.services;

import com.bsuir.rw.dao.FeedBackDao;
import com.bsuir.rw.dao.FeedBackDaoImpl;
import com.bsuir.rw.model.domain.Feaadback;

/**
 * Created by USER on 04.05.2017.
 */
public class FeedBackService {

    public void deleteFeedBackById(Feaadback ob){
        FeedBackDao dao= new FeedBackDaoImpl();
        dao.delete(ob);
    }
}
