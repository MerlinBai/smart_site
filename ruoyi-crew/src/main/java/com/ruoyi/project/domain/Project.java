package com.ruoyi.project.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 项目管理对象 tb_project
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public class Project extends BaseEntity
{

    private static final long serialVersionUID = 1L;

    /** 主键 */

    private Long projectId;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String projectName;

    /** 项目简介 */
    @Excel(name = "项目简介")
    private String projectInfo;

    /** 项目人数 */
    @Excel(name = "项目人数")
    private Long projectPopulaion;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date projetcBeginTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date projectEndTime;

    /** 由哪一施工队承包 */
    @Excel(name = "由哪一施工队承包")
    private Long crewId;

    public void setProjectId(Long projectId) 
    {
        this.projectId = projectId;
    }

    public Long getProjectId() 
    {
        return projectId;
    }
    public void setProjectName(String projectName) 
    {
        this.projectName = projectName;
    }

    public String getProjectName() 
    {
        return projectName;
    }
    public void setProjectInfo(String projectInfo) 
    {
        this.projectInfo = projectInfo;
    }

    public String getProjectInfo() 
    {
        return projectInfo;
    }
    public void setProjectPopulaion(Long projectPopulaion) 
    {
        this.projectPopulaion = projectPopulaion;
    }

    public Long getProjectPopulaion() 
    {
        return projectPopulaion;
    }
    public void setProjetcBeginTime(Date projetcBeginTime) 
    {
        this.projetcBeginTime = projetcBeginTime;
    }

    public Date getProjetcBeginTime() 
    {
        return projetcBeginTime;
    }
    public void setProjectEndTime(Date projectEndTime) 
    {
        this.projectEndTime = projectEndTime;
    }

    public Date getProjectEndTime() 
    {
        return projectEndTime;
    }
    public void setCrewId(Long crewId) 
    {
        this.crewId = crewId;
    }

    public Long getCrewId() 
    {
        return crewId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("projectId", getProjectId())
            .append("projectName", getProjectName())
            .append("projectInfo", getProjectInfo())
            .append("projectPopulaion", getProjectPopulaion())
            .append("projetcBeginTime", getProjetcBeginTime())
            .append("projectEndTime", getProjectEndTime())
            .append("crewId", getCrewId())
            .toString();
    }
}
