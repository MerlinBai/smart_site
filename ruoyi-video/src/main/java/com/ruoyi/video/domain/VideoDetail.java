package com.ruoyi.video.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.DataSource;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 记录视频观看时长对象 tb_video_detail
 *
 * @author ruoyi
 * @date 2023-05-18
 */


public class VideoDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 视频id */
    private Long videoId;

    /** 观看视频时间 */
    @Excel(name = "观看视频时间")
    private String videoViewTime;

    /** 进度条时间 */
    @Excel(name = "进度条时间")
    private String progressBar;

    /** 视频链接 */
    @Excel(name = "视频链接")
    private String videoLink;

    /** 视频看没看完0未看1看完 */
    @Excel(name = "视频看没看完0未看1看完")
    private Long done;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;

    private Long realTime;

    private float percentage;

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String createBy;

    @Override
    public String getCreateBy() {
        return createBy;
    }

    @Override
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    private String name;

    private String img;

    public void setVideoId(Long videoId)
    {
        this.videoId = videoId;
    }

    public Long getVideoId()
    {
        return videoId;
    }
    public void setVideoViewTime(String videoViewTime)
    {
        this.videoViewTime = videoViewTime;
    }

    public String getVideoViewTime()
    {
        return videoViewTime;
    }
    public void setProgressBar(String progressBar)
    {
        this.progressBar = progressBar;
    }

    public String getProgressBar()
    {
        return progressBar;
    }
    public void setVideoLink(String videoLink)
    {
        this.videoLink = videoLink;
    }

    public String getVideoLink()
    {
        return videoLink;
    }
    public void setDone(Long done)
    {
        this.done = done;
    }

    public Long getDone()
    {
        return done;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public Long getRealTime() {
        return realTime;
    }

    public void setRealTime(Long realTime) {
        this.realTime = realTime;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public VideoDetail(Long videoId, String videoViewTime, String progressBar, String videoLink, Long done, Long userId, Date createTime, Long realTime, float percentage, String createBy, String name, String img) {
        this.videoId = videoId;
        this.videoViewTime = videoViewTime;
        this.progressBar = progressBar;
        this.videoLink = videoLink;
        this.done = done;
        this.userId = userId;
        this.createTime = createTime;
        this.realTime = realTime;
        this.percentage = percentage;
        this.createBy = createBy;
        this.name = name;
        this.img = img;
    }


    public VideoDetail() {
    }

    @Override
    public String toString() {
        return "VideoDetail{" +
                "videoId=" + videoId +
                ", videoViewTime='" + videoViewTime + '\'' +
                ", progressBar='" + progressBar + '\'' +
                ", videoLink='" + videoLink + '\'' +
                ", done=" + done +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", realTime=" + realTime +
                ", percentage=" + percentage +
                ", createBy='" + createBy + '\'' +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
