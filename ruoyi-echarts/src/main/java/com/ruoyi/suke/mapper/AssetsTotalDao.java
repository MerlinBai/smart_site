package com.ruoyi.suke.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.suke.pojo.AssetsTotal;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 操纵数据库
 *
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 9:46
 */
//mybatis-pulas操纵数据库
@Repository
@Mapper
public interface AssetsTotalDao extends BaseMapper<AssetsTotal> {
    AssetsTotal selectById(Integer id);
}
