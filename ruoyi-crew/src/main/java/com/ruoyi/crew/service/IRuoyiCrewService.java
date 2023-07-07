package com.ruoyi.crew.service;

import java.util.List;

import com.ruoyi.crew.domain.CrewProject;
import com.ruoyi.crew.domain.RuoyiCrew;
import com.ruoyi.project.domain.Project;


/**
 * 施工队信息Service接口
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
public interface IRuoyiCrewService 
{
    /**
     * 查询施工队信息
     * 
     * @param crewId 施工队信息主键
     * @return 施工队信息
     */
    public RuoyiCrew selectRuoyiCrewByCrewId(Long crewId, Project project);

    /**
     * 查询施工队信息列表
     * 
     * @param ruoyiCrew 施工队信息
     * @return 施工队信息集合
     */
    public List<RuoyiCrew> selectRuoyiCrewList(RuoyiCrew ruoyiCrew, Project project);


    /**
     * 新增施工队信息
     * 
     * @param ruoyiCrew 施工队信息
     * @return 结果
     */
    public int insertRuoyiCrew(RuoyiCrew ruoyiCrew);

    /**
     * 修改施工队信息
     * 
     * @param ruoyiCrew 施工队信息
     * @return 结果
     */
    public int updateRuoyiCrew(RuoyiCrew ruoyiCrew);

    /**
     * 批量删除施工队信息
     * 
     * @param crewIds 需要删除的施工队信息主键集合
     * @return 结果
     */
    public int deleteRuoyiCrewByCrewIds(Long[] crewIds);

    /**
     * 删除施工队信息信息
     * 
     * @param crewId 施工队信息主键
     * @return 结果
     */
    public int deleteRuoyiCrewByCrewId(Long crewId);
/**
 * 通过projectId查询项目信息
 *
 */
//废弃
 public List<Project>selectFinshProject(Integer ProjectId);
//废弃
    public void addfinsh(Integer CrewId,Integer ProjectId);

}
