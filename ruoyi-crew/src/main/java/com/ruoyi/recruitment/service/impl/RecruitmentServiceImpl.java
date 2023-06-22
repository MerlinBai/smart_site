package com.ruoyi.recruitment.service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.recruitment.mapper.RecruitmentMapper;
import com.ruoyi.recruitment.domain.Recruitment;
import com.ruoyi.recruitment.service.IRecruitmentService;

/**
 * 招聘公告Service业务层处理
 *
 * @author ruoyi
 * @date 2023-06-20
 */
@Service
public class RecruitmentServiceImpl implements IRecruitmentService
{
    @Autowired
    private RecruitmentMapper recruitmentMapper;

    /**
     * 查询招聘公告
     *
     * @param itemId 招聘公告主键
     * @return 招聘公告
     */
    @Override
    public Recruitment selectRecruitmentByItemId(Long itemId)
    {
        return recruitmentMapper.selectRecruitmentByItemId(itemId);
    }

    /**
     * 查询招聘公告列表
     *
     * @param recruitment 招聘公告
     * @return 招聘公告
     */
    @Override
    public List<Recruitment> selectRecruitmentList(Recruitment recruitment)
    {
        List<Recruitment> recruitments = recruitmentMapper.selectRecruitmentList(recruitment);

        Collections.sort(recruitments, new Comparator<Recruitment>() {
            @Override
            public int compare(Recruitment o1, Recruitment o2) {
//                return o2.getReleaseTime().compareTo(o1.getReleaseTime());
                return (int) (o2.getItemId() - o1.getItemId());
            }
        });

        return recruitments;
    }

    /**
     * 新增招聘公告
     *
     * @param recruitment 招聘公告
     * @return 结果
     */
    @Override
    public int insertRecruitment(Recruitment recruitment)
    {
        recruitment.setReleaseTime(LocalDate.now());
        return recruitmentMapper.insertRecruitment(recruitment);
    }

    /**
     * 修改招聘公告
     *
     * @param recruitment 招聘公告
     * @return 结果
     */
    @Override
    public int updateRecruitment(Recruitment recruitment)
    {
        return recruitmentMapper.updateRecruitment(recruitment);
    }

    /**
     * 批量删除招聘公告
     *
     * @param itemIds 需要删除的招聘公告主键
     * @return 结果
     */
    @Override
    public int deleteRecruitmentByItemIds(Long[] itemIds)
    {
        return recruitmentMapper.deleteRecruitmentByItemIds(itemIds);
    }

    /**
     * 删除招聘公告信息
     *
     * @param itemId 招聘公告主键
     * @return 结果
     */
    @Override
    public int deleteRecruitmentByItemId(Long itemId)
    {
        return recruitmentMapper.deleteRecruitmentByItemId(itemId);
    }
}
