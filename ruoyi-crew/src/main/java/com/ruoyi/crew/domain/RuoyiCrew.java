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

    /** userId */
    private Long userId;


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
    @Excel(name = "资质")
    private String qualification;

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

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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
    public void setQualification(String qualification)
    {
        this.qualification = qualification;
    }

    public String getQualification()
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
    private List<Integer> finishProjects;
    private List<Integer>unfinishProjects;
    private List<String>finishProjectsName;
    private List<String>unfinishProjectsName;
    private String FinSumName;
    private String UnFinSumName;
    private String applyAudit;
    private String crewNature;
    private String area;
    private String registeredCapital;
    private String reason;
    private String businessScope;
    private Integer initialEmployee;

    public Integer getInitialEmployee() {
        return initialEmployee;
    }

    public void setInitialEmployee(Integer initialEmployee) {
        this.initialEmployee = initialEmployee;
    }

    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }

    public String getOperatingTerm() {
        return operatingTerm;
    }

    public void setOperatingTerm(String operatingTerm) {
        this.operatingTerm = operatingTerm;
    }

    public String getAnnualInspection() {
        return annualInspection;
    }

    public void setAnnualInspection(String annualInspection) {
        this.annualInspection = annualInspection;
    }

    private String operatingTerm;
    private String annualInspection;


    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getCrewNature() {
        return crewNature;
    }

    public void setCrewNature(String crewNature) {
        this.crewNature = crewNature;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }


    public String getApplyAudit() {
        return applyAudit;
    }

    public void setApplyAudit(String applyAudit) {
        this.applyAudit = applyAudit;
    }

    public String getFinSumName() {
        return FinSumName;
    }

    public void setFinSumName(String finSumName) {
        FinSumName = finSumName;
    }

    public String getUnFinSumName() {
        return UnFinSumName;
    }

    public void setUnFinSumName(String unFinSumName) {
        UnFinSumName = unFinSumName;
    }

    public List<String> getFinishProjectsName() {
        return finishProjectsName;
    }

    public void setFinishProjectsName(List<String> finishProjectsName) {
        this.finishProjectsName = finishProjectsName;
    }

    public List<String> getUnfinishProjectsName() {
        return unfinishProjectsName;
    }

    public void setUnfinishProjectsName(List<String> unfinishProjectsName) {
        this.unfinishProjectsName = unfinishProjectsName;
    }

    public List<Integer> getFinishProjects() {
        return finishProjects;
    }

    public void setFinishProjects(List<Integer> finishProjects) {
        this.finishProjects = finishProjects;
    }

    public List<Integer> getUnfinishProjects() {
        return unfinishProjects;
    }

    public void setUnfinishProjects(List<Integer> unfinishProjects) {
        this.unfinishProjects = unfinishProjects;
    }
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("crewId", getCrewId())
                .append("userId", getUserId())
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

    public RuoyiCrew() {
    }

    public RuoyiCrew(Long crewId, Long userId, String name, String resPerson, String phone, String address, String qualification, Long finishProject, Long unfinishProject, Long popualtion, Date buildTime) {
        this.crewId = crewId;
        this.userId = userId;
        this.name = name;
        this.resPerson = resPerson;
        this.phone = phone;
        this.address = address;
        this.qualification = qualification;
        this.finishProject = finishProject;
        this.unfinishProject = unfinishProject;
        this.popualtion = popualtion;
        this.buildTime = buildTime;
    }
}
