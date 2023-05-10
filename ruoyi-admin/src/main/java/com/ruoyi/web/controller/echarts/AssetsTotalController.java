package com.ruoyi.web.controller.echarts;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.suke.pojo.AssetsTotal;
import com.ruoyi.suke.service.IAssetsTotalService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
    private IAssetsTotalService assetsTotalService;
    /**
     * 根据资产id返回资产对象
     * */
//    @Anonymous
//    @PostMapping("/findbyid")
//    public AssetsTotal findById (Integer id){
////        System.out.println(assetsTotalService.save());
//        AssetsTotal assetstotal = assetsTotalService.selectAssetsTotalById(id.toString());
//        return assetstotal;
//    }
    @Anonymous
    @PostMapping("/findbyid")
    public AjaxResult getInfo(@Param("id") String id)
    {
        return success(assetsTotalService.selectAssetsTotalById(id));
    }

}
