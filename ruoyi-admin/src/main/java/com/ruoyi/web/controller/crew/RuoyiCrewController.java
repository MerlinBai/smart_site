package com.ruoyi.web.controller.crew;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.crew.mapper.RuoyiCrewMapper;
import com.ruoyi.project.domain.Project;
import com.ruoyi.worker.domain.RuoyiWorker;
import com.ruoyi.worker.mapper.RuoyiWorkerMapper;
import org.apache.ibatis.annotations.Select;
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
import com.ruoyi.crew.domain.RuoyiCrew;
import com.ruoyi.crew.service.IRuoyiCrewService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 施工队信息Controller
 * 
 * @author ruoyi
 * @date 2023-06-07
 *
 */

@Anonymous
@RestController
@RequestMapping("/crew/crew")

public class RuoyiCrewController extends BaseController
{
    @Autowired
    private IRuoyiCrewService ruoyiCrewService;
    @Autowired
    private RuoyiCrewMapper ruoyiCrewMapper;
    @Autowired
    private RuoyiWorkerMapper ruoyiWorkerMapper;

    /**
     * 查询施工队信息列表
     */
//    @PreAuthorize("@ss.hasPermi('crew:crew:list')")
    @GetMapping("/list")
    public TableDataInfo list(RuoyiCrew ruoyiCrew, Project project, RuoyiWorker worker)
    {

        startPage();
        List<RuoyiCrew> list = ruoyiCrewService.selectRuoyiCrewList(ruoyiCrew,project);
        List<RuoyiWorker> workers =ruoyiWorkerMapper.selectRuoyiWorkerList(worker);
        for (RuoyiCrew crew:list){
            for (RuoyiWorker work: workers) {
                if(crew.getCrewId().equals(work.getCrewId()))
                {

                    crew.setPopualtion(crew.getPopualtion()+1L);
                }
            }

        }
        return getDataTable(list);
    }

    /**
     * 导出施工队信息列表
     */
//    @PreAuthorize("@ss.hasPermi('crew:crew:export')")
    @Log(title = "施工队信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RuoyiCrew ruoyiCrew, Project project)
    {
        List<RuoyiCrew> list = ruoyiCrewService.selectRuoyiCrewList(ruoyiCrew ,project);
        ExcelUtil<RuoyiCrew> util = new ExcelUtil<RuoyiCrew>(RuoyiCrew.class);
        util.exportExcel(response, list, "施工队信息数据");
    }

    /**
     * 获取施工队信息详细信息
     */
//    @PreAuthorize("@ss.hasPermi('crew:crew:query')")
    @GetMapping(value = "/{crewId}")
    public AjaxResult getInfo(@PathVariable("crewId") Long crewId, Project project)
    {
        return success(ruoyiCrewService.selectRuoyiCrewByCrewId(crewId,project));
    }

    /**
     * 新增施工队信息
     */
//    @PreAuthorize("@ss.hasPermi('crew:crew:add')")
    @Log(title = "施工队信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RuoyiCrew ruoyiCrew)
    {
        return toAjax(ruoyiCrewService.insertRuoyiCrew(ruoyiCrew));
    }

    /**
     * 修改施工队信息
     */
//    @PreAuthorize("@ss.hasPermi('crew:crew:edit')")
    @Log(title = "施工队信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RuoyiCrew ruoyiCrew)
    {
        return toAjax(ruoyiCrewService.updateRuoyiCrew(ruoyiCrew));
    }

    /**
     * 删除施工队信息
     */
//    @PreAuthorize("@ss.hasPermi('crew:crew:remove')")
    @Log(title = "施工队信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{crewIds}")
    public AjaxResult remove(@PathVariable Long[] crewIds)
    {
        return toAjax(ruoyiCrewService.deleteRuoyiCrewByCrewIds(crewIds));
    }
    @Anonymous
    @GetMapping("/finish/{projectId}")
    public AjaxResult finish(@PathVariable Integer projectId)
    {
        return success(ruoyiCrewService.selectFinshProject(projectId));
    }

}
