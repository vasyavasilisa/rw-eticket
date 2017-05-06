package com.bsuir.rw.dao;




import com.bsuir.rw.model.domain.Feaadback;
import com.bsuir.rw.model.domain.Users;

import java.util.List;


/**
 * Created by USER on 12.04.2017.
 */
public interface UsersDao {
    public boolean insert(Users ob);
    public void update(Users ob);
    public void delete(Users ob);

    public Users findUser(Users ob);
    public void saveFeedBackForUser(Feaadback ob);
    public List<Feaadback>  getFeedBacks();
    public List<Users> getAllUsers();
    public Users getUserById(int id);

}
