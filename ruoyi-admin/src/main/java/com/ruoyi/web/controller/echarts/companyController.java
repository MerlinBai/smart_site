package com.ruoyi.web.controller.echarts;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.suke.pojo.CompanyVO;
import com.ruoyi.suke.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-29 20:32
 */
@Anonymous
@RestController
@RequestMapping("/company")
@CrossOrigin
public class companyController {

    @Autowired
    private CompanyService companyservice;

    /**
     * 获取入住企业信息
     * */
    @Anonymous
    @RequestMapping("/getcompanyreport")
    public List<CompanyVO> getCompanyReport(){
        List<CompanyVO> list = companyservice.getCompanyReport();
        return list;
    }
}
