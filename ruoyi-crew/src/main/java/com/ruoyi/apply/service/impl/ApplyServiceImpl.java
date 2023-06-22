package com.ruoyi.apply.service.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.apply.mapper.ApplyMapper;
import com.ruoyi.apply.domain.Apply;
import com.ruoyi.apply.service.IApplyService;

/**
 * 应聘人信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-06-21
 */
@Service
public class ApplyServiceImpl implements IApplyService 
{
    @Autowired
    private ApplyMapper applyMapper;

    /**
     * 查询应聘人信息
     * 
     * @param applyId 应聘人信息主键
     * @return 应聘人信息
     */
    @Override
    public Apply selectApplyByApplyId(Long applyId)
    {
        return applyMapper.selectApplyByApplyId(applyId);
    }

    /**
     * 查询应聘人信息列表
     * 
     * @param apply 应聘人信息
     * @return 应聘人信息
     */
    @Override
    public List<Apply> selectApplyList(Apply apply)
    {
        List<Apply> applies = applyMapper.selectApplyList(apply);

        Collections.sort(applies, new Comparator<Apply>() {
            @Override
            public int compare(Apply o1, Apply o2) {
                return o2.getApplyTime().compareTo(o1.getApplyTime());
            }
        });

        return applies;
    }

    /**
     * 新增应聘人信息
     * 
     * @param apply 应聘人信息
     * @return 结果
     */
    @Override
    public int insertApply(Apply apply)
    {
        return applyMapper.insertApply(apply);
    }

    /**
     * 修改应聘人信息
     * 
     * @param apply 应聘人信息
     * @return 结果
     */
    @Override
    public int updateApply(Apply apply)
    {
        return applyMapper.updateApply(apply);
    }

    /**
     * 批量删除应聘人信息
     * 
     * @param applyIds 需要删除的应聘人信息主键
     * @return 结果
     */
    @Override
    public int deleteApplyByApplyIds(Long[] applyIds)
    {
        return applyMapper.deleteApplyByApplyIds(applyIds);
    }

    /**
     * 删除应聘人信息信息
     * 
     * @param applyId 应聘人信息主键
     * @return 结果
     */
    @Override
    public int deleteApplyByApplyId(Long applyId)
    {
        return applyMapper.deleteApplyByApplyId(applyId);
    }
}
