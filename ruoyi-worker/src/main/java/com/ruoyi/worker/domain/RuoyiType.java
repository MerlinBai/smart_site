package com.ruoyi.worker.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author 马兰友
 * @Date: 2023/06/08/20:15
 */
public class RuoyiType extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 工种id */
    @Excel(name = "工种id")
    private Integer id;

    /** 工种名 */
    @Excel(name = "工种名")
    private String name;

    @Excel(name = "工匠人数")
    private Long numberOfPeople;

    @Excel(name = "工种简介")
    private String brief;

    public Long getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(Long numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .toString();
    }
}
