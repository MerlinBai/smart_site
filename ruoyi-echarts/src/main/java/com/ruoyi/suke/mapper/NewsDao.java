package com.ruoyi.suke.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.suke.pojo.News;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-12-01 8:59
 */
@Mapper
@Repository
public interface NewsDao extends BaseMapper<News> {

    /**
     * 获取所有安防新闻
     * */
    List<News> getNewsInfo();


}
