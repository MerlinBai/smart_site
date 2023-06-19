package com.ruoyi.inform.mapper;

import java.util.List;
import com.ruoyi.inform.domain.UserInformStatus;

/**
 * 用户通知状态信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-05-27
 */
public interface UserInformStatusMapper 
{
    /**
     * 查询用户通知状态信息
     * 
     * @param id 用户通知状态信息主键
     * @return 用户通知状态信息
     */
    public UserInformStatus selectUserInformStatusById(Long id);

    /**
     * 查询用户通知状态信息列表
     * 
     * @param userInformStatus 用户通知状态信息
     * @return 用户通知状态信息集合
     */
    public List<UserInformStatus> selectUserInformStatusList(UserInformStatus userInformStatus);

    /**
     * 新增用户通知状态信息
     * 
     * @param userInformStatus 用户通知状态信息
     * @return 结果
     */
    public int insertUserInformStatus(UserInformStatus userInformStatus);

    /**
     * 修改用户通知状态信息
     * 
     * @param userInformStatus 用户通知状态信息
     * @return 结果
     */
    public int updateUserInformStatus(UserInformStatus userInformStatus);

    /**
     * 删除用户通知状态信息
     * 
     * @param id 用户通知状态信息主键
     * @return 结果
     */
    public int deleteUserInformStatusById(Long id);

    /**
     * 批量删除用户通知状态信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserInformStatusByIds(Long[] ids);
}
