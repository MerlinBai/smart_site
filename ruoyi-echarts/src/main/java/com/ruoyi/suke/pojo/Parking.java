package com.ruoyi.suke.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 14:35
 *
 *
CREATE TABLE `tb_parking` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '车位Id',
`parking_number` int(11) DEFAULT NULL COMMENT '车场数',
`gates_number` int(11) DEFAULT NULL COMMENT '道闸数',
`parking_space` int(11) DEFAULT NULL COMMENT '车位数',
`site_id` int(11) DEFAULT NULL COMMENT '所属工地',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='停车场表'

SELECT p.parking_number,p.site_id,
p.gates_number,p.parking_space,pr.entry_number,pr.out_number,
pr.vehicles_number,pr.parkId
 */
//@TableName("tb_parking")
public class Parking {

    private Integer parkingNumber ;//车场数
    private Integer gatesNumber ;//道闸数
    private Integer parkingSpace ;//车位数
    private Integer siteId ;//所属工地
    private Integer entryNumber; //进场数
    private Integer outNumber;  //出场数
    private Integer vehiclesNumber;  //场内车

    @Override
    public String toString() {
        return "Parking{" +
                "parkingNumber=" + parkingNumber +
                ", gatesNumber=" + gatesNumber +
                ", parkingSpace=" + parkingSpace +
                ", siteId=" + siteId +
                ", entryNumber=" + entryNumber +
                ", outNumber=" + outNumber +
                ", vehiclesNumber=" + vehiclesNumber +
                '}';
    }

    public Integer getParkingNumber() {
        return parkingNumber;
    }

    public void setParkingNumber(Integer parkingNumber) {
        this.parkingNumber = parkingNumber;
    }

    public Integer getGatesNumber() {
        return gatesNumber;
    }

    public void setGatesNumber(Integer gatesNumber) {
        this.gatesNumber = gatesNumber;
    }

    public Integer getParkingSpace() {
        return parkingSpace;
    }

    public void setParkingSpace(Integer parkingSpace) {
        this.parkingSpace = parkingSpace;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Integer getEntryNumber() {
        return entryNumber;
    }

    public void setEntryNumber(Integer entryNumber) {
        this.entryNumber = entryNumber;
    }

    public Integer getOutNumber() {
        return outNumber;
    }

    public void setOutNumber(Integer outNumber) {
        this.outNumber = outNumber;
    }

    public Integer getVehiclesNumber() {
        return vehiclesNumber;
    }

    public void setVehiclesNumber(Integer vehiclesNumber) {
        this.vehiclesNumber = vehiclesNumber;
    }
}
