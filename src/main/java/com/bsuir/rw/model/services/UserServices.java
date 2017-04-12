package com.bsuir.rw.model.services;

import com.bsuir.rw.model.beans.CarriagesBean;
import com.bsuir.rw.model.dao.TrainsDao;
import com.bsuir.rw.model.dao.UsersDao;
import com.bsuir.rw.model.dao.factory.DAOFactory;
import com.bsuir.rw.model.domain.Trains;
import com.bsuir.rw.model.domain.Users;

import java.util.List;

/**
 * Created by USER on 12.04.2017.
 */
public class UserServices {

    private static final int MAX = 500;

    public UserServices(){
    }

    public  double generateBalance(){
        return Math.random() * MAX;
    }

    public boolean createUser(Users entity){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        dao.insert(entity);
        return true;
    }
}
