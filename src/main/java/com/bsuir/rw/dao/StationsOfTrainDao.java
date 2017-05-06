package com.bsuir.rw.dao;





import com.bsuir.rw.beans.StationsOfTrainBean;
import com.bsuir.rw.model.domain.Stationsoftrain;

import java.util.List;

/**
 * Created by USER on 27.03.2017.
 */
public interface StationsOfTrainDao {

    public void insert(Stationsoftrain ob);
    public void update(Stationsoftrain ob);
    public void delete(Stationsoftrain ob);
    public List<StationsOfTrainBean> loadStationsForTrain(String ahref);
    public List<StationsOfTrainBean> loadAllStationsOfTrain();
}
