package com.ruoyi.web.controller.inform;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.inform.domain.Inform;
import com.ruoyi.inform.domain.UserInformStatus;
import com.ruoyi.inform.service.IInformService;
import com.ruoyi.inform.service.IUserInformStatusService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.core.page.TableDataInfo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 通知Controller
 *
 * @author ruoyi
 * @date 2023-05-17
 */
@Anonymous
@RestController
@RequestMapping("/inform/inform")
public class InformController extends BaseController
{
    @Autowired
    private IInformService informService;

    @Autowired
    private ISysUserService userService;

    @Resource
    private IUserInformStatusService userInformStatusService;

    /**
     * 查询通知列表
     */
    @Anonymous
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
    @Anonymous
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
    @Anonymous
    @GetMapping(value = "/{informId}")
    public AjaxResult getInfo(@PathVariable("informId") Long informId, UserInformStatus userInformStatus)
    {
        List<UserInformStatus> userInformStatusList = userInformStatusService.selectUserInformStatusList(userInformStatus);

        List<UserInformStatus> list = new ArrayList<>();

        for (int i = 0; i < userInformStatusList.size(); i++) {
            if (userInformStatusList.get(i).getInformId() == informId.longValue()) {
                list.add(userInformStatusList.get(i));
            }
        }
        for (int i = 0; i < list.size(); i++) {

            if (list.get(i).getUserId().longValue() == SecurityUtils.getUserId().longValue()) {
                list.get(i).setStatus("0");
                list.get(i).setTime(LocalDateTime.now());
                userInformStatusService.updateUserInformStatus(list.get(i));
            }
        }
        return success(informService.selectInformByInformId(informId));
    }

    /**
     * 新增通知
     */
    @Anonymous
//    @PreAuthorize("@ss.hasPermi('inform:inform:add')")
    @Log(title = "通知", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Inform inform, SysUser user)
    {
        int resultcount = informService.insertInform(inform);


        List<SysUser> userList = userService.selectUserList(user);
        TableDataInfo dataTable = getDataTable(userList);

        userService.selectUserList(user);

//        System.out.println(dataTable.getRows());

//        SysUser user1 = (SysUser) dataTable.getRows().get(0);
//        System.out.println(user1.getUserId());

        for (int i = 0; i < dataTable.getTotal(); i++) {
            UserInformStatus userInformStatus = new UserInformStatus();
            userInformStatus.setInformId(inform.getInformId());
            userInformStatus.setInformTitle(inform.getInformTitle());

            SysUser sysUser = (SysUser) dataTable.getRows().get(i);

            userInformStatus.setUserId(sysUser.getUserId());
            userInformStatus.setUserName(sysUser.getUserName());
            userInformStatus.setNickName(sysUser.getNickName());
            userInformStatus.setStatus("1");
            userInformStatus.setTime(LocalDateTime.now());

            userInformStatusService.insertUserInformStatus(userInformStatus);
        }


        return toAjax(resultcount);
    }

    /**
     * 修改通知
     */
    @Anonymous
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
    @Anonymous
//    @PreAuthorize("@ss.hasPermi('inform:inform:remove')")
    @Log(title = "通知", businessType = BusinessType.DELETE)
    @DeleteMapping("/{informIds}")
    public AjaxResult remove(@PathVariable Long[] informIds)
    {
        return toAjax(informService.deleteInformByInformIds(informIds));
    }
}
