package com.ruoyi.suke.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.suke.pojo.EnvironmentDetection;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-30 17:59
 */
@Mapper
@Repository
public interface EnvironmentDetectionDao extends BaseMapper<EnvironmentDetection> {
    /**
     * 获取检测时间列表
     * */
    ArrayList<Date> getCheckTime();

    /**
     * 根据检测时间列表获取风速
     * */
    Integer getWindSpeedByCheckTime(Date date);

    /**
     * 根据检测时间列表获取温度
     * */
    Double getTemperatureByCheckTime(Date date);

    /**
     * 根据检测时间列表获取湿度
     * */
    Double getHumidityByCheckTime(Date date);

    /**
     * 根据检测时间列表获取PM2.5
     * */
    Double getPM25ByCheckTime(Date date);

    /**
     * 获取环境质量数据
     * */
    ArrayList<EnvironmentDetection> getEnvironmentDetection();

    /**
     * 获取每月最高温度
     * */
    Double getMaxTemMonth();

    /**
     * 获取每月最低温度
     * */
    Double getMinTemMonth();
}
