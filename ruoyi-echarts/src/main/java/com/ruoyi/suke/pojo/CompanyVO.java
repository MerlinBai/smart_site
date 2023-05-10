package com.ruoyi.suke.pojo;

/**
 * @author Li Sipeng
 * @version 4.1 on   2022-11-29 20:31
 */
public class CompanyVO {
    private String name;
    private Integer value;

    @Override
    public String toString() {
        return "companyVO{" +
                "name='" + name + '\'' +
                ", value=" + value +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
