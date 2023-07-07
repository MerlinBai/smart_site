package com.ruoyi.worker.domain;

import java.util.Date;

public class Message {
    private String title;
    private String body;
    private Date time;
    private String createBy;
    private Integer isRead;
    private Long rec;

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }

    public Long getRec() {
        return rec;
    }

    public void setRec(Long rec) {
        this.rec = rec;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
}
