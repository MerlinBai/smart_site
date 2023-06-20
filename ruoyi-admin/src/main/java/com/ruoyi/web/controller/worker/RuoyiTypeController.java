package com.ruoyi.web.controller.worker;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.worker.domain.RuoyiType;
import com.ruoyi.worker.service.IRuoyiTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

import static com.ruoyi.common.utils.PageUtils.startPage;

/**
 * @author 马兰友
 * @Date: 2023/06/11/20:53
 */
@RestController
@RequestMapping("/system/type")
public class RuoyiTypeController extends BaseController
{
    @Autowired
    private IRuoyiTypeService ruoyiTypeService;

    /**
     * 查询工种id与工种名的对应表列表
     */
    @PreAuthorize("@ss.hasPermi('system:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(RuoyiType ruoyiType)
    {
        startPage();
        List<RuoyiType> list = ruoyiTypeService.selectRuoyiTypeList(ruoyiType);
        return getDataTable(list);
    }

    /**
     * 导出工种id与工种名的对应表列表
     */
    @PreAuthorize("@ss.hasPermi('system:type:export')")
    @Log(title = "工种id与工种名的对应表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RuoyiType ruoyiType)
    {
        List<RuoyiType> list = ruoyiTypeService.selectRuoyiTypeList(ruoyiType);
        ExcelUtil<RuoyiType> util = new ExcelUtil<>(RuoyiType.class);
        util.exportExcel(response, list, "工种id与工种名的对应表数据");
    }

    /**
     * 获取工种id与工种名的对应表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:type:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ruoyiTypeService.selectRuoyiTypeById(id));
    }

    /**
     * 新增工种id与工种名的对应表
     */
    @PreAuthorize("@ss.hasPermi('system:type:add')")
    @Log(title = "工种id与工种名的对应表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RuoyiType ruoyiType)
    {
        return toAjax(ruoyiTypeService.insertRuoyiType(ruoyiType));
    }

    /**
     * 修改工种id与工种名的对应表
     */
    @PreAuthorize("@ss.hasPermi('system:type:edit')")
    @Log(title = "工种id与工种名的对应表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RuoyiType ruoyiType)
    {
        return toAjax(ruoyiTypeService.updateRuoyiType(ruoyiType));
    }

    /**
     * 删除工种id与工种名的对应表
     */
    @PreAuthorize("@ss.hasPermi('system:type:remove')")
    @Log(title = "工种id与工种名的对应表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ruoyiTypeService.deleteRuoyiTypeByIds(ids));
    }
}
