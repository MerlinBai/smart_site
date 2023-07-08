package com.ruoyi.video.domain;

public class UserLog {


    @Override
    public String toString() {
        return "UserLog{" +
                "id=" + id +
                ", userId=" + userId +
                ", videoId=" + videoId +
                ", lastTime=" + lastTime +
                ", allTime=" + allTime +
                '}';
    }

    public UserLog() {
    }

    private Integer id;
    private Integer userId;
    private Integer videoId;
    private Double lastTime = 0.0;

    public Double getAllTime() {
        return allTime;
    }

    public void setAllTime(Double allTime) {
        this.allTime = allTime;
    }

    public UserLog(Integer id, Integer userId, Integer videoId, Double lastTime, Double allTime) {
        this.id = id;
        this.userId = userId;
        this.videoId = videoId;
        this.lastTime = lastTime;
        this.allTime = allTime;
    }

    private Double allTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public Double getLastTime() {
        return lastTime;
    }

    public void setLastTime(Double lastTime) {
        this.lastTime = lastTime;
    }
}
