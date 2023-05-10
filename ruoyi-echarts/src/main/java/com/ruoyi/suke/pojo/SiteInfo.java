package com.ruoyi.suke.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * 工地概况实体类
 *
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 11:44
 *
 *
Create Table

CREATE TABLE `tb_site_info` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '工地id',
`company_number` int(11) NOT NULL COMMENT '企业数量',
`dettled_company_number` int(11) DEFAULT NULL COMMENT '入驻企业数量',
`engaged_people_number` int(11) DEFAULT NULL COMMENT '从业人数',
`covered_area` double(7,2) DEFAULT NULL COMMENT '占地面积',
`Construction_erea` double(7,2) DEFAULT NULL COMMENT '建筑面积',
`Construction_land_erea` double(7,2) DEFAULT NULL COMMENT '建设用地面积',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='工地概览表'

 */
@TableName("tb_site_info")
public class SiteInfo {
    @TableId(type= IdType.AUTO)  //该列主键生成策略: 自增
    private Integer id;
    private Integer companyNumber;
    private Integer dettledCompanyNumber;
    private Integer engagedPeopleNumber;
    private Double coveredArea;
    private Double ConstructionErea;
    private Double ConstructionLandErea;

    @Override
    public String toString() {
        return "SiteInfo{" +
                "id=" + id +
                ", companyNumber=" + companyNumber +
                ", dettledCompanyNumber=" + dettledCompanyNumber +
                ", engagedPeopleNumber=" + engagedPeopleNumber +
                ", coveredArea=" + coveredArea +
                ", ConstructionErea=" + ConstructionErea +
                ", ConstructionLandErea=" + ConstructionLandErea +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCompanyNumber() {
        return companyNumber;
    }

    public void setCompanyNumber(Integer companyNumber) {
        this.companyNumber = companyNumber;
    }

    public Integer getDettledCompanyNumber() {
        return dettledCompanyNumber;
    }

    public void setDettledCompanyNumber(Integer dettledCompanyNumber) {
        this.dettledCompanyNumber = dettledCompanyNumber;
    }

    public Integer getEngagedPeopleNumber() {
        return engagedPeopleNumber;
    }

    public void setEngagedPeopleNumber(Integer engagedPeopleNumber) {
        this.engagedPeopleNumber = engagedPeopleNumber;
    }

    public Double getCoveredArea() {
        return coveredArea;
    }

    public void setCoveredArea(Double coveredArea) {
        this.coveredArea = coveredArea;
    }

    public Double getConstructionErea() {
        return ConstructionErea;
    }

    public void setConstructionErea(Double constructionErea) {
        ConstructionErea = constructionErea;
    }

    public Double getConstructionLandErea() {
        return ConstructionLandErea;
    }

    public void setConstructionLandErea(Double constructionLandErea) {
        ConstructionLandErea = constructionLandErea;
    }
}
