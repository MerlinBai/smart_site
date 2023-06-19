package com.ruoyi.suke.service.impl;

import com.ruoyi.suke.mapper.EnvironmentDetectionDao;
import com.ruoyi.suke.pojo.EnvironmentDetection;
import com.ruoyi.suke.service.EnvironmentDetectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-30 17:58
 */
@Service
public class EnvironmentDetectionServiceImpl implements EnvironmentDetectionService {
    @Autowired
    private EnvironmentDetectionDao environmentdetectiondao;

    @Override
    public ArrayList getCheckTime() {
        ArrayList<Date> list = environmentdetectiondao.getCheckTime();
        return list;
    }

    @Override
    public List<Integer> getWindSpeed(List<Date> dateList) {
        ArrayList<Integer> list = new ArrayList<>();
        //遍历每个检测时间，并根据检测时间查找对应的风速数据
        for (Date date : dateList ){
            Integer r = environmentdetectiondao.getWindSpeedByCheckTime(date);
            list.add(r);
        }
        return list;
    }

    @Override
    public List<Double> getTemperature(List<Date> dateList) {
        ArrayList<Double> list = new ArrayList<>();
        //遍历每个检测时间，并根据检测时间查找对应的温度数据
        for (Date date : dateList ){
            Double r = environmentdetectiondao.getTemperatureByCheckTime(date);
            list.add(r);
        }
        return list;
    }

    @Override
    public List<Double> getHumidity(List<Date> dateList) {
        ArrayList<Double> list = new ArrayList<>();
        //遍历每个检测时间，并根据检测时间查找对应的湿度数据
        for (Date date : dateList ){
            Double r = environmentdetectiondao.getHumidityByCheckTime(date);
            list.add(r);
        }
        return list;
    }

    @Override
    public List<Double> getPM25(List<Date> dateList) {
        ArrayList<Double> list = new ArrayList<>();
        //遍历每个检测时间，并根据检测时间查找对应的PM2.5数据
        for (Date date : dateList ){
            Double r = environmentdetectiondao.getPM25ByCheckTime(date);
            list.add(r);
        }
        return list;
    }

    /**
     * 获取环境质量数据
     * */
    @Override
    public ArrayList<EnvironmentDetection> getEnvironmentDetection() {
        ArrayList<EnvironmentDetection> list = environmentdetectiondao.getEnvironmentDetection();
        return list;
    }


}
