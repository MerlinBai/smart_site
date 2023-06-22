package com.ruoyi.apply.mapper;

import java.util.List;
import com.ruoyi.apply.domain.Apply;

/**
 * 应聘人信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-06-21
 */
public interface ApplyMapper 
{
    /**
     * 查询应聘人信息
     * 
     * @param applyId 应聘人信息主键
     * @return 应聘人信息
     */
    public Apply selectApplyByApplyId(Long applyId);

    /**
     * 查询应聘人信息列表
     * 
     * @param apply 应聘人信息
     * @return 应聘人信息集合
     */
    public List<Apply> selectApplyList(Apply apply);

    /**
     * 新增应聘人信息
     * 
     * @param apply 应聘人信息
     * @return 结果
     */
    public int insertApply(Apply apply);

    /**
     * 修改应聘人信息
     * 
     * @param apply 应聘人信息
     * @return 结果
     */
    public int updateApply(Apply apply);

    /**
     * 删除应聘人信息
     * 
     * @param applyId 应聘人信息主键
     * @return 结果
     */
    public int deleteApplyByApplyId(Long applyId);

    /**
     * 批量删除应聘人信息
     * 
     * @param applyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteApplyByApplyIds(Long[] applyIds);
}
