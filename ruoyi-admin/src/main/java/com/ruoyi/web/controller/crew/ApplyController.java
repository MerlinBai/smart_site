package com.ruoyi.web.controller.crew;

import java.security.Security;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.recruitment.domain.Recruitment;
import com.ruoyi.recruitment.mapper.RecruitmentMapper;
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
import com.ruoyi.apply.domain.Apply;
import com.ruoyi.apply.service.IApplyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 应聘人信息Controller
 * 
 * @author ruoyi
 * @date 2023-06-21
 */
@RestController
@RequestMapping("/apply/apply")
public class ApplyController extends BaseController
{
    @Autowired
    private IApplyService applyService;

    @Autowired
    private RecruitmentMapper recruitmentMapper;

    /**
     * 查询应聘人信息列表
     */
//    @PreAuthorize("@ss.hasPermi('apply:apply:list')")
    @GetMapping("/list")
    public TableDataInfo list(Apply apply)
    {
        startPage();
        List<Apply> list = applyService.selectApplyList(apply);
        return getDataTable(list);
    }

    /**
     * 导出应聘人信息列表
     */
//    @PreAuthorize("@ss.hasPermi('apply:apply:export')")
    @Log(title = "应聘人信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Apply apply)
    {
        List<Apply> list = applyService.selectApplyList(apply);
        ExcelUtil<Apply> util = new ExcelUtil<Apply>(Apply.class);
        util.exportExcel(response, list, "应聘人信息数据");
    }

    /**
     * 获取应聘人信息详细信息
     */
//    @PreAuthorize("@ss.hasPermi('apply:apply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return success(applyService.selectApplyByApplyId(applyId));
    }

    /**
     * 查询当前用户是否已经报名当前项目
     */
    @GetMapping("/isapply")
    public AjaxResult isApply(@RequestBody Recruitment recruitment, Apply apply) {

        List<Apply> applies = applyService.selectApplyList(apply);

        for (int i = 0; i < applies.size(); i++) {
            if (recruitment.getItemName().equals(applies.get(i).getItemName())) {
                return AjaxResult.success("已报名该项目");
            }
        }
        return AjaxResult.success("未报名该项目");

    }

    /**
     * 新增应聘人信息
     */
//    @PreAuthorize("@ss.hasPermi('apply:apply:add')")
    @Log(title = "应聘人信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Recruitment recruitment, Apply apply)
    {
        if (recruitment.getItemStatus().equals("1")) {
            return AjaxResult.success("改项目已停止招聘");
        }

        SysUser user = SecurityUtils.getLoginUser().getUser();
        apply.setItemId(recruitment.getItemId());
        apply.setItemName(recruitment.getItemName());
        apply.setWorkerRequire(recruitment.getWorkerRequire());
        apply.setApplyUser(user.getNickName());
        apply.setApplyPhone(user.getPhonenumber());

        return toAjax(applyService.insertApply(apply));
    }

    /**
     * 修改应聘人信息
     */
//    @PreAuthorize("@ss.hasPermi('apply:apply:edit')")
    @Log(title = "应聘人信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Apply apply)
    {
        return toAjax(applyService.updateApply(apply));
    }

    /**
     * 删除应聘人信息
     */
//    @PreAuthorize("@ss.hasPermi('apply:apply:remove')")
    @Log(title = "应聘人信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(applyService.deleteApplyByApplyIds(applyIds));
    }
}
