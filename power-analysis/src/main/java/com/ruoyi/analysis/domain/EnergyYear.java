package com.ruoyi.analysis.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 energy_year
 *
 * @author ruoyi
 * @date 2023-12-19
 */
public class EnergyYear extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 设备id */
    @Excel(name = "设备id")
    private Integer devId;

    /** 电能 */
    @Excel(name = "电能")
    private Long epp2;
    /*设备名称*/
    private String devName;
    /*区域id*/
    private Long deptId;
    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }



    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date collectTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setDevId(Integer devId)
    {
        this.devId = devId;
    }

    public Integer getDevId()
    {
        return devId;
    }
    public void setEpp2(Long epp2)
    {
        this.epp2 = epp2;
    }

    public Long getEpp2()
    {
        return epp2;
    }
    public void setCollectTime(Date collectTime)
    {
        this.collectTime = collectTime;
    }

    public Date getCollectTime()
    {
        return collectTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("devId", getDevId())
            .append("epp2", getEpp2())
            .append("collectTime", getCollectTime())
            .toString();
    }
}
