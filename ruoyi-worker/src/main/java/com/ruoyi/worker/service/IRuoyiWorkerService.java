package com.ruoyi.worker.service;


import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.worker.domain.RuoyiWorker;

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
    public List<RuoyiWorker> selectRuoyiWorkerList(RuoyiWorker ruoyiWorker);

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
    public int deleteRuoyiWorkerByIds(Long[] ids);

    /**
     * 删除员工管理信息
     * 
     * @param id 员工管理主键
     * @return 结果
     */
    public int deleteRuoyiWorkerById(Long id);

    public String importWorker(List<RuoyiWorker> workerList, Boolean isUpdateSupport, String operName);
}
