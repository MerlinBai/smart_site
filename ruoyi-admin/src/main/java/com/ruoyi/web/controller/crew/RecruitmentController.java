package com.ruoyi.web.controller.crew;

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
import com.ruoyi.recruitment.domain.Recruitment;
import com.ruoyi.recruitment.service.IRecruitmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 招聘公告Controller
 *
 * @author ruoyi
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/recruitment/recruitment")
public class RecruitmentController extends BaseController
{
    @Autowired
    private IRecruitmentService recruitmentService;

    /**
     * 查询招聘公告列表
     */
//    @PreAuthorize("@ss.hasPermi('recruitment:recruitment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Recruitment recruitment)
    {
        startPage();
        List<Recruitment> list = recruitmentService.selectRecruitmentList(recruitment);
        return getDataTable(list);
    }

    /**
     * 导出招聘公告列表
     */
//    @PreAuthorize("@ss.hasPermi('recruitment:recruitment:export')")
    @Log(title = "招聘公告", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Recruitment recruitment)
    {
        List<Recruitment> list = recruitmentService.selectRecruitmentList(recruitment);
        list.forEach(s -> {
            if (s.getItemStatus().equals("0")) {
                s.setItemStatus("正在招聘");
            }else {
                s.setItemStatus("停止招聘");
            }
        });
        ExcelUtil<Recruitment> util = new ExcelUtil<Recruitment>(Recruitment.class);
        util.exportExcel(response, list, "招聘公告数据");
    }

    /**
     * 获取招聘公告详细信息
     */
//    @PreAuthorize("@ss.hasPermi('recruitment:recruitment:query')")
    @GetMapping(value = "/{itemId}")
    public AjaxResult getInfo(@PathVariable("itemId") Long itemId)
    {
        return success(recruitmentService.selectRecruitmentByItemId(itemId));
    }

    /**
     * 新增招聘公告
     */
//    @PreAuthorize("@ss.hasPermi('recruitment:recruitment:add')")
    @Log(title = "招聘公告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Recruitment recruitment)
    {
        return toAjax(recruitmentService.insertRecruitment(recruitment));
    }

    /**
     * 修改招聘公告
     */
//    @PreAuthorize("@ss.hasPermi('recruitment:recruitment:edit')")
    @Log(title = "招聘公告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Recruitment recruitment)
    {
        return toAjax(recruitmentService.updateRecruitment(recruitment));
    }

    /**
     * 删除招聘公告
     */
//    @PreAuthorize("@ss.hasPermi('recruitment:recruitment:remove')")
    @Log(title = "招聘公告", businessType = BusinessType.DELETE)
    @DeleteMapping("/{itemIds}")
    public AjaxResult remove(@PathVariable Long[] itemIds)
    {
        return toAjax(recruitmentService.deleteRecruitmentByItemIds(itemIds));
    }
}
