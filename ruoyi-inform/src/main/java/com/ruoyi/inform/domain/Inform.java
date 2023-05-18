package com.ruoyi.inform.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 通知对象 tb_inform
 * 
 * @author ruoyi
 * @date 2023-05-17
 */
public class Inform extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 通知id */
    private Long informId;

    /** 通知标题 */
    @Excel(name = "通知标题")
    private String informTitle;

    /** 通知类型 */
    @Excel(name = "通知类型")
    private String informType;

    /** 通知状态 */
    @Excel(name = "通知状态")
    private String status;

    /** 通知内容 */
    @Excel(name = "通知内容")
    private String informContent;

    /** 通知文件 */
    @Excel(name = "通知文件")
    private String infromFile;

    public void setInformId(Long informId) 
    {
        this.informId = informId;
    }

    public Long getInformId() 
    {
        return informId;
    }
    public void setInformTitle(String informTitle) 
    {
        this.informTitle = informTitle;
    }

    public String getInformTitle() 
    {
        return informTitle;
    }
    public void setInformType(String informType) 
    {
        this.informType = informType;
    }

    public String getInformType() 
    {
        return informType;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setInformContent(String informContent) 
    {
        this.informContent = informContent;
    }

    public String getInformContent() 
    {
        return informContent;
    }
    public void setInfromFile(String infromFile) 
    {
        this.infromFile = infromFile;
    }

    public String getInfromFile() 
    {
        return infromFile;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("informId", getInformId())
            .append("informTitle", getInformTitle())
            .append("informType", getInformType())
            .append("status", getStatus())
            .append("informContent", getInformContent())
            .append("infromFile", getInfromFile())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
