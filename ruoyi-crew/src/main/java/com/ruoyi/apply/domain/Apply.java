package com.ruoyi.apply.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 应聘人信息对象 tb_apply
 * 
 * @author ruoyi
 * @date 2023-06-21
 */
public class Apply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 应聘id */
    private Long applyId;

    /** 项目id */
    private Long itemId;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String itemName;

    /** 应聘工种 */
    @Excel(name = "应聘工种")
    private String workerRequire;

    /** 应聘人 */
    @Excel(name = "应聘人")
    private String applyUser;

    /** 应聘人联系方式 */
    @Excel(name = "应聘人联系方式")
    private String applyPhone;

    /** 应聘时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "应聘时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date applyTime;

    /** 审核结果 */
    @Excel(name = "审核结果")
    private String applyAudit;

    public void setApplyId(Long applyId) 
    {
        this.applyId = applyId;
    }

    public Long getApplyId() 
    {
        return applyId;
    }
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
    public void setWorkerRequire(String workerRequire) 
    {
        this.workerRequire = workerRequire;
    }

    public String getWorkerRequire() 
    {
        return workerRequire;
    }
    public void setApplyUser(String applyUser) 
    {
        this.applyUser = applyUser;
    }

    public String getApplyUser() 
    {
        return applyUser;
    }
    public void setApplyPhone(String applyPhone) 
    {
        this.applyPhone = applyPhone;
    }

    public String getApplyPhone() 
    {
        return applyPhone;
    }
    public void setApplyTime(Date applyTime) 
    {
        this.applyTime = applyTime;
    }

    public Date getApplyTime() 
    {
        return applyTime;
    }
    public void setApplyAudit(String applyAudit) 
    {
        this.applyAudit = applyAudit;
    }

    public String getApplyAudit() 
    {
        return applyAudit;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("applyId", getApplyId())
            .append("itemId", getItemId())
            .append("itemName", getItemName())
            .append("workerRequire", getWorkerRequire())
            .append("applyUser", getApplyUser())
            .append("applyPhone", getApplyPhone())
            .append("applyTime", getApplyTime())
            .append("applyAudit", getApplyAudit())
            .toString();
    }
}
