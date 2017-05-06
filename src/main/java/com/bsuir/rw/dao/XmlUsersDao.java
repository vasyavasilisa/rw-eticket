package com.bsuir.rw.dao;

import com.bsuir.rw.model.domain.Feaadback;
import com.bsuir.rw.model.domain.Users;

import java.util.List;

/**
 * Created by USER on 12.04.2017.
 */
public class XmlUsersDao implements UsersDao{

    public XmlUsersDao() {
        super();
    }

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
    public Users findUser(Users ob) {
        return null;
    }

    @Override
    public void saveFeedBackForUser(Feaadback ob) {

    }

    @Override
    public List<Feaadback> getFeedBacks() {
        return null;
    }

    @Override
    public List<Users> getAllUsers() {
        return null;
    }

    @Override
    public Users getUserById(int id) {
        return null;
    }
}
