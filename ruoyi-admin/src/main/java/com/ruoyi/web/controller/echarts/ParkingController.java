package com.ruoyi.web.controller.echarts;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.suke.pojo.Parking;
import com.ruoyi.suke.service.ParkingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 14:50
 */
@Anonymous
@RestController
@RequestMapping("/parking")
@CrossOrigin
public class ParkingController {

    @Autowired
    private ParkingService parkingservice;

    /**
     * 获取实时车位数据
     * */
    @Anonymous
    @RequestMapping("/getparkinginfo")
    public Parking getParkingInfo(){
        Parking parking = parkingservice.getParkingInfo();
        return parking;
    }
}
