package com.ruoyi.crew.service.impl;

import java.util.List;
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

    /**
     * 查询施工队信息
     * 
     * @param crewId 施工队信息主键
     * @return 施工队信息
     */
    @Override
    public RuoyiCrew selectRuoyiCrewByCrewId(Long crewId)
    {
        return ruoyiCrewMapper.selectRuoyiCrewByCrewId(crewId);
    }

    /**
     * 查询施工队信息列表
     * 
     * @param ruoyiCrew 施工队信息
     * @return 施工队信息
     */
    @Override
    public List<RuoyiCrew> selectRuoyiCrewList(RuoyiCrew ruoyiCrew)
    {
        return ruoyiCrewMapper.selectRuoyiCrewList(ruoyiCrew);
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
}
