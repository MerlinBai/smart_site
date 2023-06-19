package com.ruoyi.web.controller.echarts;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.suke.pojo.EnvironmentDetection;
import com.ruoyi.suke.service.EnvironmentDetectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-30 17:04
 */

@Anonymous
@RestController
@RequestMapping("/environment")
@CrossOrigin
public class EnvironmentDetectionController {
    @Autowired
    private EnvironmentDetectionService environmentdetectionservice;

    /**
     * 获取风速情况
     * */
    @Anonymous
    @RequestMapping("/getwindspeedinfo")
    public Map getWindSpeedInfo(){
        Map map = new HashMap();
        List<String> times = new ArrayList<>();
        List<Date> dateList = environmentdetectionservice.getCheckTime();  //2022-06-03 09:15:39
        SimpleDateFormat simpledateformat = new SimpleDateFormat("MM-dd");
        for (Date date: dateList) {
            String format = simpledateformat.format(date);    //06-03
            times.add(format);
        }
        map.put("X",times);
        List<Integer> yValue = environmentdetectionservice.getWindSpeed(dateList);
        map.put("Y",yValue);
        return map;
    }

    /**
     * 获取温度情况
     * */
    @Anonymous
    @RequestMapping("/gettemperatureinfo")
    public Map getTemperatureInfo(){
        Map map = new HashMap();
        List<String> times = new ArrayList<>();
        List<Date> dateList = environmentdetectionservice.getCheckTime();  //2022-06-03 09:15:39
        SimpleDateFormat simpledateformat = new SimpleDateFormat("MM-dd");
        for (Date date: dateList) {
            String format = simpledateformat.format(date);    //06-03
            times.add(format);
        }
        map.put("X",times);
        List<Double> yValue = environmentdetectionservice.getTemperature(dateList);
        map.put("Y",yValue);
        return map;
    }

    /**
     * 获取湿度情况
     * */
    @Anonymous
    @RequestMapping("/gethumidityinfo")
    public Map getHumidityInfo(){
        Map map = new HashMap();
        List<String> times = new ArrayList<>();
        List<Date> dateList = environmentdetectionservice.getCheckTime();  //2022-06-03 09:15:39
        SimpleDateFormat simpledateformat = new SimpleDateFormat("MM-dd");
        for (Date date: dateList) {
            String format = simpledateformat.format(date);    //06-03
            times.add(format);
        }
        map.put("X",times);
        List<Double> yValue = environmentdetectionservice.getHumidity(dateList);
        map.put("Y",yValue);
        return map;
    }

    /**
     * 获取PM2.5情况
     * */
    @Anonymous
    @RequestMapping("/getpm25info")
    public Map getPM25Info(){
        Map map = new HashMap();
        List<String> times = new ArrayList<>();
        List<Date> dateList = environmentdetectionservice.getCheckTime();  //2022-06-03 09:15:39
        SimpleDateFormat simpledateformat = new SimpleDateFormat("MM-dd");
        for (Date date: dateList) {
            String format = simpledateformat.format(date);    //06-03
            times.add(format);
        }
        map.put("X",times);
        List<Double> yValue = environmentdetectionservice.getPM25(dateList);
        map.put("Y",yValue);
        return map;
    }

    /**
     * 获取环境质量
     * */
    @Anonymous
    @RequestMapping("/getenvironmentquality")
    public List<EnvironmentDetection> getEnvironmentQuality(){
        List<EnvironmentDetection> list = environmentdetectionservice.getEnvironmentDetection();

        return list;
    }

    /**
     * 获取天气情况
     * */
    @Anonymous
    @RequestMapping("/getweather")
    public Map getWeather(){
        Map map = new HashMap<String,Double>();
        List<EnvironmentDetection> month = environmentdetectionservice.getEnvironmentDetection();
        List<Double> dateList = new ArrayList<>();
        map.put("X",month);
        map.put("Y",dateList);
        return map;
    }

}
