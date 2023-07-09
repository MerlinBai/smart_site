package com.ruoyi.worker.mapper;


import com.ruoyi.common.core.domain.R;
import com.ruoyi.worker.domain.Message;
import com.ruoyi.worker.domain.RuoyiWorker;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 员工管理Mapper接口
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public interface RuoyiWorkerMapper 
{
    /**
     * 查询员工管理
     * 
     * @param id 员工管理主键
     * @return 员工管理
     */
    public RuoyiWorker selectRuoyiWorkerById(Long id);

    /**
     * 查询员工管理列表
     * 
     * @param ruoyiWorker 员工管理
     * @return 员工管理集合
     */
    public List<RuoyiWorker> selectRuoyiWorkerList(RuoyiWorker ruoyiWorker);

    public List<RuoyiWorker> selectRuoyiWorkerListDetails(RuoyiWorker ruoyiWorker);

    /**
     * 新增员工管理
     * 
     * @param ruoyiWorker 员工管理
     * @return 结果
     */
    public int insertRuoyiWorker(RuoyiWorker ruoyiWorker);

    /**
     * 修改员工管理
     * 
     * @param ruoyiWorker 员工管理
     * @return 结果
     */
    public int updateRuoyiWorker(RuoyiWorker ruoyiWorker);

    /**
     * 删除员工管理
     * 
     * @param id 员工管理主键
     * @return 结果
     */
    public int deleteRuoyiWorkerById(Long id);

    /**
     * 批量删除员工管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRuoyiWorkerByIds(Long[] ids);

    @Insert("insert into message (title,body,createBy,createTime) values (#{title},#{body},#{createBy},#{createTime})")
    void addmsg(Message message);

    @Select("select * from message where rec = #{id} order by isRead asc , createTime desc")
    List<Message> list(Long id);

    @Update("update message set isRead = 1 where rec = #{id} and id = #{readId}")
    void upmsg(RuoyiWorker ruoyiWorker);

    @Update("update tb_ruoyi_worker set authentication = 1, pol_status = #{polStatus}, " +
            "address_now = #{addressNow}, address_reg = #{addressReg}, name = #{name}, id_number = #{idNumber} where id = #{id}")
    void updateauth(RuoyiWorker ruoyiWorker);
}
