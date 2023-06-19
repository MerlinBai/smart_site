package com.ruoyi.suke.service;

import com.ruoyi.suke.pojo.CompanyVO;

import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-29 20:36
 */
public interface CompanyService {
    /**
     * 统计入住企业
     * */
    List<CompanyVO> getCompanyReport();
}
