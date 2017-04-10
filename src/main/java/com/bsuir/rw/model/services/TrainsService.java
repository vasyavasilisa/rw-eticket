package com.bsuir.rw.model.services;




import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.dao.TrainsDao;
import com.bsuir.rw.model.dao.TrainsDaoImpl;
import com.bsuir.rw.model.dao.factory.DAOFactory;
import com.bsuir.rw.model.beans.CarriagesBean;
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


}
