package com.ruoyi.inform.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.inform.mapper.UserInformStatusMapper;
import com.ruoyi.inform.domain.UserInformStatus;
import com.ruoyi.inform.service.IUserInformStatusService;

/**
 * 用户通知状态信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-05-27
 */
@Service
public class UserInformStatusServiceImpl implements IUserInformStatusService 
{
    @Autowired
    private UserInformStatusMapper userInformStatusMapper;

    /**
     * 查询用户通知状态信息
     * 
     * @param id 用户通知状态信息主键
     * @return 用户通知状态信息
     */
    @Override
    public UserInformStatus selectUserInformStatusById(Long id)
    {
        return userInformStatusMapper.selectUserInformStatusById(id);
    }

    /**
     * 查询用户通知状态信息列表
     * 
     * @param userInformStatus 用户通知状态信息
     * @return 用户通知状态信息
     */
    @Override
    public List<UserInformStatus> selectUserInformStatusList(UserInformStatus userInformStatus)
    {
        return userInformStatusMapper.selectUserInformStatusList(userInformStatus);
    }

    /**
     * 新增用户通知状态信息
     * 
     * @param userInformStatus 用户通知状态信息
     * @return 结果
     */
    @Override
    public int insertUserInformStatus(UserInformStatus userInformStatus)
    {
        return userInformStatusMapper.insertUserInformStatus(userInformStatus);
    }

    /**
     * 修改用户通知状态信息
     * 
     * @param userInformStatus 用户通知状态信息
     * @return 结果
     */
    @Override
    public int updateUserInformStatus(UserInformStatus userInformStatus)
    {
        return userInformStatusMapper.updateUserInformStatus(userInformStatus);
    }

    /**
     * 批量删除用户通知状态信息
     * 
     * @param ids 需要删除的用户通知状态信息主键
     * @return 结果
     */
    @Override
    public int deleteUserInformStatusByIds(Long[] ids)
    {
        return userInformStatusMapper.deleteUserInformStatusByIds(ids);
    }

    /**
     * 删除用户通知状态信息信息
     * 
     * @param id 用户通知状态信息主键
     * @return 结果
     */
    @Override
    public int deleteUserInformStatusById(Long id)
    {
        return userInformStatusMapper.deleteUserInformStatusById(id);
    }
}
