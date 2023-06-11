package com.ruoyi.satisfaction.service;

import java.util.List;
import com.ruoyi.satisfaction.domain.Survey;

/**
 * 满意度检查Service接口
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public interface ISurveyService 
{
    /**
     * 查询满意度检查
     * 
     * @param surveyId 满意度检查主键
     * @return 满意度检查
     */
    public Survey selectSurveyBySurveyId(Long surveyId);

    /**
     * 查询满意度检查列表
     * 
     * @param survey 满意度检查
     * @return 满意度检查集合
     */
    public List<Survey> selectSurveyList(Survey survey);

    /**
     * 新增满意度检查
     * 
     * @param survey 满意度检查
     * @return 结果
     */
    public int insertSurvey(Survey survey);

    /**
     * 修改满意度检查
     * 
     * @param survey 满意度检查
     * @return 结果
     */
    public int updateSurvey(Survey survey);

    /**
     * 批量删除满意度检查
     * 
     * @param surveyIds 需要删除的满意度检查主键集合
     * @return 结果
     */
    public int deleteSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 删除满意度检查信息
     * 
     * @param surveyId 满意度检查主键
     * @return 结果
     */
    public int deleteSurveyBySurveyId(Long surveyId);
}
