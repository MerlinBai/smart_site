package com.ruoyi.suke.service;

import java.util.List;
import com.ruoyi.suke.pojo.AssetsTotal;

/**
 * 工地资产统计Service接口
 * 
 * @author ruoyi
 * @date 2023-05-10
 */
public interface IAssetsTotalService 
{
    /**
     * 查询工地资产统计
     * 
     * @param id 工地资产统计主键
     * @return 工地资产统计
     */
    public AssetsTotal selectAssetsTotalById(String id);

    /**
     * 查询工地资产统计列表
     * 
     * @param assetsTotal 工地资产统计
     * @return 工地资产统计集合
     */
    public List<AssetsTotal> selectAssetsTotalList(AssetsTotal assetsTotal);

    /**
     * 新增工地资产统计
     * 
     * @param assetsTotal 工地资产统计
     * @return 结果
     */
    public int insertAssetsTotal(AssetsTotal assetsTotal);

    /**
     * 修改工地资产统计
     * 
     * @param assetsTotal 工地资产统计
     * @return 结果
     */
    public int updateAssetsTotal(AssetsTotal assetsTotal);

    /**
     * 批量删除工地资产统计
     * 
     * @param ids 需要删除的工地资产统计主键集合
     * @return 结果
     */
    public int deleteAssetsTotalByIds(String[] ids);

    /**
     * 删除工地资产统计信息
     * 
     * @param id 工地资产统计主键
     * @return 结果
     */
    public int deleteAssetsTotalById(String id);
}
