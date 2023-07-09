package com.ruoyi.crew.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.crew.domain.CrewProject;
import com.ruoyi.project.domain.Project;
import com.ruoyi.project.mapper.ProjectMapper;
import com.ruoyi.system.domain.SysUserRole;
import com.ruoyi.system.mapper.SysUserRoleMapper;
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

    @Autowired
    private SysUserRoleMapper userRoleMapper;

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
                if (projects.get(i).getAuthentication().equals("是")) {
                    finishList.add(projects.get(i).getProjectName());

                }else {
                    unfinishList.add(projects.get(i).getProjectName());
                }
            }
        }

        RuoyiCrew crew = ruoyiCrewMapper.selectRuoyiCrewByCrewId(crewId);

        crew.setFinishProject((long) finishList.size());
        crew.setUnfinishProject((long) unfinishList.size());
        ArrayList<SysUserRole> list = new ArrayList<SysUserRole>();

        // 提升企业权限
        Long userId = crew.getUserId();
        SysUserRole ur = new SysUserRole();
        ur.setUserId(userId);
        ur.setRoleId(103L);
        list.add(ur);
        userRoleMapper.batchUserRole(list);
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
//        List<RuoyiWorker> workers =ruoyiWorkerMapper.selectRuoyiWorkerList(worker);
        crewList.forEach(s -> {
            s.setFinishProject(0L);
            s.setUnfinishProject(0L);
        });

      List<Integer>finishList=new ArrayList<>();
      List<Integer>unfinishList=new ArrayList<>();
      List<String>finishNameList=new ArrayList<>();
      List<String>unfinishNameList=new ArrayList<>();
        List<Project> projects = projectMapper.selectProjectList(project);
        for( RuoyiCrew crew:crewList ) {
                   for(Project p:projects)
            {
                if(p.getCrewId().equals(crew.getCrewId()))
                {
                    if(p.getAuthentication().equals("是"))
                    {
                        if (finishList != null) {
                            finishList.add(p.getProjectId());
                            finishNameList.add(p.getProjectName());
                        }
                        crew.setFinishProjectsName(finishNameList);
                        crew.setFinishProjects(finishList);
                        crew.setFinishProject(crew.getFinishProject()+1);
                    }
                    else {
                        if (unfinishList != null) {
                            unfinishList.add(p.getProjectId());
                            unfinishNameList.add(p.getProjectName());
                        }
                        crew.setUnfinishProjectsName(unfinishNameList);
                        crew.setUnfinishProjects(unfinishList);
                        crew.setUnfinishProject(crew.getUnfinishProject() + 1);
                    }
                }
            }
            crew.setFinSumName( String.join(",", finishNameList));
            crew.setUnFinSumName(String.join(",", unfinishNameList));
            if (crew.getFinSumName().equals("")) {
                crew.setFinSumName("无");
            }
            if(crew.getUnFinSumName().equals("")){
                crew.setUnFinSumName("无");
            }
            finishList=new ArrayList<>();
            unfinishList=new ArrayList<>();
            finishNameList=new ArrayList<>();
            unfinishNameList=new ArrayList<>();
        }
//        for (RuoyiCrew crew:crewList){
//            for (RuoyiWorker work: workers) {
//                if(crew.getCrewId().equals(work.getCrewId()))
//                {
//                    crew.setPopualtion(count++);
//                }
//            }
//            count=0L;
//        }


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
        Long userId = SecurityUtils.getUserId();
        ruoyiCrew.setUserId(userId);
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


/**
 * 添加已完成项目
 *
 * @param ruoyiCrew 施工队信息
 * @return 结果
 */


}
