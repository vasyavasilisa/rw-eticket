
package com.bsuir.rw.model.dao;




import com.bsuir.rw.model.beans.TrainsBean;
import org.springframework.stereotype.Component;
import com.bsuir.rw.model.domain.Trains;

import java.util.List;

/**
 * Created by USER on 27.03.2017.
 */

@Component
public interface TrainsDao {

    public void insert(Trains ob);
    public void update(Trains ob);
    public void delete(Trains ob);

    public List<TrainsBean> loadTrainsByDateStations(String date, String stationDep, String stationArr);

    public boolean isRoutExist(String date, String stationDep, String stationArr);
    public List<TrainsBean> loadTrainsOrderByTimeDep(String date, String stationDep, String stationArr);
    public List<Trains> loadInformationForTrain(int id);
}
