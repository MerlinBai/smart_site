package com.ruoyi.crew.domain;

import java.util.List;

/**
 * Author：张宇
 * Date：2023/6/1  18:26
 * 一天代码十万三
 */
public class CrewProject {
    public int getCrewId() {
        return CrewId;
    }

    public void setCrewId(int crewId) {
        CrewId = crewId;
    }

    public int getUserId() {return UserId;}

    public void setUserId(int userId) {UserId = userId;}

    public List<Integer> getFinished() {
        return finished;
    }

    public void setFinished(List<Integer> finished) {
        this.finished = finished;
    }

    public List<Integer> getUnfinished() {
        return Unfinished;
    }

    public void setUnfinished(List<Integer> unfinished) {
        Unfinished = unfinished;
    }

    private int CrewId;

    private int UserId;
    private List<Integer>finished;
    private List<Integer>Unfinished;

}
