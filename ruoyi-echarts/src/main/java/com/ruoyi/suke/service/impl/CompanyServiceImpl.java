package com.ruoyi.suke.service.impl;

import com.ruoyi.suke.mapper.CompanyDao;
import com.ruoyi.suke.pojo.CompanyVO;
import com.ruoyi.suke.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-29 20:38
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDao companydao;

    @Override
    public List<CompanyVO> getCompanyReport() {
        List<CompanyVO> list = companydao.getCompanyReport();
        return list;
    }
}
