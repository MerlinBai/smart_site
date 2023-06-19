package com.ruoyi.web.controller.echarts;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.suke.pojo.AssetsTotal;
import com.ruoyi.suke.service.AssetsTotalService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 数据总数控制器
 *
 * @author Li Sipeng
 * @version 4.1 on   2022-11-28 9:31
 */
@Anonymous
@RestController
@CrossOrigin
@RequestMapping("/assetstotal")
public class AssetsTotalController extends BaseController {
    @Autowired
    private AssetsTotalService assetstotalservice;

    @Anonymous
    @RequestMapping("/findbyid")
    public AssetsTotal findById (Integer id){
        AssetsTotal assetstotal = assetstotalservice.findById(id);
        System.out.println(assetstotal);
        return assetstotal;
    }

}
