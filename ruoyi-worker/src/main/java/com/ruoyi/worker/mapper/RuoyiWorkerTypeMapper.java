package com.ruoyi.worker.mapper;


import com.ruoyi.worker.domain.RuoyiWorkerType;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 马兰友
 * @Date: 2023/06/08/20:06
 */
public interface RuoyiWorkerTypeMapper {
    @Select("select worker_id from tb_ruoyi_worker_type where type_id = #{typeId}")
    public List<Long> selectWorkerId (Long typeId);

    @Select("select type_id from tb_ruoyi_worker_type where worker_id = #{workerId}")
    public List<Long> selectTypeId (Long workerId);

    @Insert("insert into smart_site.tb_ruoyi_worker_type (worker_id, type_id) values (#{workerId},#{typeId})")
    public void insert(RuoyiWorkerType ruoyiWorkerType);

    @Delete("delete from smart_site.tb_ruoyi_worker_type where worker_id = #{workerId}")
    public void deleteByWorkerId(Long workerId);
}
