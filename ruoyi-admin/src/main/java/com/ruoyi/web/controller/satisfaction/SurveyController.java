package com.ruoyi.web.controller.satisfaction;

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
import com.ruoyi.satisfaction.domain.Survey;
import com.ruoyi.satisfaction.service.ISurveyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 满意度检查Controller
 * 
 * @author ruoyi
 * @date 2023-06-18
 */
@RestController
@RequestMapping("/satisfaction/survey")
public class SurveyController extends BaseController
{
    @Autowired
    private ISurveyService surveyService;

    /**
     * 查询满意度检查列表
     */
//    @PreAuthorize("@ss.hasPermi('satisfaction:survey:list')")
    @GetMapping("/list")
    public TableDataInfo list(Survey survey)
    {
        startPage();
        List<Survey> list = surveyService.selectSurveyList(survey);
        return getDataTable(list);
    }

    /**
     * 导出满意度检查列表
     */
//    @PreAuthorize("@ss.hasPermi('satisfaction:survey:export')")
    @Log(title = "满意度检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Survey survey)
    {
        List<Survey> list = surveyService.selectSurveyList(survey);
        ExcelUtil<Survey> util = new ExcelUtil<Survey>(Survey.class);
        util.exportExcel(response, list, "满意度检查数据");
    }

    /**
     * 获取满意度检查详细信息
     */
//    @PreAuthorize("@ss.hasPermi('satisfaction:survey:query')")
    @GetMapping(value = "/{surveyId}")
    public AjaxResult getInfo(@PathVariable("surveyId") Long surveyId)
    {
        return success(surveyService.selectSurveyBySurveyId(surveyId));
    }

    /**
     * 新增满意度检查
     */
//    @PreAuthorize("@ss.hasPermi('satisfaction:survey:add')")
    @Log(title = "满意度检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Survey survey)
    {
        return toAjax(surveyService.insertSurvey(survey));
    }

    /**
     * 修改满意度检查
     */
//    @PreAuthorize("@ss.hasPermi('satisfaction:survey:edit')")
    @Log(title = "满意度检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Survey survey)
    {
        return toAjax(surveyService.updateSurvey(survey));
    }

    /**
     * 删除满意度检查
     */
//    @PreAuthorize("@ss.hasPermi('satisfaction:survey:remove')")
    @Log(title = "满意度检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{surveyIds}")
    public AjaxResult remove(@PathVariable Long[] surveyIds)
    {
        return toAjax(surveyService.deleteSurveyBySurveyIds(surveyIds));
    }
}
