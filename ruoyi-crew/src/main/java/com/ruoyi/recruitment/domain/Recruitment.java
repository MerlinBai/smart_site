package com.ruoyi.recruitment.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 招聘公告对象 tb_recruitment
 *
 * @author ruoyi
 * @date 2023-06-20
 */
public class Recruitment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 项目id */
    private Long itemId;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String itemName;

    /** 招聘公司 */
    @Excel(name = "招聘公司")
    private String requireCorporation;

    /** 项目内容 */
    @Excel(name = "项目内容")
    private String itemContent;

    /** 项目所在地 */
    @Excel(name = "项目所在地")
    private String itemLocation;

    /** 工种需求 */
    @Excel(name = "工种需求")
    private String workerRequire;

    /** 招聘人数 */
    @Excel(name = "招聘人数")
    private Long requireNum;

    /** 预计完成时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计完成时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date itemFinishTime;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactPhone;

    /** 项目招聘状态 */
    @Excel(name = "项目招聘状态")
    private String itemStatus;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDate releaseTime;

    public void setItemId(Long itemId)
    {
        this.itemId = itemId;
    }

    public Long getItemId()
    {
        return itemId;
    }
    public void setItemName(String itemName)
    {
        this.itemName = itemName;
    }

    public String getItemName()
    {
        return itemName;
    }
    public void setRequireCorporation(String requireCorporation)
    {
        this.requireCorporation = requireCorporation;
    }

    public String getRequireCorporation()
    {
        return requireCorporation;
    }
    public void setItemContent(String itemContent)
    {
        this.itemContent = itemContent;
    }

    public String getItemContent()
    {
        return itemContent;
    }
    public void setItemLocation(String itemLocation)
    {
        this.itemLocation = itemLocation;
    }

    public String getItemLocation()
    {
        return itemLocation;
    }
    public void setWorkerRequire(String workerRequire)
    {
        this.workerRequire = workerRequire;
    }

    public String getWorkerRequire()
    {
        return workerRequire;
    }
    public void setRequireNum(Long requireNum)
    {
        this.requireNum = requireNum;
    }

    public Long getRequireNum()
    {
        return requireNum;
    }
    public void setItemFinishTime(Date itemFinishTime)
    {
        this.itemFinishTime = itemFinishTime;
    }

    public Date getItemFinishTime()
    {
        return itemFinishTime;
    }
    public void setContactPhone(String contactPhone)
    {
        this.contactPhone = contactPhone;
    }

    public String getContactPhone()
    {
        return contactPhone;
    }
    public void setItemStatus(String itemStatus)
    {
        this.itemStatus = itemStatus;
    }

    public String getItemStatus()
    {
        return itemStatus;
    }
    public void setReleaseTime(LocalDate releaseTime)
    {
        this.releaseTime = releaseTime;
    }

    public LocalDate getReleaseTime()
    {
        return releaseTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("itemId", getItemId())
                .append("itemName", getItemName())
                .append("requireCorporation", getRequireCorporation())
                .append("itemContent", getItemContent())
                .append("itemLocation", getItemLocation())
                .append("workerRequire", getWorkerRequire())
                .append("requireNum", getRequireNum())
                .append("itemFinishTime", getItemFinishTime())
                .append("contactPhone", getContactPhone())
                .append("itemStatus", getItemStatus())
                .append("releaseTime", getReleaseTime())
                .toString();
    }
}
