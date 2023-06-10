package com.ruoyi.web.controller.map;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.lingchengqumap.domain.LingchengMap;
import com.ruoyi.lingchengqumap.service.ILingchengMapService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 陵城区区域Controller
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
@RestController
@RequestMapping("/lingchengqumap/lingchengqumap")
public class LingchengMapController extends BaseController
{
    @Autowired
    private ILingchengMapService lingchengMapService;

    /**
     * 查询陵城区区域列表
     */
//    @PreAuthorize("@ss.hasPermi('lingchengqumap:lingchengqumap:list')")
    @GetMapping("/list")
    public TableDataInfo list(LingchengMap lingchengMap)
    {
        startPage();
        List<LingchengMap> list = lingchengMapService.selectLingchengMapList(lingchengMap);
        return getDataTable(list);
    }

    /**
     * 导出陵城区区域列表
     */
//    @PreAuthorize("@ss.hasPermi('lingchengqumap:lingchengqumap:export')")
    @Log(title = "陵城区区域", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LingchengMap lingchengMap)
    {
        List<LingchengMap> list = lingchengMapService.selectLingchengMapList(lingchengMap);
        ExcelUtil<LingchengMap> util = new ExcelUtil<LingchengMap>(LingchengMap.class);
        util.exportExcel(response, list, "陵城区区域数据");
    }

    /**
     * 获取陵城区区域详细信息
     */
//    @PreAuthorize("@ss.hasPermi('lingchengqumap:lingchengqumap:query')")
    @GetMapping(value = "/{mapId}")
    public AjaxResult getInfo(@PathVariable("mapId") Long mapId)
    {
        return success(lingchengMapService.selectLingchengMapByMapId(mapId));
    }

    /**
     * 新增陵城区区域
     */
//    @PreAuthorize("@ss.hasPermi('lingchengqumap:lingchengqumap:add')")
    @Log(title = "陵城区区域", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LingchengMap lingchengMap)
    {
        return toAjax(lingchengMapService.insertLingchengMap(lingchengMap));
    }

    /**
     * 修改陵城区区域
     */
//    @PreAuthorize("@ss.hasPermi('lingchengqumap:lingchengqumap:edit')")
    @Log(title = "陵城区区域", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LingchengMap lingchengMap)
    {
        return toAjax(lingchengMapService.updateLingchengMap(lingchengMap));
    }

    /**
     * 删除陵城区区域
     */
//    @PreAuthorize("@ss.hasPermi('lingchengqumap:lingchengqumap:remove')")
    @Log(title = "陵城区区域", businessType = BusinessType.DELETE)
	@DeleteMapping("/{mapIds}")
    public AjaxResult remove(@PathVariable Long[] mapIds)
    {
        return toAjax(lingchengMapService.deleteLingchengMapByMapIds(mapIds));
    }
}
