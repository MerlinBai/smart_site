package com.ruoyi.suke.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.suke.mapper.AssetsTotalMapper;
import com.ruoyi.suke.pojo.AssetsTotal;
import com.ruoyi.suke.service.IAssetsTotalService;

/**
 * 工地资产统计Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-05-10
 */
@Service
public class AssetsTotalServiceImpl implements IAssetsTotalService 
{
    @Autowired
    private AssetsTotalMapper assetsTotalMapper;

    /**
     * 查询工地资产统计
     * 
     * @param id 工地资产统计主键
     * @return 工地资产统计
     */
    @Override
    public AssetsTotal selectAssetsTotalById(String id)
    {
        return assetsTotalMapper.selectAssetsTotalById(id);
    }

    /**
     * 查询工地资产统计列表
     * 
     * @param assetsTotal 工地资产统计
     * @return 工地资产统计
     */
    @Override
    public List<AssetsTotal> selectAssetsTotalList(AssetsTotal assetsTotal)
    {
        return assetsTotalMapper.selectAssetsTotalList(assetsTotal);
    }

    /**
     * 新增工地资产统计
     * 
     * @param assetsTotal 工地资产统计
     * @return 结果
     */
    @Override
    public int insertAssetsTotal(AssetsTotal assetsTotal)
    {
        return assetsTotalMapper.insertAssetsTotal(assetsTotal);
    }

    /**
     * 修改工地资产统计
     * 
     * @param assetsTotal 工地资产统计
     * @return 结果
     */
    @Override
    public int updateAssetsTotal(AssetsTotal assetsTotal)
    {
        return assetsTotalMapper.updateAssetsTotal(assetsTotal);
    }

    /**
     * 批量删除工地资产统计
     * 
     * @param ids 需要删除的工地资产统计主键
     * @return 结果
     */
    @Override
    public int deleteAssetsTotalByIds(String[] ids)
    {
        return assetsTotalMapper.deleteAssetsTotalByIds(ids);
    }

    /**
     * 删除工地资产统计信息
     * 
     * @param id 工地资产统计主键
     * @return 结果
     */
    @Override
    public int deleteAssetsTotalById(String id)
    {
        return assetsTotalMapper.deleteAssetsTotalById(id);
    }
}
