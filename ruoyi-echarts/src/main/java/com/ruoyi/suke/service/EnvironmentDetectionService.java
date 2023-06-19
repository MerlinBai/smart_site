package com.ruoyi.suke.service;

import com.ruoyi.suke.pojo.EnvironmentDetection;

import java.util.Date;
import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-30 17:57
 */
public interface EnvironmentDetectionService {
    /**
     * 获取时间列表
     * */
    List<Date> getCheckTime();

    /**
     * 根据时间获取当前风速
     * */
    List<Integer> getWindSpeed(List<Date> dateList);

    /**
     * 根据时间获取当前温度
     * */
    List<Double> getTemperature(List<Date> dateList);

    /**
     * 根据时间获取当前湿度
     * */
    List<Double> getHumidity(List<Date> dateList);

    /**
     * 根据时间获取当前PM2.5
     * */
    List<Double> getPM25(List<Date> dateList);

    /**
     * 获取环境质量数据
     * */
    List<EnvironmentDetection> getEnvironmentDetection();
}
