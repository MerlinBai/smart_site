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
    @Select("select id from tb_ruoyi_type where name like concat('%',#{name},'%')")
    public List<Long> selectTypeId(String name);
    @Select("select name from tb_ruoyi_type where id = #{id}")
    public String selectTypeName(Long id);

    @Select("select id from tb_ruoyi_type where name = #{name}")
    public Long selectOneTypeId(String name);

    @Insert("insert into tb_ruoyi_type (name) values (#{name})")
    public void insertType(String name);
}
