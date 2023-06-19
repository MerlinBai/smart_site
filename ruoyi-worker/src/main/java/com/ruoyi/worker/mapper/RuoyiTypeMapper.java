package com.ruoyi.worker.mapper;

import com.ruoyi.worker.domain.RuoyiType;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 马兰友
 * @Date: 2023/06/08/20:16
 */
public interface RuoyiTypeMapper {
    @Select("select id from smart_site.tb_ruoyi_type where name like concat('%',#{name},'%')")
    public List<Long> selectTypeId(String name);
    @Select("select name from tb_ruoyi_type where id = #{id}")
    public String selectTypeName(Long id);
    @Select("select name from tb_ruoyi_type")
    public List<String> selectAllName();

    @Select("select id from tb_ruoyi_type where name = #{name}")
    public Long selectOneTypeId(String name);

    @Insert("insert into tb_ruoyi_type (name) values (#{name})")
    public void insertType(String name);

    /**
     * 查询工种id与工种名的对应表
     *
     * @param id 工种id与工种名的对应表主键
     * @return 工种id与工种名的对应表
     */
    public RuoyiType selectRuoyiTypeById(Long id);

    /**
     * 查询工种id与工种名的对应表列表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 工种id与工种名的对应表集合
     */
    public List<RuoyiType> selectRuoyiTypeList(RuoyiType ruoyiType);


    /**
     * 新增工种id与工种名的对应表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 结果
     */
    public int insertRuoyiType(RuoyiType ruoyiType);

    /**
     * 修改工种id与工种名的对应表
     *
     * @param ruoyiType 工种id与工种名的对应表
     * @return 结果
     */
    public int updateRuoyiType(RuoyiType ruoyiType);

    /**
     * 删除工种id与工种名的对应表
     *
     * @param id 工种id与工种名的对应表主键
     * @return 结果
     */
    public int deleteRuoyiTypeById(Long id);

    /**
     * 批量删除工种id与工种名的对应表
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRuoyiTypeByIds(Long[] ids);
}
