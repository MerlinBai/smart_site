package com.ruoyi.worker.service.impl;

import java.util.List;

import com.ruoyi.worker.domain.RuoyiType;
import com.ruoyi.worker.mapper.RuoyiTypeMapper;
import com.ruoyi.worker.service.IRuoyiTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 工种id与工种名的对应表Service业务层处理
 *
 * @author ruoyi
 * @date 2023-06-11
 */
@Service
public class RuoyiTypeServiceImpl implements IRuoyiTypeService
{
    @Autowired
    private RuoyiTypeMapper ruoyiTypeMapper;

    /**
     * 查询工种id与工种名的对应表
     *
     * @param id 工种id与工种名的对应表主键
     * @return 工种id与工种名的对应表
     */
    @Override
    public RuoyiType selectRuoyiTypeById(Long id)
    {
        return ruoyiTypeMapper.selectRuoyiTypeById(id);
    }

    /**
     * 查询工种id与工种名的对应表列表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 工种id与工种名的对应表
     */
    @Override
    public List<RuoyiType> selectRuoyiTypeList(RuoyiType ruoyiType)
    {
        return ruoyiTypeMapper.selectRuoyiTypeList(ruoyiType);
    }

    /**
     * 新增工种id与工种名的对应表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 结果
     */
    @Override
    public int insertRuoyiType(RuoyiType ruoyiType)
    {
        return ruoyiTypeMapper.insertRuoyiType(ruoyiType);
    }

    /**
     * 修改工种id与工种名的对应表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 结果
     */
    @Override
    public int updateRuoyiType(RuoyiType ruoyiType)
    {
        return ruoyiTypeMapper.updateRuoyiType(ruoyiType);
    }

    /**
     * 批量删除工种id与工种名的对应表
     *
     * @param ids 需要删除的工种id与工种名的对应表主键
     * @return 结果
     */
    @Override
    public int deleteRuoyiTypeByIds(Long[] ids)
    {
        return ruoyiTypeMapper.deleteRuoyiTypeByIds(ids);
    }

    /**
     * 删除工种id与工种名的对应表信息
     *
     * @param id 工种id与工种名的对应表主键
     * @return 结果
     */
    @Override
    public int deleteRuoyiTypeById(Long id)
    {
        return ruoyiTypeMapper.deleteRuoyiTypeById(id);
    }
}