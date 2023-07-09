package com.ruoyi.crew.mapper;

import java.util.List;
import com.ruoyi.crew.domain.RuoyiCrew;
import com.ruoyi.project.domain.Project;

/**
 * 施工队信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-07
 */
public interface RuoyiCrewMapper {
    /**
     * 查询施工队信息
     *
     * @param crewId 施工队信息主键
     * @return 施工队信息
     */
    public RuoyiCrew selectRuoyiCrewByCrewId(Long crewId);

    /**
     * 查询施工队信息列表
     *
     * @param ruoyiCrew 施工队信息
     * @return 施工队信息集合
     */
    public List<RuoyiCrew> selectRuoyiCrewList(RuoyiCrew ruoyiCrew);

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
     * 删除施工队信息
     *
     * @param crewId 施工队信息主键
     * @return 结果
     */
    public int deleteRuoyiCrewByCrewId(Long crewId);

    /**
     * 批量删除施工队信息
     *
     * @param crewIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRuoyiCrewByCrewIds(Long[] crewIds);

    /**
     * 查找施工队名字
     *
     * @param crewId 施工队信息主键
     * @return 结果
     */
    public String selectCrewNamebyCrewId(Long crewId);
    /**
     * 查找项目
     *
     * @return 结果
     */
}




