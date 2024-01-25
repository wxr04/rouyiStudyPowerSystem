package com.ruoyi.alarm.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 报警查询对象 alarm
 *
 * @author weixiao
 * @date 2024-01-12
 */
public class Alarm extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** $column.columnComment */
   /* @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String IOServerName;*/

    /** $column.columnComment */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String MachineName;*/

    /** 报警变量名称 */
    //@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String TagName;

    /** $column.columnComment */
   /* @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String TagComment;*/

    /** 报警组 */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String GroupName;*/

    /** 报警值*/
    //@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @Excel(name = "报警值" ,sort = 3)
    private String AlarmValue;

    /**报警值类型 */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long AlarmValueDataType;*/

    /** 报警值 */
    @Excel(name = "报警限值",sort =4)
    private String LimitValue;

    /** $column.columnComment */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long LimitValueDataType;*/

    /**报警类型*/
    //@Excel(name = "报警类型")
    private String AlarmType;

    /** $column.columnComment */
   /* @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long Pri;*/

    /** $column.columnComment */
   /* @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long Quality;*/

    /**报警时间 */
    @Excel(name = "报警时间",sort=6,width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone = "GMT8")
    @JsonIgnore
    private Date AlarmTimeT;

    /** $column.columnComment */
   // @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long AlarmTimeMs;

    /** $column.columnComment */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date EventTime;*/

    /** $column.columnComment */
    //@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long EventTimeMs;

    /** $操作人 */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String OperatorName;*/

    /** $column.columnComment */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String OperatorDomain;*/

    /** 恢复值 */
   // @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String ResumeValue;

    /** $column.columnComment */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long ResumeValueDataType;*/

    /** $column.columnComment */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String EventType;*/

    /** 报警说明 */
    @Excel(name = "报警内容", sort = 5)
    private String AlarmText;

    /** $column.columnComment */
    // @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String ExtendField1;

    /** $column.columnComment */
    /*@Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String ExtendField2;*/
    /*设备ID*/
    private Integer devId;
    /*部门id*/
    private Integer deptId;
    /*用户ID*/
    private Integer userId;
    /*消息Id*/
    private Integer messageId;
    /*消息是否被读取*/
    private Integer isRead;
    /*设备名称*/
    @Excel(name = "报警设备" ,sort = 1)
    private String devName;




    /*报警说明*/
    @Excel(name = "报警类别" ,sort = 2)
    private String alarmExplain;
    private String alarmTimeS;

    public String getAlarmTimeS() {
        return alarmTimeS;
    }

    public void setAlarmTimeS(String alarmTime) {
        this.alarmTimeS = alarmTime;
    }
    public String getAlarmExplain() {
        return alarmExplain;
    }


    public void setAlarmExplain(String alarmExplain) {
        this.alarmExplain = alarmExplain;
    }
    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public Integer getDevId() {
        return devId;
    }

    public void setDevId(Integer devId) {
        this.devId = devId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getRead() {
        return isRead;
    }

    public void setRead(Integer read) {
        isRead = read;
    }

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
    }

    /* public void setIOServerName(String IOServerName)
        {
            this.IOServerName = IOServerName;
        }

        public String getIOServerName()
        {
            return IOServerName;
        }
        public void setMachineName(String MachineName)
        {
            this.MachineName = MachineName;
        }

        public String getMachineName()
        {
            return MachineName;
        }*/
    public void setTagName(String TagName)
    {
        this.TagName = TagName;
    }

    public String getTagName()
    {
        return TagName;
    }
   /* public void setTagComment(String TagComment)
    {
        this.TagComment = TagComment;
    }

    public String getTagComment()
    {
        return TagComment;
    }
    public void setGroupName(String GroupName)
    {
        this.GroupName = GroupName;
    }

    public String getGroupName()
    {
        return GroupName;
    }*/
    public void setAlarmValue(String AlarmValue)
    {
        this.AlarmValue = AlarmValue;
    }

    public String getAlarmValue()
    {
        return AlarmValue;
    }
   /* public void setAlarmValueDataType(Long AlarmValueDataType)
    {
        this.AlarmValueDataType = AlarmValueDataType;
    }

    public Long getAlarmValueDataType()
    {
        return AlarmValueDataType;
    }*/
    public void setLimitValue(String LimitValue)
    {
        this.LimitValue = LimitValue;
    }

    public String getLimitValue()
    {
        return LimitValue;
    }
   /* public void setLimitValueDataType(Long LimitValueDataType)
    {
        this.LimitValueDataType = LimitValueDataType;
    }

    public Long getLimitValueDataType()
    {
        return LimitValueDataType;
    }*/
    public void setAlarmType(String AlarmType)
    {
        this.AlarmType = AlarmType;
    }

    public String getAlarmType()
    {
        return AlarmType;
    }
   /* public void setPri(Long Pri)
    {
        this.Pri = Pri;
    }

    public Long getPri()
    {
        return Pri;
    }
    public void setQuality(Long Quality)
    {
        this.Quality = Quality;
    }

    public Long getQuality()
    {
        return Quality;
    }*/
    public void setAlarmTime(Date AlarmTime)
    {
        this.AlarmTimeT = AlarmTime;
    }

    public Date getAlarmTime()
    {
        return AlarmTimeT;
    }
    public void setAlarmTimeMs(Long AlarmTimeMs)
    {
        this.AlarmTimeMs = AlarmTimeMs;
    }

    public Long getAlarmTimeMs()
    {
        return AlarmTimeMs;
    }
    /*public void setEventTime(Date EventTime)
    {
        this.EventTime = EventTime;
    }

    public Date getEventTime()
    {
        return EventTime;
    }*/
    public void setEventTimeMs(Long EventTimeMs)
    {
        this.EventTimeMs = EventTimeMs;
    }

    public Long getEventTimeMs()
    {
        return EventTimeMs;
    }
   /* public void setOperatorName(String OperatorName)
    {
        this.OperatorName = OperatorName;
    }

    public String getOperatorName()
    {
        return OperatorName;
    }
    public void setOperatorDomain(String OperatorDomain)
    {
        this.OperatorDomain = OperatorDomain;
    }

    public String getOperatorDomain()
    {
        return OperatorDomain;
    }*/
    public void setResumeValue(String ResumeValue)
    {
        this.ResumeValue = ResumeValue;
    }

    public String getResumeValue()
    {
        return ResumeValue;
    }
   /* public void setResumeValueDataType(Long ResumeValueDataType)
    {
        this.ResumeValueDataType = ResumeValueDataType;
    }

    public Long getResumeValueDataType()
    {
        return ResumeValueDataType;
    }
    public void setEventType(String EventType)
    {
        this.EventType = EventType;
    }

    public String getEventType()
    {
        return EventType;
    }*/
    public void setAlarmText(String AlarmText)
    {
        this.AlarmText = AlarmText;
    }

    public String getAlarmText()
    {
        return AlarmText;
    }
    public void setExtendField1(String ExtendField1)
    {
        this.ExtendField1 = ExtendField1;
    }

    public String getExtendField1()
    {
        return ExtendField1;
    }
   /* public void setExtendField2(String ExtendField2)
    {
        this.ExtendField2 = ExtendField2;
    }

    public String getExtendField2()
    {
        return ExtendField2;
    }*/

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            /*.append("IOServerName", getIOServerName())
            .append("MachineName", getMachineName())*/
            .append("TagName", getTagName())
           /* .append("TagComment", getTagComment())
            .append("GroupName", getGroupName())*/
            .append("AlarmValue", getAlarmValue())
          /*  .append("AlarmValueDataType", getAlarmValueDataType())*/
            .append("LimitValue", getLimitValue())
            /*.append("LimitValueDataType", getLimitValueDataType())*/
            .append("AlarmType", getAlarmType())
            /*.append("Pri", getPri())
            .append("Quality", getQuality())*/
            .append("AlarmTime", getAlarmTime())
            .append("AlarmTimeMs", getAlarmTimeMs())
/*            .append("EventTime", getEventTime())*/
            .append("EventTimeMs", getEventTimeMs())
           /* .append("OperatorName", getOperatorName())
            .append("OperatorDomain", getOperatorDomain())*/
            .append("ResumeValue", getResumeValue())
           /* .append("ResumeValueDataType", getResumeValueDataType())
            .append("EventType", getEventType())*/
            .append("AlarmText", getAlarmText())
           /* .append("ExtendField1", getExtendField1())
            .append("ExtendField2", getExtendField2())*/
            .toString();
    }
}
