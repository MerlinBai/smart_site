package com.ruoyi.lingchengqumap.service;

import java.util.List;
import com.ruoyi.lingchengqumap.domain.LingchengMap;

/**
 * 陵城区区域Service接口
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public interface ILingchengMapService 
{
    /**
     * 查询陵城区区域
     * 
     * @param mapId 陵城区区域主键
     * @return 陵城区区域
     */
    public LingchengMap selectLingchengMapByMapId(Long mapId);

    /**
     * 查询陵城区区域列表
     * 
     * @param lingchengMap 陵城区区域
     * @return 陵城区区域集合
     */
    public List<LingchengMap> selectLingchengMapList(LingchengMap lingchengMap);

    /**
     * 新增陵城区区域
     * 
     * @param lingchengMap 陵城区区域
     * @return 结果
     */
    public int insertLingchengMap(LingchengMap lingchengMap);

    /**
     * 修改陵城区区域
     * 
     * @param lingchengMap 陵城区区域
     * @return 结果
     */
    public int updateLingchengMap(LingchengMap lingchengMap);

    /**
     * 批量删除陵城区区域
     * 
     * @param mapIds 需要删除的陵城区区域主键集合
     * @return 结果
     */
    public int deleteLingchengMapByMapIds(Long[] mapIds);

    /**
     * 删除陵城区区域信息
     * 
     * @param mapId 陵城区区域主键
     * @return 结果
     */
    public int deleteLingchengMapByMapId(Long mapId);
}
