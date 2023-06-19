package com.ruoyi.suke.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.suke.pojo.SiteInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 工地统计信息
 *
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 12:32
 */
//mybatis-pulas操纵数据库
@Repository
@Mapper
public interface SiteInfoDao extends BaseMapper<SiteInfo> {
    SiteInfo getSiteInfoById(Integer id);
}
