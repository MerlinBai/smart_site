package com.ruoyi.worker.service;


import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.worker.domain.Message;
import com.ruoyi.worker.domain.RuoyiWorker;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 员工管理Service接口
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public interface IRuoyiWorkerService 
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
    public List<RuoyiWorker> selectRuoyiWorkerList(List<String> workerTypeNames,List<Long> authentication,String name,Boolean isDetails);

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
     * 批量删除员工管理
     * 
     * @param ids 需要删除的员工管理主键集合
     * @return 结果
     */
    public int updateAutRuoyiWorkerByIds(Long[] ids);

    /**
     * 删除员工管理信息
     * 
     * @param id 员工管理主键
     * @return 结果
     */
    public int deleteRuoyiWorkerById(Long id);

    public String importWorker(List<RuoyiWorker> workerList, Boolean isUpdateSupport, String operName);

    public RuoyiWorker selectDetails(Long id);

    public int updateAuthentication(RuoyiWorker ruoyiWorker);

    List<Message> list(Long id);

    void updatemsg(RuoyiWorker ruoyiWorker);
}
