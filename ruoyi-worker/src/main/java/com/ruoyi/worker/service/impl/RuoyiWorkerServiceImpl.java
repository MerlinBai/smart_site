package com.ruoyi.worker.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.crew.domain.RuoyiCrew;
import com.ruoyi.crew.mapper.RuoyiCrewMapper;
import com.ruoyi.project.mapper.ProjectMapper;
import com.ruoyi.worker.domain.Message;
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

    @Autowired
    private ProjectMapper projectMapper;

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
//     * @param ruoyiWorker 员工管理
     * @return 员工管理
     */
    @Override
    public List<RuoyiWorker> selectRuoyiWorkerList(List<String> workerTypeNames,List<Long> authentication,String name,Boolean isDetails)
    {
        RuoyiCrew crew ;
        StringBuilder str = new StringBuilder();
        List<Long> typeIdList;
        RuoyiWorker ruoyiWorker = new RuoyiWorker();
        List<RuoyiWorker> list = new ArrayList<>();
        List<Long> typeIdList2 = new ArrayList<>();
        List<Long> workerIdList = new ArrayList<>();
        for(String typeName : workerTypeNames) {
            typeIdList2.addAll(ruoyiTypeMapper.selectTypeId(typeName));
        }
        ruoyiWorker.setName(name);
        for(Long l : typeIdList2)
            workerIdList.addAll(ruoyiWorkerTypeMapper.selectWorkerId(l));
        if (workerIdList.size() != 0){
            for(Long wi : workerIdList) {
                ruoyiWorker.setId(wi);
                for (Long aut : authentication) {
                    ruoyiWorker.setAuthentication(aut);
                    if (isDetails)
                        list.addAll(ruoyiWorkerMapper.selectRuoyiWorkerListDetails(ruoyiWorker));
                    else
                        list.addAll(ruoyiWorkerMapper.selectRuoyiWorkerList(ruoyiWorker));
                }
            }
        }
        for (RuoyiWorker worker : list){
            if(worker.getCrewId() != null) {
                crew = ruoyiCrewMapper.selectRuoyiCrewByCrewId(worker.getCrewId());
                worker.setCrewName(crew.getName());
            }

            try{
                worker.setProjectName(projectMapper.selectProjectByProjectId(worker.getProjectNow()).getProjectName());
            } catch (NullPointerException e){
                worker.setProjectName("无");
            }
            typeIdList = ruoyiWorkerTypeMapper.selectTypeId(worker.getId());
            if (typeIdList != null) {
                for (Long typeId : typeIdList) {
                    str.append(ruoyiTypeMapper.selectTypeName(typeId)).append(',');
                }
                if (str.length() != 0)
                    worker.setWorkerTypeName(str.deleteCharAt(str.length() - 1).toString());
                str.delete(0, str.length());
            }
        }
        for(int i = 0; i < list.size() - 1 ; i++){
            for(int j = i+1 ; j < list.size() ; j++){
                if(Objects.equals(list.get(i).getId(), list.get(j).getId()))
                    list.remove(j);
            }
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
        RuoyiWorkerType ruoyiWorkerType = new RuoyiWorkerType();
        ruoyiWorkerType.setWorkerId(ruoyiWorker.getId());
        ruoyiWorkerTypeMapper.deleteByWorkerId(ruoyiWorker.getId());
        String[] split = ruoyiWorker.getWorkerTypeName().split(",");
        for(String s : split){
            ruoyiWorkerType.setTypeId(ruoyiTypeMapper.selectOneTypeId(s));
            ruoyiWorkerTypeMapper.insert(ruoyiWorkerType);
        }
        return ruoyiWorkerMapper.updateRuoyiWorker(ruoyiWorker);

    }

    /**
     * 批量删除员工管理
     * 
     * @param ids 需要删除的员工管理主键
     * @return 结果
     */
    @Override
    public int updateAutRuoyiWorkerByIds(Long[] ids)
    {
        RuoyiWorker ruoyiWorker;
        for(Long id : ids){
            ruoyiWorker = ruoyiWorkerMapper.selectRuoyiWorkerById(id);
            if(ruoyiWorker.getAuthentication() == 0) ruoyiWorker.setAuthentication(1L);
            else if(ruoyiWorker.getAuthentication() == 1) ruoyiWorker.setAuthentication(0L);
            ruoyiWorkerMapper.updateRuoyiWorker(ruoyiWorker);
        }
        return 1;
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
            if(worker.getSexName().equals("男")) worker.setSex(0L);
            else if(worker.getSexName().equals("女")) worker.setSex(1L);
            else worker.setSex(2L);

            if(worker.getPolStatusName().equals("群众")) worker.setPolStatus(0);
            else if(worker.getPolStatusName().equals("党员")) worker.setPolStatus(1);
            else worker.setPolStatus(2);

            if(worker.getAuthenticationName().equals("否")) worker.setAuthentication(0L);
            else if(worker.getAuthenticationName().equals("是")) worker.setAuthentication(1L);
            else worker.setAuthentication(2L);

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

    public RuoyiWorker selectDetails(Long id){
        RuoyiWorker worker = ruoyiWorkerMapper.selectRuoyiWorkerById(id);
        StringBuilder str = new StringBuilder();
//        worker.setCrewName(ruoyiCrewMapper.selectCrewNamebyCrewId(worker.getCrewId()));
//        worker.setWorkerTypeName(ruoyiWorkerTypeMapper.);
        if(worker.getCrewId() != null){
            worker.setCrewName(ruoyiCrewMapper.selectRuoyiCrewByCrewId(worker.getCrewId()).getName());
        }
        for(Long typeId : ruoyiWorkerTypeMapper.selectTypeId(worker.getId())){
            str.append(ruoyiTypeMapper.selectTypeName(typeId)).append(',');
        }
        if(str.length() != 0)
            worker.setWorkerTypeName(str.deleteCharAt(str.length() - 1).toString());
        str = new StringBuilder(worker.getIdNumber());
        try{
            worker.setIdNumber(str.replace(8,14,"******").toString());
        } catch (Exception e){
            worker.setIdNumber("无信息");
        }
        str = new StringBuilder(worker.getPhone());
        try{
            worker.setPhone(str.replace(3,7,"****").toString());
        } catch (Exception e){
            worker.setPhone("无信息");
        }
        try{
            worker.setProjectName(projectMapper.selectProjectByProjectId(worker.getProjectNow()).getProjectName());
        } catch (NullPointerException e){
            worker.setProjectName("无");
        }
        return worker;
    }

    public int updateAuthentication(RuoyiWorker ruoyiWorker){
        Integer res = ruoyiWorkerMapper.updateRuoyiWorker(ruoyiWorker);

        Message message = new Message();
        if (ruoyiWorker.getAuthentication() == 2)
            message.setBody("您的成为工匠审核已通过，恭喜您正式成为一名工匠，请再接再厉，祝您步步高升，前程似锦！");
        else if(ruoyiWorker.getAuthentication() == 0)
            message.setBody("您的成为工匠审核暂未通过，请尝试联系XXXXXXX了解详细情况。");
        else if(ruoyiWorker.getAuthentication() == 1)
            message.setBody("您的工匠资格已被取消，请等待消息或者联系XXXXXXX了解详细情况。");
        message.setCreateTime(new Date());
        message.setCreateBy("智慧村建官方");
        message.setTitle("审核通知");
        message.setRec(ruoyiWorker.getId());


        ruoyiWorkerMapper.addmsg(message);

        return res;
    }

    @Override
    public List<Message> list(Long id) {
        return ruoyiWorkerMapper.list(id);
    }

    @Override
    public void updatemsg(RuoyiWorker ruoyiWorker) {
        ruoyiWorkerMapper.upmsg(ruoyiWorker);
    }

    @Override
    public void updateauth(RuoyiWorker ruoyiWorker) {
        ruoyiWorkerMapper.updateauth(ruoyiWorker);

        RuoyiWorkerType ruoyiWorkerType = new RuoyiWorkerType();
        ruoyiWorkerType.setTypeId(ruoyiWorker.getWorkerTypeId());
        ruoyiWorkerType.setWorkerId(ruoyiWorker.getId());

        ruoyiWorkerTypeMapper.insert(ruoyiWorkerType);
    }

}
