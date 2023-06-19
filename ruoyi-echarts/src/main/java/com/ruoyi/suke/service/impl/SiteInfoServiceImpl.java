package com.ruoyi.suke.service.impl;

import com.ruoyi.suke.mapper.SiteInfoDao;
import com.ruoyi.suke.pojo.SiteInfo;
import com.ruoyi.suke.service.SiteInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 12:33
 */
@Service
public class SiteInfoServiceImpl implements SiteInfoService {
    //自动注入
    @Autowired
    private SiteInfoDao siteinfodao;

    @Override
    public SiteInfo findById(Integer id) {
        SiteInfo siteinfo = siteinfodao.getSiteInfoById(id);
        return siteinfo;
    }
}
