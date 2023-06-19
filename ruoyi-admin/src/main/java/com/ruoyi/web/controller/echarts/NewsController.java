package com.ruoyi.web.controller.echarts;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.suke.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-12-01 8:52
 */
@Anonymous
@RestController
@RequestMapping("/news")
@CrossOrigin
public class NewsController {
    @Autowired
    private NewsService newsservice;

    @Anonymous
    @RequestMapping("/getnews")
    public List getNews(){
        List newsList = newsservice.getNewsInfo();
        return newsList;
    }
}
