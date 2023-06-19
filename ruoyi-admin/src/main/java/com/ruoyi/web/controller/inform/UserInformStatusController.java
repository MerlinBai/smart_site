package com.ruoyi.web.controller.inform;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.inform.domain.UserInformStatus;
import com.ruoyi.inform.service.IUserInformStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 南隐竹雨
 * @version 1.0
 * @description: TODO
 * @date 2023/5/27 21:13
 */

@Anonymous
@RestController
@RequestMapping("/inform/status")
public class UserInformStatusController extends BaseController {

    @Autowired
    private IUserInformStatusService userInformStatusService;


    /**
     * 获取该用户的所有通知信息状态
     * @param userInformStatus
     * @return
     */
    @Anonymous
    @GetMapping("/list")
    public AjaxResult getInfo(UserInformStatus userInformStatus) {

        Long userId = SecurityUtils.getUserId();

        List<UserInformStatus> userInformStatusList = userInformStatusService.selectUserInformStatusList(userInformStatus);
        List<UserInformStatus> list = new ArrayList<>();

        for (int i = 0; i < userInformStatusList.size(); i++) {

//            if (userInformStatusList.get(i).getUserId().equals(1L)) {
//                list.add(userInformStatusList.get(i));
//            }
            if (userInformStatusList.get(i).getUserId().equals(userId)) {
                list.add(userInformStatusList.get(i));
            }
        }

        return success(list);
    }
}
