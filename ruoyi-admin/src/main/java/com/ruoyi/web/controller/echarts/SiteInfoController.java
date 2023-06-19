package com.ruoyi.web.controller.echarts;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.suke.pojo.SiteInfo;
import com.ruoyi.suke.service.SiteInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 12:38
 */
@Anonymous
@RestController
@CrossOrigin
@RequestMapping("/siteinfo")
public class SiteInfoController {
    @Autowired
    private SiteInfoService siteinfoservice;

    /**
     * 根据资产id返回资产对象
     * */
    @Anonymous
    @RequestMapping("/findbyid")
    public SiteInfo findById (@Param("id") Integer id){
        SiteInfo siteinfo = siteinfoservice.findById(id);
        System.out.println("================="+siteinfo);
        return siteinfo;
    }

}
