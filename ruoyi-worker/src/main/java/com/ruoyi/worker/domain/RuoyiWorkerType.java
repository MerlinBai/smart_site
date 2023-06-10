package com.ruoyi.worker.domain;

import javax.naming.InsufficientResourcesException;

/**
 * @author 马兰友
 * @Date: 2023/06/08/20:07
 */
public class RuoyiWorkerType {
    public RuoyiWorkerType(Long workerId, Long typeId) {
        this.workerId = workerId;
        this.typeId = typeId;
    }

    private Long workerId;
    private Long typeId;


    public Long getWorkerId() {
        return workerId;
    }

    public void setWorkerId(Long workerId) {
        this.workerId = workerId;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }
}
