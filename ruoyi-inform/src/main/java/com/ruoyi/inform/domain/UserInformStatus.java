package com.ruoyi.inform.domain;

import java.time.LocalDateTime;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户通知状态信息对象 tb_user_inform_status
 * 
 * @author ruoyi
 * @date 2023-05-27
 */
public class UserInformStatus extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 通知id */
    @Excel(name = "通知id")
    private Long informId;

    /** 通知标题 */
    @Excel(name = "通知标题")
    private String informTitle;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 用户账号 */
    @Excel(name = "用户账号")
    private String userName;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickName;

    /** 已读状态 */
    @Excel(name = "已读状态")
    private String status;

    /** 时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "时间", width = 30, dateFormat = "yyyy-MM-dd")
    private LocalDateTime time;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
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
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setNickName(String nickName) 
    {
        this.nickName = nickName;
    }

    public String getNickName() 
    {
        return nickName;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setTime(LocalDateTime time)
    {
        this.time = time;
    }

    public LocalDateTime getTime()
    {
        return time;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("informId", getInformId())
            .append("informTitle", getInformTitle())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("nickName", getNickName())
            .append("status", getStatus())
            .append("time", getTime())
            .toString();
    }
}
