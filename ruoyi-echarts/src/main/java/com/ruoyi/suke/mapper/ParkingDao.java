package com.ruoyi.suke.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.suke.pojo.Parking;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 14:56
 */
//使用mybatis-plus对单表的curd操作
@Mapper
@Repository
public interface ParkingDao extends BaseMapper<Parking> {
    Parking getParkingInfo();
}
