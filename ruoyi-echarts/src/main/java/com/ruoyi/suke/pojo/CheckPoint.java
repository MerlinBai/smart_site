package com.ruoyi.suke.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-12-01 14:47
 *
CREATE TABLE `tb_check_point` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`name` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '检测点名称',
`location` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '检测点位置',
`status` tinyint(4) DEFAULT NULL COMMENT '检测点状态 0:正常 1:未启用  2:维修中',
`site_id` int(11) DEFAULT NULL COMMENT '所属工地',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='监测点信息表'
 */
@TableName("tb_check_point")
public class CheckPoint {
    private Integer id;
    private String name;
    private String location;
    private Integer status;
    private Integer siteId;

    @Override
    public String toString() {
        return "CheckPoint{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", status=" + status +
                ", siteId=" + siteId +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }
}
