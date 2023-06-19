package com.ruoyi.suke.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-12-01 8:47
 *
CREATE TABLE `tb_news` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '新闻标题',
`create_date` date DEFAULT NULL COMMENT '新闻日期',
`create_time` time DEFAULT NULL COMMENT '新闻时间',
`status` tinyint(4) DEFAULT NULL COMMENT '新闻状态: 0未处理 1已处理',
`type` tinyint(4) DEFAULT NULL COMMENT '新闻类型: 1:安防新闻 2:其他新闻',
`content` text COLLATE utf8mb4_bin COMMENT '新闻内容',
`deal_time` datetime DEFAULT NULL COMMENT '处理时间',
`mask` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
`site_id` int(11) DEFAULT NULL COMMENT '所属工地',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin

 */
@Data
@TableName("tb_news")
public class News {
    private Integer id;
    private String title;
//    @JsonFormat(pattern = "hh:mm:ss",timezone = "GMT+8")
    private Date createDate;
    private Date createTime;
    private Integer status;
    private Integer type;
    private String content;
    private Date dealTime;
    private String mask;
    private Integer siteId;

}
