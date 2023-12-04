package com.ruoyi.analysis.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * powerEnergy analysis in month对象 energy_month
 *
 * @author 微笑
 * @date 2023-10-28
 */
public class EnergyMonth extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 设备id */
    private Integer devId;

    /** 电能 */
    private Long epp2;
    /*设备名称*/
    private String devName;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    /*区域id*/
    private Long deptId;



    /** $column.columnComment */
    @JsonFormat(pattern = "yyyy-MM-dd")
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
    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
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
