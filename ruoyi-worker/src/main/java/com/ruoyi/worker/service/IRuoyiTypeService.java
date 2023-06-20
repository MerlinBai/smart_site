package com.ruoyi.worker.service;

import com.ruoyi.worker.domain.RuoyiType;

import java.util.List;

/**
 * @author 马兰友
 * @Date: 2023/06/11/20:43
 */
public interface IRuoyiTypeService {
    /**
     * 查询工种id与工种名的对应表
     *
     * @param id 工种id与工种名的对应表主键
     * @return 工种id与工种名的对应表
     */
    public RuoyiType selectRuoyiTypeById(Long id);

    /**
     * 查询工种id与工种名的对应表列表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 工种id与工种名的对应表集合
     */
    public List<RuoyiType> selectRuoyiTypeList(RuoyiType ruoyiType);

    /**
     * 新增工种id与工种名的对应表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 结果
     */
    public int insertRuoyiType(RuoyiType ruoyiType);

    /**
     * 修改工种id与工种名的对应表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 结果
     */
    public int updateRuoyiType(RuoyiType ruoyiType);

    /**
     * 批量删除工种id与工种名的对应表
     *
     * @param ids 需要删除的工种id与工种名的对应表主键集合
     * @return 结果
     */
    public int deleteRuoyiTypeByIds(Long[] ids);

    /**
     * 删除工种id与工种名的对应表信息
     *
     * @param id 工种id与工种名的对应表主键
     * @return 结果
     */
    public int deleteRuoyiTypeById(Long id);
}
