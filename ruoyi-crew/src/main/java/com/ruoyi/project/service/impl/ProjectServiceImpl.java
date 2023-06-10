package com.ruoyi.project.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.crew.domain.RuoyiCrew;
import com.ruoyi.crew.mapper.RuoyiCrewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.mapper.ProjectMapper;
import com.ruoyi.project.domain.Project;
import com.ruoyi.project.service.IProjectService;

/**
 * 项目管理Service业务层处理
 *
 * @author ruoyi
 * @date 2023-06-08
 */
@Service
public class ProjectServiceImpl implements IProjectService
{
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private RuoyiCrewMapper ruoyiCrewMapper;

    /**
     * 查询项目管理
     *
     * @param projectId 项目管理主键
     * @return 项目管理
     */
    @Override
    public Project selectProjectByProjectId(Long projectId)
    {
        return projectMapper.selectProjectByProjectId(projectId);
    }

    /**
     * 查询项目管理列表
     *
     * @param project 项目管理
     * @return 项目管理
     */
    @Override
    public List<Project> selectProjectList(Project project)
    {

//     RuoyiCrew crew =new RuoyiCrew();
//     crew.setName(project.getCrewName());
//     List<RuoyiCrew> crewList =ruoyiCrewMapper.selectRuoyiCrewList(crew);
//     List<Project> projects = new ArrayList<>();
//     for (RuoyiCrew c:crewList)
//     {
//         project .setCrewId(c.getCrewId());
//         projects.addAll(projectMapper.selectProjectList(project));
//     }
//     for (Project p :projects)
//     {
//         if(p.getCrewId()==null)
//         {
//             continue;
//         }
//         crew =ruoyiCrewMapper.selectRuoyiCrewByCrewId(p.getCrewId());
//         p.setCrewName(crew.getName());
//     }
//
//     return projects ;
        return projectMapper.selectProjectList(project);
    }

    @Override
    public String SelectCrewName(Long crewId) {
        return projectMapper.SelectCrewName(crewId);
    }

    /**
     * 新增项目管理
     *
     * @param project 项目管理
     * @return 结果
     */
    @Override
    public int insertProject(Project project)
    {
        return projectMapper.insertProject(project);
    }

    /**
     * 修改项目管理
     *
     * @param project 项目管理
     * @return 结果
     */
    @Override
    public int updateProject(Project project)
    {
        return projectMapper.updateProject(project);
    }

    /**
     * 批量删除项目管理
     *
     * @param projectIds 需要删除的项目管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectByProjectIds(Long[] projectIds)
    {
        return projectMapper.deleteProjectByProjectIds(projectIds);
    }

    /**
     * 删除项目管理信息
     *
     * @param projectId 项目管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectByProjectId(Long projectId)
    {
        return projectMapper.deleteProjectByProjectId(projectId);
    }
}
