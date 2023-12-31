package com.ruoyi.satisfaction.service.impl;

import java.util.*;

import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.satisfaction.mapper.SurveyMapper;
import com.ruoyi.satisfaction.domain.Survey;
import com.ruoyi.satisfaction.service.ISurveyService;

/**
 * 满意度检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-06-18
 */
@Service
public class SurveyServiceImpl implements ISurveyService 
{
    @Autowired
    private SurveyMapper surveyMapper;

    /**
     * 查询满意度检查
     * 
     * @param surveyId 满意度检查主键
     * @return 满意度检查
     */
    @Override
    public Survey selectSurveyBySurveyId(Long surveyId)
    {
        return surveyMapper.selectSurveyBySurveyId(surveyId);
    }

    /**
     * 查询满意度检查列表
     * 
     * @param survey 满意度检查
     * @return 满意度检查
     */
    @Override
    public List<Survey> selectSurveyList(Survey survey)
    {
        // 按时间降序
//        List<Date> timeList = new ArrayList<>();
        List<Survey> surveys = surveyMapper.selectSurveyList(survey);
//        surveys.forEach(s -> {
//            timeList.add(s.getSurveyTime());
//        });

        Collections.sort(surveys, new Comparator<Survey>() {
            @Override
            public int compare(Survey o1, Survey o2) {
                return o2.getSurveyTime().compareTo(o1.getSurveyTime());
            }
        });


        return surveys;
    }

    /**
     * 新增满意度检查
     * 
     * @param survey 满意度检查
     * @return 结果
     */
    @Override
    public int insertSurvey(Survey survey)
    {
        return surveyMapper.insertSurvey(survey);
    }

    /**
     * 修改满意度检查
     * 
     * @param survey 满意度检查
     * @return 结果
     */
    @Override
    public int updateSurvey(Survey survey)
    {
        return surveyMapper.updateSurvey(survey);
    }

    /**
     * 批量删除满意度检查
     * 
     * @param surveyIds 需要删除的满意度检查主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBySurveyIds(Long[] surveyIds)
    {
        return surveyMapper.deleteSurveyBySurveyIds(surveyIds);
    }

    /**
     * 删除满意度检查信息
     * 
     * @param surveyId 满意度检查主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBySurveyId(Long surveyId)
    {
        return surveyMapper.deleteSurveyBySurveyId(surveyId);
    }
}
