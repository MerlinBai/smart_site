package com.ruoyi.suke.service.impl;

import com.ruoyi.suke.mapper.AssetsTotalDao;
import com.ruoyi.suke.pojo.AssetsTotal;
import com.ruoyi.suke.service.AssetsTotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 数据总数实现类
 *
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 9:44
 */
@Service
public class AssetsTotalServiceImpl implements AssetsTotalService {
    //自动注入
    @Autowired
    private AssetsTotalDao assetstotaldao;

    @Override
    public AssetsTotal findById(Integer id) {
        AssetsTotal assetstotal = assetstotaldao.selectById(id);
        return assetstotal;
    }
}
