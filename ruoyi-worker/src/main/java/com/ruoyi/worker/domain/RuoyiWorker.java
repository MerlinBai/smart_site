package com.ruoyi.worker.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 员工管理对象 tb_ruoyi_worker
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public class RuoyiWorker extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    private Double persent;

    /** id */
    @Excel( name = "用户id" )
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 */

    private Long sex;

    @Excel(name = "性别")
    private String sexName;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 电话号 */
    @Excel(name = "电话号")
    private String phone;

    /** 住址 */
    @Excel(name = "现住址")
    private String addressNow;

    @Excel(name = "户籍住址")
    private String addressReg;
    /** 政治面貌 */
    private Integer polStatus;

    /** 工种id */

    private Long workerTypeId;

    @Excel(name = "工种")
    private String workerTypeName;

    /** 属于哪一个施工队 */
    @Excel(name = "所属施工队id")
    private Long crewId;

    /** 正在进行的项目 */
    @Excel(name = "正在进行的项目")
    private Long projectNow;

    /** 是否认证 */

    private Long authentication;

    private String crewName;

    @Excel(name = "政治面貌")
    private String polStatusName;

    @Excel(name = "身份证号")
    private String idNumber;

    @Excel(name = "是否认证")
    private String authenticationName;

    private String projectName;

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    private List<String>  workerTypeNames =new ArrayList<>() ;

    private List<String> authenticationList = new ArrayList<>() ;

    public List<String> getWorkerTypeNames() {
        return workerTypeNames;
    }

    public void setWorkerTypeNames(List<String> workerTypeNames) {
        this.workerTypeNames = workerTypeNames;
    }

    public List<String> getAuthenticationList() {
        return authenticationList;
    }

    public void setAuthenticationList(List<String> authenticationList) {
        this.authenticationList = authenticationList;
    }

    public Double getPersent() {
        return persent;
    }

    public void setPersent(Double persent) {
        this.persent = persent;
    }

    public String getAddressReg() {
        return addressReg;
    }

    public void setAddressReg(String addressReg) {
        this.addressReg = addressReg;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPolStatusName() {
        return polStatusName;
    }

    public void setPolStatusName(String polStatusName) {
        this.polStatusName = polStatusName;
    }

    public String getAuthenticationName() {
        return authenticationName;
    }

    public void setAuthenticationName(String authenticationName) {
        this.authenticationName = authenticationName;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
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
    public void setSex(Long sex)
    {
        this.sex = sex;
    }

    public Long getSex()
    {
        return sex;
    }
    public void setAge(Long age)
    {
        this.age = age;
    }

    public Long getAge()
    {
        return age;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setAddressNow(String addressNow)
    {
        this.addressNow = addressNow;
    }

    public String getAddressNow()
    {
        return addressNow;
    }
    public void setPolStatus(Integer polStatus)
    {
        this.polStatus = polStatus;
    }

    public Integer getPolStatus()
    {
        return polStatus;
    }
    public void setWorkerTypeId(Long workerTypeId)
    {
        this.workerTypeId = workerTypeId;
    }

    public Long getWorkerTypeId()
    {
        return workerTypeId;
    }
    public void setCrewId(Long crewId)
    {
        this.crewId = crewId;
    }

    public String getCrewName() {
        return crewName;
    }

    public void setCrewName(String crewName) {
        this.crewName = crewName;
    }

    public String getSexName() {
        return sexName;
    }

    public void setSexName(String sexName) {
        this.sexName = sexName;
    }

    public Long getCrewId()
    {
        return crewId;
    }
    public void setProjectNow(Long projectNow) 
    {
        this.projectNow = projectNow;
    }

    public Long getProjectNow() 
    {
        return projectNow;
    }
    public void setAuthentication(Long authentication) 
    {
        this.authentication = authentication;
    }

    public Long getAuthentication() 
    {
        return authentication;
    }

    public String getWorkerTypeName() {
        return workerTypeName;
    }

    public void setWorkerTypeName(String workerTypeName) {
        this.workerTypeName = workerTypeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("sex", getSex())
            .append("age", getAge())
            .append("phone", getPhone())
            .append("addressNow", getAddressNow())
            .append("addressReg", getAddressReg())
            .append("polStatus", getPolStatus())
            .append("wokerTypeId", getWorkerTypeId())
            .append("crewId", getCrewId())
            .append("projectNow", getProjectNow())
            .append("idNumber",getIdNumber())
            .append("authentication", getAuthentication())
            .append("persent",getPersent())
            .toString();
    }
}
