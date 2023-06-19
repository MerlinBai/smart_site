package com.ruoyi.suke.service.impl;

import com.ruoyi.suke.pojo.Parking;
import com.ruoyi.suke.service.ParkingService;
import com.ruoyi.suke.mapper.ParkingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 14:56
 */
@Service
public class ParkingServiceImpl implements ParkingService {
    @Autowired
    private ParkingDao parkingdao;

    @Override
    public Parking getParkingInfo() {
        Parking parking = parkingdao.getParkingInfo();
        return parking;
    }
}
