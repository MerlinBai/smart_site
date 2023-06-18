package com.ruoyi.crew.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.project.domain.Project;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 施工队信息对象 tb_ruoyi_crew
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public class RuoyiCrew extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** id */
    private Long crewId;

    /** 施工单位名称 */
    @Excel(name = "施工单位名称")
    private String name;

    /** 负责人 */
    @Excel(name = "负责人")
    private String resPerson;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 资质（特级，1，2，3级对应0，1，2，3） */
    @Excel(name = "资质", readConverterExp = "特=级，1，2，3级对应0，1，2，3")
    private Long qualification;

    /** 已完成项目 */
    @Excel(name = "已完成项目")
    private Long finishProject;

    /** 未完成项目 */
    @Excel(name = "未完成项目")
    private Long unfinishProject;

    /** 员工数量 */
    @Excel(name = "员工数量")
    private Long popualtion;

    /** 成立时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "成立时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date buildTime;

    public void setCrewId(Long crewId) 
    {
        this.crewId = crewId;
    }

    public Long getCrewId() 
    {
        return crewId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setResPerson(String resPerson) 
    {
        this.resPerson = resPerson;
    }

    public String getResPerson() 
    {
        return resPerson;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setQualification(Long qualification) 
    {
        this.qualification = qualification;
    }

    public Long getQualification() 
    {
        return qualification;
    }
    public void setFinishProject(Long finishProject) 
    {
        this.finishProject = finishProject;
    }

    public Long getFinishProject() 
    {
        return finishProject;
    }
    public void setUnfinishProject(Long unfinishProject) 
    {
        this.unfinishProject = unfinishProject;
    }

    public Long getUnfinishProject() 
    {
        return unfinishProject;
    }
    public void setPopualtion(Long popualtion) 
    {
        this.popualtion = popualtion;
    }

    public Long getPopualtion() 
    {
        return popualtion;
    }
    public void setBuildTime(Date buildTime) 
    {
        this.buildTime = buildTime;
    }

    public Date getBuildTime() 
    {
        return buildTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("crewId", getCrewId())
            .append("name", getName())
            .append("resPerson", getResPerson())
            .append("phone", getPhone())
            .append("address", getAddress())
            .append("qualification", getQualification())
            .append("finishProject", getFinishProject())
            .append("unfinishProject", getUnfinishProject())
            .append("popualtion", getPopualtion())
            .append("buildTime", getBuildTime())
            .toString();
    }
}
