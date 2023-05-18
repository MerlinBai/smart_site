package com.ruoyi.web.controller.inform;

import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.inform.domain.Inform;
import com.ruoyi.inform.service.IInformService;
import com.ruoyi.system.service.ISysUserService;
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
import com.ruoyi.common.core.page.TableDataInfo;

import java.util.List;

/**
 * 通知Controller
 * 
 * @author ruoyi
 * @date 2023-05-17
 */
@RestController
@RequestMapping("/inform/inform")
public class InformController extends BaseController
{
    @Autowired
    private IInformService informService;

    @Autowired
    private ISysUserService sysUserService;

    /**
     * 查询通知列表
     */
//    @PreAuthorize("@ss.hasPermi('inform:inform:list')")
    @GetMapping("/list")
    public TableDataInfo list(Inform inform)
    {
        startPage();
        List<Inform> list = informService.selectInformList(inform);
        return getDataTable(list);
    }

    /**
     * 导出通知列表
     */
//    @PreAuthorize("@ss.hasPermi('inform:inform:export')")
    @Log(title = "通知", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Inform inform)
    {
        List<Inform> list = informService.selectInformList(inform);
        ExcelUtil<Inform> util = new ExcelUtil<Inform>(Inform.class);
        util.exportExcel(response, list, "通知数据");
    }

    /**
     * 获取通知详细信息
     */
//    @PreAuthorize("@ss.hasPermi('inform:inform:query')")
    @GetMapping(value = "/{informId}")
    public AjaxResult getInfo(@PathVariable("informId") Long informId)
    {
        return success(informService.selectInformByInformId(informId));
    }

    /**
     * 新增通知
     */
//    @PreAuthorize("@ss.hasPermi('inform:inform:add')")
    @Log(title = "通知", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Inform inform)
    {
        return toAjax(informService.insertInform(inform));
    }

    /**
     * 修改通知
     */
//    @PreAuthorize("@ss.hasPermi('inform:inform:edit')")
    @Log(title = "通知", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Inform inform)
    {
        return toAjax(informService.updateInform(inform));
    }

    /**
     * 删除通知
     */
//    @PreAuthorize("@ss.hasPermi('inform:inform:remove')")
    @Log(title = "通知", businessType = BusinessType.DELETE)
	@DeleteMapping("/{informIds}")
    public AjaxResult remove(@PathVariable Long[] informIds)
    {
        return toAjax(informService.deleteInformByInformIds(informIds));
    }
}
