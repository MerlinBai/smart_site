package com.ruoyi.suke.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;

/**
 * 工地资产统计对象 tb_assets_total
 * 
 * @author ruoyi
 * @date 2023-05-10
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AssetsTotal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String id;

    /** 总产值 */
    @Excel(name = "总产值")
    private BigDecimal totalAssets;

    /** 总投资 */
    @Excel(name = "总投资")
    private BigDecimal totalInvestment;

    /** 总净利 */
    @Excel(name = "总净利")
    private BigDecimal totalNetProfit;

    /** 总税收 */
    @Excel(name = "总税收")
    private BigDecimal totalRevenue;

    /** 所属工地 */
    @Excel(name = "所属工地")
    private Long siteId;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setTotalAssets(BigDecimal totalAssets) 
    {
        this.totalAssets = totalAssets;
    }

    public BigDecimal getTotalAssets() 
    {
        return totalAssets;
    }
    public void setTotalInvestment(BigDecimal totalInvestment) 
    {
        this.totalInvestment = totalInvestment;
    }

    public BigDecimal getTotalInvestment() 
    {
        return totalInvestment;
    }
    public void setTotalNetProfit(BigDecimal totalNetProfit) 
    {
        this.totalNetProfit = totalNetProfit;
    }

    public BigDecimal getTotalNetProfit() 
    {
        return totalNetProfit;
    }
    public void setTotalRevenue(BigDecimal totalRevenue) 
    {
        this.totalRevenue = totalRevenue;
    }

    public BigDecimal getTotalRevenue() 
    {
        return totalRevenue;
    }
    public void setSiteId(Long siteId) 
    {
        this.siteId = siteId;
    }

    public Long getSiteId() 
    {
        return siteId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("totalAssets", getTotalAssets())
            .append("totalInvestment", getTotalInvestment())
            .append("totalNetProfit", getTotalNetProfit())
            .append("totalRevenue", getTotalRevenue())
            .append("siteId", getSiteId())
            .toString();
    }
}
