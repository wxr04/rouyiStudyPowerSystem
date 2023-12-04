package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 电力监控对象 device
 *
 * @author 微笑
 * @date 2023-10-19
 */
public class Device extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备号 */
    private Long devId;



    public SysDept getDept() {
        return dept;
    }
/*
    public void setDept(SysDept dept) {
        this.dept = dept;
    }*/
/*区域部门*/
private SysDept dept;
/*区域名称*/
    @Excel(name = "区域名称")
    private String deptName;
    /** 设备名称 */
    @Excel(name = "设备名称")
    private String devName;

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    /** 柜号 */
    @Excel(name = "柜号")
    private String devGnum;



    /** 设备所在的区域 */
    //@Excel(name = "设备所在的区域")
    private Long deptId;

    public float getEneryF() {
        return eneryF;
    }

    public void setEneryF(float eneryF) {
        this.eneryF = eneryF;
    }

    /** com口号 */
   // @Excel(name = "com口号")
    private Integer devCom;

    /** 设备地址 */
   // @Excel(name = "设备地址")
    private Integer devAddr;

    /** 电压变比 */
   // @Excel(name = "电压变比")
    private Integer Pt;

    /** 电流变比 */
   // @Excel(name = "电流变比")
    private Integer Ct;

    /** 二次测电能 */
   // @Excel(name = "二次测电能")
    private Long Epp;
    /*一次电能*/
    @Excel(name="电能")
    private float eneryF;
    /** 电压a */
    @Excel(name = "电压a")
    private Long Ua;

    /** 电压b */
    @Excel(name = "电压b")
    private Long Ub;

    /** 电压c */
    @Excel(name = "电压c")
    private Long Uc;

    /** 电流a */
    @Excel(name = "电流a")
    private Long Ia;

    /** 电流b */
    @Excel(name = "电流b")
    private Long Ib;

    /** 电流c */
    @Excel(name = "电流c")
    private Long Ic;

    /** 总功率 */
    @Excel(name = "总功率")
    private Long P;

    /** 功率因数 */
    @Excel(name = "功率因数")
    private Long cosQ;

    /** 频率 */
    @Excel(name = "频率")
    private Long F;
    /** 设备状态，如果是0不在线1为在线 */
    @Excel(name = "设备状态，如果是0不在线1为在线")
    private Integer status;

    public void setDevId(Long devId)
    {
        this.devId = devId;
    }

    public Long getDevId()
    {
        return devId;
    }
    public void setDevName(String devName)
    {
        this.devName = devName;
    }

    public String getDevName()
    {
        return devName;
    }
    public void setDevGnum(String devGnum)
    {
        this.devGnum = devGnum;
    }

    public String getDevGnum()
    {
        return devGnum;
    }
    public void setStatus(Integer status)
    {
        this.status = status;
    }

    public Integer getStatus()
    {
        return status;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public void setDevCom(Integer devCom)
    {
        this.devCom = devCom;
    }

    public Integer getDevCom()
    {
        return devCom;
    }
    public void setDevAddr(Integer devAddr)
    {
        this.devAddr = devAddr;
    }

    public Integer getDevAddr()
    {
        return devAddr;
    }
    public void setPt(Integer Pt)
    {
        this.Pt = Pt;
    }

    public Integer getPt()
    {
        return Pt;
    }
    public void setCt(Integer Ct)
    {
        this.Ct = Ct;
    }

    public Integer getCt()
    {
        return Ct;
    }
    public void setEpp(Long Epp)
    {
        this.Epp = Epp;
    }

    public Long getEpp()
    {
        return Epp;
    }
    public void setUa(Long Ua)
    {
        this.Ua = Ua;
    }

    public Long getUa()
    {
        return Ua;
    }
    public void setUb(Long Ub)
    {
        this.Ub = Ub;
    }

    public Long getUb()
    {
        return Ub;
    }
    public void setUc(Long Uc)
    {
        this.Uc = Uc;
    }

    public Long getUc()
    {
        return Uc;
    }
    public void setIa(Long Ia)
    {
        this.Ia = Ia;
    }

    public Long getIa()
    {
        return Ia;
    }
    public void setIb(Long Ib)
    {
        this.Ib = Ib;
    }

    public Long getIb()
    {
        return Ib;
    }
    public void setIc(Long Ic)
    {
        this.Ic = Ic;
    }

    public Long getIc()
    {
        return Ic;
    }
    public void setP(Long P)
    {
        this.P = P;
    }

    public Long getP()
    {
        return P;
    }
    public void setCosQ(Long cosQ)
    {
        this.cosQ = cosQ;
    }

    public Long getCosQ()
    {
        return cosQ;
    }
    public void setF(Long F)
    {
        this.F = F;
    }

    public Long getF()
    {
        return F;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("devId", getDevId())
            .append("devName", getDevName())
            .append("devGnum", getDevGnum())
            .append("status", getStatus())
            .append("updateTime", getUpdateTime())
            .append("departId", getDeptId())
            .append("devCom", getDevCom())
            .append("devAddr", getDevAddr())
            .append("Pt", getPt())
            .append("Ct", getCt())
            .append("Epp", getEpp())
            .append("Ua", getUa())
            .append("Ub", getUb())
            .append("Uc", getUc())
            .append("Ia", getIa())
            .append("Ib", getIb())
            .append("Ic", getIc())
            .append("P", getP())
            .append("cosQ", getCosQ())
            .append("F", getF())
            .toString();
    }
}
