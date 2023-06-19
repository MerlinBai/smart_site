package com.ruoyi.suke.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.suke.pojo.CompanyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-29 20:39
 */
@Repository
@Mapper
public interface CompanyDao extends BaseMapper<CompanyVO> {
    List<CompanyVO> getCompanyReport();
}
