package com.ruoyi.lingchengqumap.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.lingchengqumap.mapper.LingchengMapMapper;
import com.ruoyi.lingchengqumap.domain.LingchengMap;
import com.ruoyi.lingchengqumap.service.ILingchengMapService;

/**
 * 陵城区区域Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
@Service
public class LingchengMapServiceImpl implements ILingchengMapService 
{
    @Autowired
    private LingchengMapMapper lingchengMapMapper;

    /**
     * 查询陵城区区域
     * 
     * @param mapId 陵城区区域主键
     * @return 陵城区区域
     */
    @Override
    public LingchengMap selectLingchengMapByMapId(Long mapId)
    {
        return lingchengMapMapper.selectLingchengMapByMapId(mapId);
    }

    /**
     * 查询陵城区区域列表
     * 
     * @param lingchengMap 陵城区区域
     * @return 陵城区区域
     */
    @Override
    public List<LingchengMap> selectLingchengMapList(LingchengMap lingchengMap)
    {
        return lingchengMapMapper.selectLingchengMapList(lingchengMap);
    }

    /**
     * 新增陵城区区域
     * 
     * @param lingchengMap 陵城区区域
     * @return 结果
     */
    @Override
    public int insertLingchengMap(LingchengMap lingchengMap)
    {
        return lingchengMapMapper.insertLingchengMap(lingchengMap);
    }

    /**
     * 修改陵城区区域
     * 
     * @param lingchengMap 陵城区区域
     * @return 结果
     */
    @Override
    public int updateLingchengMap(LingchengMap lingchengMap)
    {
        return lingchengMapMapper.updateLingchengMap(lingchengMap);
    }

    /**
     * 批量删除陵城区区域
     * 
     * @param mapIds 需要删除的陵城区区域主键
     * @return 结果
     */
    @Override
    public int deleteLingchengMapByMapIds(Long[] mapIds)
    {
        return lingchengMapMapper.deleteLingchengMapByMapIds(mapIds);
    }

    /**
     * 删除陵城区区域信息
     * 
     * @param mapId 陵城区区域主键
     * @return 结果
     */
    @Override
    public int deleteLingchengMapByMapId(Long mapId)
    {
        return lingchengMapMapper.deleteLingchengMapByMapId(mapId);
    }
}
