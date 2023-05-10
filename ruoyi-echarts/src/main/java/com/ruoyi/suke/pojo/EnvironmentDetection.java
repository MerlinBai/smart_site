package com.ruoyi.suke.pojo;

import com.baomidou.mybatisplus.annotation.TableName;

import java.util.Date;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-30 16:55
 *
CREATE TABLE `tb_environment_detection` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`cid` int(11) DEFAULT NULL COMMENT '所属检测点',
`temperature` double(3,1) DEFAULT NULL COMMENT '温度(℃)',
`pm25` double DEFAULT NULL COMMENT 'pm2.5',
`humidity` double DEFAULT NULL COMMENT '湿度(%)',
`noise` double DEFAULT NULL COMMENT '噪音(db)',
`wind_speed` double DEFAULT NULL COMMENT '风速(m/s)',
`check_time` datetime DEFAULT NULL COMMENT '检测时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='环境监测'
 */
@TableName("tb_environment_detection")
public class EnvironmentDetection {
    private Integer id;
    private Integer cid;
    private Double temperature;
    private Double pm25;
    private Double humidity;
    private Double noise;
    private Double windSpeed;
    private Date checkTime;

    private CheckPoint checkpoint; //检查点对象

    @Override
    public String toString() {
        return "EnvironmentDetection{" +
                "id=" + id +
                ", cid=" + cid +
                ", temperature=" + temperature +
                ", pm25=" + pm25 +
                ", humidity=" + humidity +
                ", noise=" + noise +
                ", windSpeed=" + windSpeed +
                ", checkTime=" + checkTime +
                ", checkpoint=" + checkpoint +
                '}';
    }

    public CheckPoint getCheckpoint() {
        return checkpoint;
    }

    public void setCheckpoint(CheckPoint checkpoint) {
        this.checkpoint = checkpoint;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getTemperature() {
        return temperature;
    }

    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }

    public Double getPm25() {
        return pm25;
    }

    public void setPm25(Double pm25) {
        this.pm25 = pm25;
    }

    public Double getHumidity() {
        return humidity;
    }

    public void setHumidity(Double humidity) {
        this.humidity = humidity;
    }

    public Double getNoise() {
        return noise;
    }

    public void setNoise(Double noise) {
        this.noise = noise;
    }

    public Double getWindSpeed() {
        return windSpeed;
    }

    public void setWindSpeed(Double windSpeed) {
        this.windSpeed = windSpeed;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }
}
