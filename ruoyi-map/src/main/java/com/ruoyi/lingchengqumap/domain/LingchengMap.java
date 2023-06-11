package com.ruoyi.lingchengqumap.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 陵城区区域对象 tb_lingcheng_map
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public class LingchengMap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long mapId;

    /** 区域名 */
    @Excel(name = "区域名")
    private String areaName;

    /** 人口 */
    @Excel(name = "人口")
    private Long population;

    public void setMapId(Long mapId) 
    {
        this.mapId = mapId;
    }

    public Long getMapId() 
    {
        return mapId;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setPopulation(Long population) 
    {
        this.population = population;
    }

    public Long getPopulation() 
    {
        return population;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("mapId", getMapId())
            .append("areaName", getAreaName())
            .append("population", getPopulation())
            .toString();
    }
}
