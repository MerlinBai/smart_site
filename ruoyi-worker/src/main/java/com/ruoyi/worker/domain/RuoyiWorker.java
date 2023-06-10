package com.ruoyi.worker.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 员工管理对象 tb_ruoyi_worker
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public class RuoyiWorker extends BaseEntity
{
    private static final long serialVersionUID = 1L;

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
    @Excel(name = "住址")
    private String address;

    /** 政治面貌 */
    @Excel(name = "政治面貌")
    private String polStatus;

    /** 工种id */

    private Long workerTypeId;

    @Excel(name = "工种")
    private String workerTypeName;

    /** 属于哪一个施工队 */
    @Excel(name = "所属施工队")
    private Long crewId;

    /** 正在进行的项目 */
    @Excel(name = "正在进行的项目")
    private Long projectNow;

    /** 是否认证 */
    @Excel(name = "是否认证")
    private Long authentication;

    private String crewName;



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
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setPolStatus(String polStatus) 
    {
        this.polStatus = polStatus;
    }

    public String getPolStatus() 
    {
        return polStatus;
    }
    public void setWorkerTypeId(Long wokerTypeId)
    {
        this.workerTypeId = wokerTypeId;
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
            .append("address", getAddress())
            .append("polStatus", getPolStatus())
            .append("wokerTypeId", getWorkerTypeId())
            .append("crewId", getCrewId())
            .append("projectNow", getProjectNow())
            .append("authentication", getAuthentication())
            .toString();
    }
}
