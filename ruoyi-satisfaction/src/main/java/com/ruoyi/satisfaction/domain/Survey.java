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
 * @date 2023-06-07
 */
public class Survey extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long surveyId;

    /** 调查类型 */
    @Excel(name = "调查类型")
    private String surveyType;

    /** 调查区域 */
    @Excel(name = "调查区域")
    private String surveyRegion;

    /** 调查人数 */
    @Excel(name = "调查人数")
    private Long surveyNum;

    /** 调查人 */
    @Excel(name = "调查人")
    private String surveyBy;

    /** 调查分数 */
    @Excel(name = "调查分数")
    private Long surveyResult;

    /** 调查时间 */
    private Date surveyTime;

    public void setSurveyId(Long surveyId) 
    {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() 
    {
        return surveyId;
    }
    public void setSurveyType(String surveyType) 
    {
        this.surveyType = surveyType;
    }

    public String getSurveyType() 
    {
        return surveyType;
    }
    public void setSurveyRegion(String surveyRegion) 
    {
        this.surveyRegion = surveyRegion;
    }

    public String getSurveyRegion() 
    {
        return surveyRegion;
    }
    public void setSurveyNum(Long surveyNum) 
    {
        this.surveyNum = surveyNum;
    }

    public Long getSurveyNum() 
    {
        return surveyNum;
    }
    public void setSurveyBy(String surveyBy) 
    {
        this.surveyBy = surveyBy;
    }

    public String getSurveyBy() 
    {
        return surveyBy;
    }
    public void setSurveyResult(Long surveyResult) 
    {
        this.surveyResult = surveyResult;
    }

    public Long getSurveyResult() 
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
            .append("surveyType", getSurveyType())
            .append("surveyRegion", getSurveyRegion())
            .append("surveyNum", getSurveyNum())
            .append("surveyBy", getSurveyBy())
            .append("surveyResult", getSurveyResult())
            .append("surveyTime", getSurveyTime())
            .toString();
    }
}
