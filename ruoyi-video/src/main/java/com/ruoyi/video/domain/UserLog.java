package com.ruoyi.video.domain;

public class UserLog {
    public UserLog(Integer id, Integer userId, Integer videoId, Double lastTime) {
        this.id = id;
        this.userId = userId;
        this.videoId = videoId;
        this.lastTime = lastTime;
    }

    @Override
    public String toString() {
        return "UserLog{" +
                "id=" + id +
                ", userId=" + userId +
                ", videoId=" + videoId +
                ", lastTime=" + lastTime +
                '}';
    }

    public UserLog() {
    }

    private Integer id;
    private Integer userId;
    private Integer videoId;
    private Double lastTime;

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
