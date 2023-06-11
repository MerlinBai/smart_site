package com.ruoyi.worker.utils;

import com.ruoyi.worker.domain.RuoyiWorker;
import com.ruoyi.worker.domain.RuoyiWorkerType;
import com.ruoyi.worker.mapper.RuoyiTypeMapper;
import com.ruoyi.worker.mapper.RuoyiWorkerMapper;
import com.ruoyi.worker.mapper.RuoyiWorkerTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author 马兰友
 * @Date: 2023/06/09/15:06
 */
@Component
public class WorkerTypeUtil {
    public void workerTypeInsert(RuoyiWorker ruoyiWorker,RuoyiWorkerTypeMapper ruoyiWorkerTypeMapper,RuoyiWorkerMapper ruoyiWorkerMapper,RuoyiTypeMapper ruoyiTypeMapper){
        if(ruoyiWorker.getWorkerTypeName() != null){
            Long typeId;
            RuoyiWorker worker1 = ruoyiWorkerMapper.selectRuoyiWorkerList(ruoyiWorker).get(0);
            String wk = ruoyiWorker.getWorkerTypeName();
            String[] split = wk.split(",");
            for(String s : split){
                typeId = ruoyiTypeMapper.selectOneTypeId(s);
                if(typeId != null) {
                    RuoyiWorkerType ruoyiWorkerType = new RuoyiWorkerType(worker1.getId(), typeId);
                    ruoyiWorkerTypeMapper.insert(ruoyiWorkerType);
                }
                else{
                    ruoyiTypeMapper.insertType(ruoyiWorker.getWorkerTypeName());
                    typeId = ruoyiTypeMapper.selectOneTypeId(ruoyiWorker.getWorkerTypeName());
                    RuoyiWorkerType ruoyiWorkerType = new RuoyiWorkerType(worker1.getId(), typeId);
                    ruoyiWorkerTypeMapper.insert(ruoyiWorkerType);
                }
            }
        }
    }
}
