package com.ruoyi.inform.mapper;


import com.ruoyi.inform.domain.Inform;

import java.util.List;

/**
 * 通知Mapper接口
 * 
 * @author ruoyi
 * @date 2023-05-17
 */
public interface InformMapper 
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
     * 删除通知
     * 
     * @param informId 通知主键
     * @return 结果
     */
    public int deleteInformByInformId(Long informId);

    /**
     * 批量删除通知
     * 
     * @param informIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInformByInformIds(Long[] informIds);
}
