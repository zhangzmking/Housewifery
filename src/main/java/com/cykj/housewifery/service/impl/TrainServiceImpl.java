package com.cykj.housewifery.service.impl;

import com.cykj.housewifery.bean.LayuiJson;
import com.cykj.housewifery.bean.ServiceType;
import com.cykj.housewifery.bean.Train;
import com.cykj.housewifery.mapper.TrainMapper;
import com.cykj.housewifery.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("trainService")
public class TrainServiceImpl implements TrainService {

    @Autowired
    private TrainMapper trainMapper;


    @Override
    public int getTrainCount() {
        int trainCount=trainMapper.getTrainCount();
        return trainCount;
    }

    @Override
    public List<Train> selTrain(Integer pageNum, String limit) {
        LayuiJson layuiJson = new LayuiJson();
        layuiJson.setPageNum(pageNum);
        layuiJson.setLimit(Integer.valueOf(limit));
        List<Train> list = trainMapper.selTrain(layuiJson);
        return list;
    }

    @Override
    public Train findTrainById(String id) {
        Train train=trainMapper.findTrainById(id);
        return train;
    }

    @Override
    public boolean updateTrain(Train train) {
        int a=trainMapper.updateTrain(train);
        return a>0;
    }

    @Override
    public boolean addTrain(Train train) {
       int a=trainMapper.addTrain(train);
       return a>0;
    }

    @Override
    public boolean delTrain(String id) {
        int a=trainMapper.delTrain(id);
        return a>0;
    }
}
