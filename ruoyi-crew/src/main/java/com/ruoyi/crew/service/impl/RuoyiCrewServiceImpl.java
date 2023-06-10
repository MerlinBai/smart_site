package com.ruoyi.crew.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.crew.domain.CrewProject;
import com.ruoyi.project.domain.Project;
import com.ruoyi.project.mapper.ProjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.crew.mapper.RuoyiCrewMapper;
import com.ruoyi.crew.domain.RuoyiCrew;
import com.ruoyi.crew.service.IRuoyiCrewService;

/**
 * 施工队信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
@Service
public class RuoyiCrewServiceImpl implements IRuoyiCrewService 
{
    @Autowired
    private RuoyiCrewMapper ruoyiCrewMapper;

    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public void addfinsh(Integer CrewId, Integer ProjectId) {
        CrewProject crewProject = new CrewProject();
        crewProject.setCrewId(CrewId);


    }



    /**
     * 查询施工队信息
     * 
     * @param crewId 施工队信息主键
     * @return 施工队信息
     */
    @Override
    public RuoyiCrew selectRuoyiCrewByCrewId(Long crewId,Project project)
    {
        List<Project> projects = projectMapper.selectProjectList(project);

        List<String> finishList = new ArrayList<>();
        List<String> unfinishList = new ArrayList<>();

        for (int i = 0; i < projects.size(); i++) {
            if (projects.get(i).getCrewId().equals(crewId)) {
                if (projects.get(i).getProjectEndTime() != null) {
                    finishList.add(projects.get(i).getProjectName());
                }else {
                    unfinishList.add(projects.get(i).getProjectName());
                }
            }
        }

        RuoyiCrew crew = ruoyiCrewMapper.selectRuoyiCrewByCrewId(crewId);

        crew.setFinishProject((long) finishList.size());
        crew.setUnfinishProject((long) unfinishList.size());

        return crew;
    }

    /**
     * 查询施工队信息列表
     * 
     * @param ruoyiCrew 施工队信息
     * @return 施工队信息
     */
    @Override
    public List<RuoyiCrew> selectRuoyiCrewList(RuoyiCrew ruoyiCrew, Project project)
    {
        List<RuoyiCrew> crewList = ruoyiCrewMapper.selectRuoyiCrewList(ruoyiCrew);

        crewList.forEach(s -> {
            s.setFinishProject(0L);
            s.setUnfinishProject(0L);
        });

//        List<Long> crewIdList = new ArrayList<>();
//
//        crewList.forEach(s -> {
//            crewIdList.add(s.getCrewId());
//        });

        List<Project> projects = projectMapper.selectProjectList(project);

        for (int i = 0; i < projects.size(); i++) {
            for (int j = 0; j < crewList.size(); j++) {
                if (projects.get(i).getCrewId().equals(crewList.get(j).getCrewId())) {
                    if (projects.get(i).getProjectEndTime() != null) {

                        Long len =crewList.get(i).getFinishProject()+1;
                        crewList.get(i).setFinishProject(len);
                    }
                    else {
                        Long len2 =crewList.get(i).getUnfinishProject()+1;
                        crewList.get(i).setUnfinishProject(len2);
                    }
                }
            }
        }


        return crewList;
    }


    /**
     * 新增施工队信息
     * 
     * @param ruoyiCrew 施工队信息
     * @return 结果
     */
    @Override
    public int insertRuoyiCrew(RuoyiCrew ruoyiCrew)
    {
        return ruoyiCrewMapper.insertRuoyiCrew(ruoyiCrew);
    }

    /**
     * 修改施工队信息
     * 
     * @param ruoyiCrew 施工队信息
     * @return 结果
     */
    @Override
    public int updateRuoyiCrew(RuoyiCrew ruoyiCrew)
    {
        return ruoyiCrewMapper.updateRuoyiCrew(ruoyiCrew);
    }

    /**
     * 批量删除施工队信息
     * 
     * @param crewIds 需要删除的施工队信息主键
     * @return 结果
     */
    @Override
    public int deleteRuoyiCrewByCrewIds(Long[] crewIds)
    {
        return ruoyiCrewMapper.deleteRuoyiCrewByCrewIds(crewIds);
    }

    /**
     * 删除施工队信息信息
     * 
     * @param crewId 施工队信息主键
     * @return 结果
     */
    @Override
    public int deleteRuoyiCrewByCrewId(Long crewId)
    {
        return ruoyiCrewMapper.deleteRuoyiCrewByCrewId(crewId);
    }

    @Override
    public List<Project> selectFinshProject(Integer ProjectId) {
        return null;
    }


}
