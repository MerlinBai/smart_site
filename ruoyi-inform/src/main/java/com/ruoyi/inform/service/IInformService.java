package com.ruoyi.inform.service;


import com.ruoyi.inform.domain.Inform;

import java.util.List;

/**
 * 通知Service接口
 *
 * @author ruoyi
 * @date 2023-05-17
 */
public interface IInformService
{
    /**
     * 查询通知
     *
     * @param informId 通知主键
     * @return 通知
     */
    public Inform selectInformByInformId(Long informId);

    /**
     * 查询通知列表
     *
     * @param inform 通知
     * @return 通知集合
     */
    public List<Inform> selectInformList(Inform inform);

    /**
     * 新增通知
     *
     * @param inform 通知
     * @return 结果
     */
    public int insertInform(Inform inform);

    /**
     * 修改通知
     *
     * @param inform 通知
     * @return 结果
     */
    public int updateInform(Inform inform);

    /**
     * 批量删除通知
     *
     * @param informIds 需要删除的通知主键集合
     * @return 结果
     */
    public int deleteInformByInformIds(Long[] informIds);

    /**
     * 删除通知信息
     *
     * @param informId 通知主键
     * @return 结果
     */
    public int deleteInformByInformId(Long informId);
}
