package com.ruoyi.web.controller.worker;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.worker.domain.RuoyiWorker;
import com.ruoyi.worker.mapper.RuoyiTypeMapper;
import com.ruoyi.worker.mapper.RuoyiWorkerTypeMapper;
import com.ruoyi.worker.service.IRuoyiWorkerService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 员工管理Controller
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
@RestController
@RequestMapping("/system/worker")
public class RuoyiWorkerController extends BaseController
{
    @Autowired
    private IRuoyiWorkerService ruoyiWorkerService;


    /**
     * 查询员工管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:worker:list')")
    @GetMapping("/list")
    public TableDataInfo list(RuoyiWorker ruoyiWorker)
    {
        startPage();
        List<RuoyiWorker> list = ruoyiWorkerService.selectRuoyiWorkerList(ruoyiWorker);
        return getDataTable(list);
    }

    /**
     * 导出员工管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:worker:export')")
    @Log(title = "员工管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RuoyiWorker ruoyiWorker)
    {
        List<RuoyiWorker> list = ruoyiWorkerService.selectRuoyiWorkerList(ruoyiWorker);
        ExcelUtil<RuoyiWorker> util = new ExcelUtil<RuoyiWorker>(RuoyiWorker.class);
        util.exportExcel(response, list, "员工管理数据");
    }

    /**
     * 获取员工管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:worker:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ruoyiWorkerService.selectRuoyiWorkerById(id));
    }

    /**
     * 新增员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:worker:add')")
    @Log(title = "员工管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RuoyiWorker ruoyiWorker)
    {
        return toAjax(ruoyiWorkerService.insertRuoyiWorker(ruoyiWorker));
    }

    /**
     * 修改员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:worker:edit')")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RuoyiWorker ruoyiWorker)
    {
        return toAjax(ruoyiWorkerService.updateRuoyiWorker(ruoyiWorker));
    }

    /**
     * 删除员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:worker:remove')")
    @Log(title = "员工管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ruoyiWorkerService.deleteRuoyiWorkerByIds(ids));
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<RuoyiWorker> util = new ExcelUtil<>(RuoyiWorker.class);
        util.importTemplateExcel(response, "员工数据");
    }

    @Log(title = "员工管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('system:worker:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<RuoyiWorker> util = new ExcelUtil<>(RuoyiWorker.class);
        List<RuoyiWorker> workerList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = ruoyiWorkerService.importWorker(workerList,updateSupport,operName);
        return success(message);
    }
}
