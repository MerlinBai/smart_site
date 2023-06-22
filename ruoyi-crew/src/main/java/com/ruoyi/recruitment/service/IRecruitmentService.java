package com.ruoyi.recruitment.service;

import java.util.List;
import com.ruoyi.recruitment.domain.Recruitment;

/**
 * 招聘公告Service接口
 *
 * @author ruoyi
 * @date 2023-06-20
 */
public interface IRecruitmentService
{
    /**
     * 查询招聘公告
     *
     * @param itemId 招聘公告主键
     * @return 招聘公告
     */
    public Recruitment selectRecruitmentByItemId(Long itemId);

    /**
     * 查询招聘公告列表
     *
     * @param recruitment 招聘公告
     * @return 招聘公告集合
     */
    public List<Recruitment> selectRecruitmentList(Recruitment recruitment);

    /**
     * 新增招聘公告
     *
     * @param recruitment 招聘公告
     * @return 结果
     */
    public int insertRecruitment(Recruitment recruitment);

    /**
     * 修改招聘公告
     *
     * @param recruitment 招聘公告
     * @return 结果
     */
    public int updateRecruitment(Recruitment recruitment);

    /**
     * 批量删除招聘公告
     *
     * @param itemIds 需要删除的招聘公告主键集合
     * @return 结果
     */
    public int deleteRecruitmentByItemIds(Long[] itemIds);

    /**
     * 删除招聘公告信息
     *
     * @param itemId 招聘公告主键
     * @return 结果
     */
    public int deleteRecruitmentByItemId(Long itemId);
}
