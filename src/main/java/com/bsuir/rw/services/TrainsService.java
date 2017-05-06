package com.bsuir.rw.services;




import com.bsuir.rw.beans.TrainsBean;
import com.bsuir.rw.dao.TrainsDao;
import com.bsuir.rw.dao.TrainsDaoImpl;
import com.bsuir.rw.dao.factory.DAOFactory;
import com.bsuir.rw.beans.CarriagesBean;
import com.bsuir.rw.model.domain.Trains;

import java.util.List;

/**
 * Created by USER on 31.03.2017.
 */
public class TrainsService {

    public List<TrainsBean> getAllTrainsByDateStations(String date, String stationDep, String stationArr) {
       // ApplicationContext context= new ClassPathXmlApplicationContext("context.xml");
       // TrainsDaoImpl t1000= (TrainsDaoImpl)context.getBean("trainsDaoImpl");
        TrainsDao dao = new TrainsDaoImpl();
        List<TrainsBean> beans = dao.loadTrainsByDateStations(date, stationDep,stationArr);
        return beans;
    }

    public List<TrainsBean> getTrainsOrderByTimeDep(String date, String stationDep, String stationArr) {
        TrainsDao dao = new TrainsDaoImpl();
        List<TrainsBean> beans = dao.loadTrainsOrderByTimeDep(date, stationDep,stationArr);
        return beans;
    }

    public boolean isRoutExist(String date, String stationDep, String stationArr) {
        TrainsDao dao = new TrainsDaoImpl();
        boolean result = dao.isRoutExist(date, stationDep,stationArr);
        return result;
    }

    public List<CarriagesBean> getCarriagesForTrain(int id) {
        TrainsDao dao = DAOFactory.getFactory().getTrainsDao();
        List<Trains> entitys = dao.loadInformationForTrain(id);
        List<CarriagesBean> beans = CarriagesBeanConverter.transformToCarriageBean(entitys);
        return beans;
    }

    public TrainsBean getParamForTicket(int id,String dep, String arr) {
        TrainsDao dao = DAOFactory.getFactory().getTrainsDao();
        TrainsBean bean = dao.loadParamForTicket(id,dep,arr);
        return bean;
    }

    public List<TrainsBean> getAllTrais() {
        TrainsDao dao = DAOFactory.getFactory().getTrainsDao();
        List<Trains> list = dao.loadAllTrains();
        List<TrainsBean> beans = TrainsBeanConverter.transformToTrainsBean(list);
        return beans;
    }

    public void daleteTrain(Trains ob) {
        TrainsDao dao = DAOFactory.getFactory().getTrainsDao();
        dao.delete(ob);
    }

    public void addTrain(Trains ob){
        TrainsDao dao = DAOFactory.getFactory().getTrainsDao();
        dao.insert(ob);
    }

    public Trains getTrainByNumber(String name){
        TrainsDao dao = DAOFactory.getFactory().getTrainsDao();
        Trains train=dao.getTrainByNumber(name);
        return train;
    }

}
