package com.ruoyi.inform.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.inform.domain.Inform;
import com.ruoyi.inform.mapper.InformMapper;
import com.ruoyi.inform.service.IInformService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 通知Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-05-17
 */
@Service
public class InformServiceImpl implements IInformService
{
    @Autowired
    private InformMapper informMapper;

    @Autowired
    private ISysUserService sysUserService;


    /**
     * 查询通知
     * 
     * @param informId 通知主键
     * @return 通知
     */
    @Override
    public Inform selectInformByInformId(Long informId)
    {
        return informMapper.selectInformByInformId(informId);
    }

    /**
     * 查询通知列表
     * 
     * @param inform 通知
     * @return 通知
     */
    @Override
    public List<Inform> selectInformList(Inform inform)
    {
        return informMapper.selectInformList(inform);
    }

    /**
     * 新增通知
     * 
     * @param inform 通知
     * @return 结果
     */
    @Override
    public int insertInform(Inform inform)
    {
        inform.setCreateTime(DateUtils.getNowDate());
        Long userId = SecurityUtils.getUserId();
        String userName = sysUserService.selectUserById(userId).getUserName();
        inform.setCreateBy(userName);
        return informMapper.insertInform(inform);
    }

    /**
     * 修改通知
     * 
     * @param inform 通知
     * @return 结果
     */
    @Override
    public int updateInform(Inform inform)
    {
        inform.setUpdateTime(DateUtils.getNowDate());
        Long userId = SecurityUtils.getUserId();
        String userName = sysUserService.selectUserById(userId).getUserName();
        inform.setUpdateBy(userName);
        return informMapper.updateInform(inform);
    }

    /**
     * 批量删除通知
     * 
     * @param informIds 需要删除的通知主键
     * @return 结果
     */
    @Override
    public int deleteInformByInformIds(Long[] informIds)
    {
        return informMapper.deleteInformByInformIds(informIds);
    }

    /**
     * 删除通知信息
     * 
     * @param informId 通知主键
     * @return 结果
     */
    @Override
    public int deleteInformByInformId(Long informId)
    {
        return informMapper.deleteInformByInformId(informId);
    }
}