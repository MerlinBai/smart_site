package com.ruoyi.worker.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.crew.domain.RuoyiCrew;
import com.ruoyi.crew.mapper.RuoyiCrewMapper;
import com.ruoyi.worker.domain.RuoyiWorker;
import com.ruoyi.worker.domain.RuoyiWorkerType;
import com.ruoyi.worker.mapper.RuoyiTypeMapper;
import com.ruoyi.worker.mapper.RuoyiWorkerMapper;
import com.ruoyi.worker.mapper.RuoyiWorkerTypeMapper;
import com.ruoyi.worker.service.IRuoyiWorkerService;
import com.ruoyi.worker.utils.WorkerTypeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 员工管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-06-07
 */
@Service
public class RuoyiWorkerServiceImpl implements IRuoyiWorkerService
{
    @Autowired
    private RuoyiWorkerMapper ruoyiWorkerMapper;

    @Autowired
    private RuoyiCrewMapper ruoyiCrewMapper;

    @Autowired
    private RuoyiTypeMapper ruoyiTypeMapper;

    @Autowired
    private RuoyiWorkerTypeMapper ruoyiWorkerTypeMapper;

    private static final Logger log = LoggerFactory.getLogger(RuoyiWorkerServiceImpl.class);

    /**
     * 查询员工管理
     * 
     * @param id 员工管理主键
     * @return 员工管理
     */
    @Override
    public RuoyiWorker selectRuoyiWorkerById(Long id)
    {
        return ruoyiWorkerMapper.selectRuoyiWorkerById(id);
    }

    /**
     * 查询员工管理列表
     * 
     * @param ruoyiWorker 员工管理
     * @return 员工管理
     */
    @Override
    public List<RuoyiWorker> selectRuoyiWorkerList(RuoyiWorker ruoyiWorker)
    {
        StringBuilder str = new StringBuilder();
        List<Long> typeIdList;
        RuoyiCrew crew = new RuoyiCrew();
        crew.setName(ruoyiWorker.getCrewName());
        List<RuoyiCrew> crewList = ruoyiCrewMapper.selectRuoyiCrewList(crew);
        List<RuoyiWorker> list = new ArrayList<>();
        List<Long> typeIdList2;
        List<Long> workerIdList = new ArrayList<>();

        typeIdList2 = ruoyiTypeMapper.selectTypeId(ruoyiWorker.getWorkerTypeName());

        if(typeIdList2.size() != 0){
            for(Long l : typeIdList2)
                workerIdList.addAll(ruoyiWorkerTypeMapper.selectWorkerId(l));
            if (workerIdList.size() != 0){
                for(Long wi : workerIdList)
                    for(RuoyiCrew c : crewList){
                        ruoyiWorker.setId(wi);
                        ruoyiWorker.setCrewId(c.getCrewId());
                        list.addAll(ruoyiWorkerMapper.selectRuoyiWorkerList(ruoyiWorker));
                    }
            }
        }
        else{
            for(RuoyiCrew c : crewList){
                ruoyiWorker.setCrewId(c.getCrewId());
                list.addAll(ruoyiWorkerMapper.selectRuoyiWorkerList(ruoyiWorker));
            }
        }


        for (RuoyiWorker worker : list){
            if(worker.getCrewId() == null)
                continue;
            crew = ruoyiCrewMapper.selectRuoyiCrewByCrewId(worker.getCrewId());
            worker.setCrewName(crew.getName());
            typeIdList = ruoyiWorkerTypeMapper.selectTypeId(worker.getId());
            if(typeIdList == null)
                continue;

            for(Long typeId : typeIdList){
                str.append(ruoyiTypeMapper.selectTypeName(typeId)).append(',');
            }
            if(str.length() != 0)
              worker.setWorkerTypeName(str.deleteCharAt(str.length() - 1).toString());
            str.delete(0,str.length());
        }
        return list;
    }

    /**
     * 新增员工管理
     * 
     * @param ruoyiWorker 员工管理
     * @return 结果
     */
    @Override
    public int insertRuoyiWorker(RuoyiWorker ruoyiWorker)
    {
        int i = ruoyiWorkerMapper.insertRuoyiWorker(ruoyiWorker);
        WorkerTypeUtil util = new WorkerTypeUtil();
        util.workerTypeInsert(ruoyiWorker,ruoyiWorkerTypeMapper,ruoyiWorkerMapper,ruoyiTypeMapper);
        return i;
    }

    /**
     * 修改员工管理
     * 
     * @param ruoyiWorker 员工管理
     * @return 结果
     */
    @Override
    public int updateRuoyiWorker(RuoyiWorker ruoyiWorker)
    {
        return ruoyiWorkerMapper.updateRuoyiWorker(ruoyiWorker);
    }

    /**
     * 批量删除员工管理
     * 
     * @param ids 需要删除的员工管理主键
     * @return 结果
     */
    @Override
    public int deleteRuoyiWorkerByIds(Long[] ids)
    {
        return ruoyiWorkerMapper.deleteRuoyiWorkerByIds(ids);
    }

    /**
     * 删除员工管理信息
     * 
     * @param id 员工管理主键
     * @return 结果
     */
    @Override
    public int deleteRuoyiWorkerById(Long id)
    {
        return ruoyiWorkerMapper.deleteRuoyiWorkerById(id);
    }

    @Override
    public String importWorker(List<RuoyiWorker> workerList, Boolean isUpdateSupport, String operName)
    {
        if (StringUtils.isNull(workerList) || workerList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        WorkerTypeUtil util = new WorkerTypeUtil();
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        RuoyiCrew crew;
        for (RuoyiWorker worker : workerList)
        {
            try
            {
                // 验证是否存在这个用户
                RuoyiWorker w = ruoyiWorkerMapper.selectRuoyiWorkerById(worker.getId());
                if (StringUtils.isNull(w))
                {
                        if(worker.getSexName().equals("男")){
                            worker.setSex(0L);
                        } else if(worker.getSexName().equals("女")){
                            worker.setSex(1L);
                        } else{
                            worker.setSex(2L);
                        }
                    ruoyiWorkerMapper.insertRuoyiWorker(worker);
                    util.workerTypeInsert(worker,ruoyiWorkerTypeMapper,ruoyiWorkerMapper,ruoyiTypeMapper);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、员工 " + worker.getName() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    if(worker.getSexName() == null)
                        worker.setSex(2L);
                    else if(worker.getSexName().equals("男")){
                        worker.setSex(0L);
                    } else if(worker.getSexName().equals("女")){
                        worker.setSex(1L);
                    } else{
                        worker.setSex(2L);
                    }
                    worker.setId(w.getId());
                    ruoyiWorkerMapper.updateRuoyiWorker(worker);
                    ruoyiWorkerTypeMapper.deleteByWorkerId(worker.getId());
                    util.workerTypeInsert(worker,ruoyiWorkerTypeMapper,ruoyiWorkerMapper,ruoyiTypeMapper);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、员工 " + worker.getName() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、员工 " + worker.getName() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + worker.getName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}
