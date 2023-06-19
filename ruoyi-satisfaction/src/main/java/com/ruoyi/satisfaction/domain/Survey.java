package com.ruoyi.satisfaction.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 满意度检查对象 tb_survey
 * 
 * @author ruoyi
 * @date 2023-06-18
 */
public class Survey extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long surveyId;

    /** 调查范围 */
    @Excel(name = "调查范围")
    private String surveyScope;

    /** 调查对象 */
    @Excel(name = "调查对象")
    private String surveyObject;

    /** 调查人 */
    @Excel(name = "调查人")
    private String surveyBy;

    /** 调查等级 */
    @Excel(name = "调查等级")
    private String surveyResult;

    /** 调查时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调查时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date surveyTime;

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }
    public void setSurveyScope(String surveyScope) 
    {
        this.surveyScope = surveyScope;
    }

    public String getSurveyScope() 
    {
        return surveyScope;
    }
    public void setSurveyObject(String surveyObject) 
    {
        this.surveyObject = surveyObject;
    }

    public String getSurveyObject() 
    {
        return surveyObject;
    }
    public void setSurveyBy(String surveyBy) 
    {
        this.surveyBy = surveyBy;
    }

    public String getSurveyBy() 
    {
        return surveyBy;
    }
    public void setSurveyResult(String surveyResult) 
    {
        this.surveyResult = surveyResult;
    }

    public String getSurveyResult() 
    {
        return surveyResult;
    }
    public void setSurveyTime(Date surveyTime) 
    {
        this.surveyTime = surveyTime;
    }

    public Date getSurveyTime() 
    {
        return surveyTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("surveyId", getSurveyId())
            .append("surveyScope", getSurveyScope())
            .append("surveyObject", getSurveyObject())
            .append("surveyBy", getSurveyBy())
            .append("surveyResult", getSurveyResult())
            .append("surveyTime", getSurveyTime())
            .toString();
    }
}
