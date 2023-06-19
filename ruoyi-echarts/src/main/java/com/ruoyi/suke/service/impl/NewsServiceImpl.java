package com.ruoyi.suke.service.impl;

import com.ruoyi.suke.service.NewsService;
import com.ruoyi.suke.mapper.NewsDao;
import com.ruoyi.suke.pojo.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-12-01 8:57
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsDao newsdao;

    /**
     * 获取安防新闻列表
     *
     * @return*/
    @Override
    public List getNewsInfo() {
        //mybatis-plus实现
//        QueryWrapper queryWrapper = new QueryWrapper();
//        queryWrapper.eq("type",1);
//        List selectList = newsdao.selectList(queryWrapper);

//        我的实现
        List<News> list = newsdao.getNewsInfo();
        return list;
    }



}
