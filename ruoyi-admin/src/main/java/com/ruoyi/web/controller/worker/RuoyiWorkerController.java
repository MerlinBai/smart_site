package com.ruoyi.web.controller.worker;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.worker.domain.Message;
import com.ruoyi.worker.domain.RuoyiWorker;
import com.ruoyi.worker.mapper.RuoyiTypeMapper;
import com.ruoyi.worker.mapper.RuoyiWorkerTypeMapper;
import com.ruoyi.worker.service.IRuoyiWorkerService;
import io.swagger.models.auth.In;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
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

    @Autowired
    private RuoyiTypeMapper ruoyiTypeMapper;


    /**
     * 查询员工管理列表
     */
//    @PreAuthorize("@ss.hasPermi('system:worker:list')")
    @GetMapping("/list")
    public TableDataInfo list(RuoyiWorker ruoyiWorker, Integer pageNum, Integer pageSize)
    {
        startPage();
        List<Long> autId = new ArrayList<>();
        for(String aut : ruoyiWorker.getAuthenticationList()){
            if(aut.equals("已认证"))
                autId.add(2L);
            else if(aut.equals("待审核"))
                autId.add(1L);
        }
        List<RuoyiWorker> list = ruoyiWorkerService.selectRuoyiWorkerList(ruoyiWorker.getWorkerTypeNames(),autId,ruoyiWorker.getName(),false);
        int total = list.size();
        return getDataTable(list.subList((pageNum - 1) * pageSize , Math.min((pageNum - 1) * pageSize + 10,list.size())) , total);
    }

    /**
     * 导出员工管理列表
     */
//    @PreAuthorize("@ss.hasPermi('system:worker:export')")
    @Log(title = "员工管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RuoyiWorker ruoyiWorker)
    {
        List<String> workerTypeName = ruoyiTypeMapper.selectAllName();
        List<Long> aut = new ArrayList<>();
        aut.add(0L);
        aut.add(1L);
        List<RuoyiWorker> list = ruoyiWorkerService.selectRuoyiWorkerList(workerTypeName,aut,null,true);
        for(RuoyiWorker worker : list){
            if(worker.getSex() == 0) worker.setSexName("男");
            else if(worker.getSex() == 1) worker.setSexName("女");
            else worker.setSexName("其他");

            if(worker.getPolStatus() == 0) worker.setPolStatusName("群众");
            else if(worker.getPolStatus() == 1) worker.setPolStatusName("党员");
            else worker.setPolStatusName("其他");

            if(worker.getAuthentication() == 0) worker.setAuthenticationName("待处理");
            else if(worker.getAuthentication() == 1) worker.setAuthenticationName("已认证");
            else worker.setAuthenticationName("未知");
        }
        ExcelUtil<RuoyiWorker> util = new ExcelUtil<RuoyiWorker>(RuoyiWorker.class);
        util.exportExcel(response, list, "员工管理数据");
    }

    /**
     * 获取员工管理详细信息
     */
//    @PreAuthorize("@ss.hasPermi('system:worker:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ruoyiWorkerService.selectRuoyiWorkerById(id));
    }

    /**
     * 新增员工管理
     */
//    @PreAuthorize("@ss.hasPermi('system:worker:add')")
    @Log(title = "员工管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RuoyiWorker ruoyiWorker)
    {
        return toAjax(ruoyiWorkerService.insertRuoyiWorker(ruoyiWorker));
    }

    /**
     * 修改员工管理
     */
//    @PreAuthorize("@ss.hasPermi('system:worker:edit')")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RuoyiWorker ruoyiWorker)
    {
        return toAjax(ruoyiWorkerService.updateRuoyiWorker(ruoyiWorker));
    }

    /**
     * 修改员工认证信息
     */
//    @PreAuthorize("@ss.hasPermi('system:worker:remove')")
    @Log(title = "员工管理", businessType = BusinessType.DELETE)
	@PutMapping("/{ids}")
    public AjaxResult updateAut(@PathVariable Long[] ids)
    {
        return toAjax(ruoyiWorkerService.updateAutRuoyiWorkerByIds(ids));
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<RuoyiWorker> util = new ExcelUtil<>(RuoyiWorker.class);
        util.importTemplateExcel(response, "员工数据");
    }
    /**
     * 导入员工信息
     */
    @Log(title = "员工管理", businessType = BusinessType.IMPORT)
//    @PreAuthorize("@ss.hasPermi('system:worker:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<RuoyiWorker> util = new ExcelUtil<>(RuoyiWorker.class);
        List<RuoyiWorker> workerList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = ruoyiWorkerService.importWorker(workerList,updateSupport,operName);
        return success(message);
    }

    @GetMapping("/details")
    public AjaxResult selectDetails(RuoyiWorker ruoyiWorker){
        return success(ruoyiWorkerService.selectDetails(ruoyiWorker.getId()));
    }

    /*
     * 有关认证审核的操作
     */
    @PutMapping("/authentication")
    public AjaxResult updateAuthentication(RuoyiWorker ruoyiWorker){
        return success(ruoyiWorkerService.updateAuthentication(ruoyiWorker));
    }

    /**
     * 查看消息
     * @param ruoyiWorker
     * @return
     */
    @PutMapping("/updatemsg")
    public AjaxResult updateMsgRead(RuoyiWorker ruoyiWorker) {
        ruoyiWorkerService.updatemsg(ruoyiWorker);
        return success();
    }

    /**
     * 查询消息列表
     * @return
     */
    @PostMapping("/message")
    public AjaxResult selmsg(Long id) {
        return success(ruoyiWorkerService.list(id));
    }
}
