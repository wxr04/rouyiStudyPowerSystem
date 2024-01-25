package com.ruoyi.alarm.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.alarm.domain.Alarm;

/**
 * 报警查询Service接口
 *
 * @author weixiao
 * @date 2024-01-12
 */
public interface IAlarmService
{
    /**
     * 查询报警查询
     *
     * @param id 报警查询主键
     * @return 报警查询
     */
    public Alarm selectAlarmById(Long id);

    /**
     * 查询报警查询列表
     *
     * @param alarm 报警查询
     * @return 报警查询集合
     */
    public List<Alarm> selectAlarmList(Alarm alarm);

    /**
     * 新增报警查询
     *
     * @param alarm 报警查询
     * @return 结果
     */
    public int insertAlarm(Alarm alarm);

    /**
     * 修改报警查询
     *
     * @param alarm 报警查询
     * @return 结果
     */
    public int updateAlarm(Alarm alarm);

    /**
     * 批量删除报警查询
     *
     * @param ids 需要删除的报警查询主键集合
     * @return 结果
     */
    public int deleteAlarmByIds(Long[] ids);

    /**
     * 删除报警查询信息
     *
     * @param id 报警查询主键
     * @return 结果
     */
    public int deleteAlarmById(Long id);
/*
处理数据，为导出表格
* */
    List<Map<String, Object>> controlMonthData(List<Alarm> list);
}
