package com.ruoyi.alarm.service.impl;

import java.awt.geom.Arc2D;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.alarm.mapper.AlarmMapper;
import com.ruoyi.alarm.domain.Alarm;
import com.ruoyi.alarm.service.IAlarmService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 报警查询Service业务层处理
 *
 * @author weixiao
 * @date 2024-01-12
 */
@Service
public class AlarmServiceImpl implements IAlarmService
{
    @Autowired
    private AlarmMapper alarmMapper;

    /**
     * 查询报警查询
     *
     * @param id 报警查询主键
     * @return 报警查询
     */
    @Override
    public Alarm selectAlarmById(Long id)
    {
        return alarmMapper.selectAlarmById(id);
    }

    /**
     * 查询报警查询列表
     *
     * @param alarm 报警查询
     * @return 报警查询
     */
    @Override
    public List<Alarm> selectAlarmList(Alarm alarm)
    {
        SysUser usr= getLoginUser().getUser();
        List<SysRole> roles=usr.getRoles();
        //如果只有一个角色，role_key是common 并且查询的区域不是所在区域返回null
        if(roles!=null && roles.size()==1) {
            if (roles.get(0).getRoleKey().equals("common")) {
               alarm.setDeptId(Integer.parseInt(usr.getDeptId().toString()));
               alarm.setUserId(Integer.parseInt(usr.getUserId().toString()));
            }
        }
        //如果查询时间不为空，将时间退后8小时；可能以后不要
        if(alarm.getParams()!=null&&alarm.getParams().get("beginTime")!=null)
        {
            String dataTimeS=addHour(alarm.getParams().get("beginTime"),-8);
            alarm.getParams().replace("beginTime",dataTimeS);
            dataTimeS=addHour(alarm.getParams().get("endTime"),-8);
            alarm.getParams().replace("endTime",dataTimeS);
        }
        List<Alarm> alarmList=alarmMapper.selectAlarmList(alarm);
        //获取提示信息
        if(alarmList!=null)
        {
            for (Alarm alarmL : alarmList) {
                getAlarmNotice(alarmL);
                //处理显示报警值的为数
               String  tempS=String.format("%.2f",Float.parseFloat(alarmL.getLimitValue()));
                alarmL.setLimitValue(tempS);
                tempS=String.format("%.2f",Float.parseFloat(alarmL.getAlarmValue()));
                alarmL.setAlarmValue(tempS);
                alarmL.setAlarmTimeS(DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, alarmL.getAlarmTime()));
               //alarmL.setAlarmExplain(alarmL.getDevName()+alarmL.getAlarmText());
            }
        }
        return alarmList;
    }
//将查询的时间减去8hour
    private String addHour(Object beginTime, int hour) {
        Calendar calendar=Calendar.getInstance();
        calendar.setTime(DateUtils.parseDate(beginTime));
        calendar.add(Calendar.HOUR_OF_DAY,hour);
        return DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS,calendar.getTime());
    }

    //获取每条报警信息的提示内容
    private void getAlarmNotice(Alarm alarm) {
        if(alarm.getTagName()!=null) {
            String[] args = getDevParam(alarm.getTagName());

                //alarm.setAlarmExplain(alarm.getDevName()+":"+alarm.getAlarmText()+"报警");
            alarm.setAlarmExplain(args[2]);
        }
        else
            alarm.setAlarmExplain(alarm.getAlarmText());
    }
//获取设备com端口号，和设备地址
    private String[] getDevParam(String tagName){
        String[] args=new String[3];
        //Ua1_1 找到_的位置
        int position=tagName.indexOf("_");
        if(position==-1) {
            args[0] = "0";
            args[1]="0";
            args[2]="其他";
        }
        else {
          /*  //端口号
            if(position>0)
                args[0]=tagName.substring(position-1,1);
            else
                args[0]="0";
            //设备地址
            if(position+1>tagName.length())
                args[1]="0";
            else
                args[1]=tagName.substring(position+1);
            //变量类别，电压、电流、功率等
            if(position>1)
                args[2]=tagName.substring(0,position-1);
            else
                args[2]="0";*/
            if(tagName.indexOf("U")>-1)
                args[2]="电压";
            else if(tagName.indexOf("I")>-1)
                args[2]="电流";
            else if(tagName.indexOf("P")>-1)
                args[2]="功率";
            else
                args[2]="其他";
        }
        return args;
    }
    /**
     * 新增报警查询
     *
     * @param alarm 报警查询
     * @return 结果
     */
    @Override
    public int insertAlarm(Alarm alarm)
    {
        return alarmMapper.insertAlarm(alarm);
    }

    /**
     * 修改报警查询
     *
     * @param alarm 报警查询
     * @return 结果
     */
    @Override
    public int updateAlarm(Alarm alarm)
    {
        return alarmMapper.updateAlarm(alarm);
    }

    @Override
    public List<Map<String, Object>> controlMonthData(List<Alarm> list) {
       /* List<Map<String,Object>> listData=new ArrayList<>();


        if(list.size()<1)
            return listData;
        for(int i=0;i<list.size();i++){
            //线路名称
            HashMap<String,Object> mapData=new HashMap<>();
            mapData.put("报警设备",list.get(i).getDevName());
            //报警类别
            mapData.put("报警类别",list.get(i).getAlarmExplain());
            //报警值
            mapData.put("报警值",list.get(i).getAlarmValue());
            //报警限值
            mapData.put("报警限值",list.get(i).getAlarmValue());
            listData.add(mapData);
        }
        return listData;*/
        return null;
    }

    /**
     * 批量删除报警查询
     *
     * @param ids 需要删除的报警查询主键
     * @return 结果
     */
    @Override
    public int deleteAlarmByIds(Long[] ids)
    {
        return alarmMapper.deleteAlarmByIds(ids);
    }

    /**
     * 删除报警查询信息
     *
     * @param id 报警查询主键
     * @return 结果
     */
    @Override
    public int deleteAlarmById(Long id)
    {
        return alarmMapper.deleteAlarmById(id);
    }
}
