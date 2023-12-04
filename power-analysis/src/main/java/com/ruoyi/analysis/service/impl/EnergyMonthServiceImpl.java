package com.ruoyi.analysis.service.impl;

import java.util.*;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.analysis.domain.EnergyAnalysis;
import com.ruoyi.common.core.domain.entity.Device;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.easyExecl.DynamicExcelData;
import com.ruoyi.system.mapper.DeviceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.analysis.mapper.EnergyMonthMapper;
import com.ruoyi.analysis.domain.EnergyMonth;
import com.ruoyi.analysis.service.IEnergyMonthService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * powerEnergy analysis in monthService业务层处理
 *
 * @author 微笑
 * @date 2023-10-28
 */
@Service
public class EnergyMonthServiceImpl implements IEnergyMonthService
{
    @Autowired
    private EnergyMonthMapper energyMonthMapper;
    @Autowired
    private DeviceMapper deviceMapper;
    /**
     * 查询powerEnergy analysis in month
     *
     * @param id powerEnergy analysis in month主键
     * @return powerEnergy analysis in month
     */
    @Override
    public EnergyMonth selectEnergyMonthById(Long id)
    {
        return energyMonthMapper.selectEnergyMonthById(id);
    }
/*
* 根据所在区域号，获取所在的设备
* */
    @Override
    public List<Device> getDevicesByDepartId(EnergyMonth energyMonth) {
        List<Device>devices=new ArrayList<>();

        Long deptId= energyMonth.getDeptId();
        SysUser usr= getLoginUser().getUser();
        List<SysRole> roles=usr.getRoles();
        List<Integer> devIds=new ArrayList<>();

        //如果只有一个角色，role_key是common 并且查询的区域不是所在区域返回null
        if(roles!=null && roles.size()==1) {
            if (roles.get(0).getRoleKey().equals("common")&&(!usr.getDeptId().equals(deptId))) {

                return devices;
            }
        }
        Device device=new Device();
        device.setDeptId(deptId);
        devices=deviceMapper.selectDeviceList(device);
        return devices;
    }

    /*
* params中的depid是区域号，查询区域内的所有设备月电能数据
* */
    @Override
    public List<EnergyAnalysis> selectEnergyMonthListByDepId(EnergyMonth energyMonth,List<Device> devices) {
        List<EnergyAnalysis> analysisList=new ArrayList<>();

        //利用开始的采集时间，计算出下一个月第一天的时间，并做为查询的终止时间
        try {
            List<Integer> devIds=new ArrayList<>();
            if(devices==null||devices.size()==0)
                return analysisList;
            for(int i=0;i<devices.size();i++){
                devIds.add(Integer.valueOf(devices.get(i).getDevId().toString()));
            }

            Date dateStart=energyMonth.getCollectTime();
            Map<String ,Object> params=energyMonth.getParams();
            params.put("beginTime",dateStart);
            Calendar calendar= Calendar.getInstance();
            calendar.setTime(dateStart);
            calendar.add(Calendar.MONTH, 1);
            calendar.add(Calendar.DATE,1);
            /*int month=calendar.get(Calendar.MONTH)+2;
            String endTimeStr=Integer.toString(calendar.get(Calendar.YEAR))+"-"+String.format("%02d",month)
                    +"-"+"01 23:59:59";*/
            Date endTime=calendar.getTime();
            params.put("endTime",endTime);
            analysisList= analysisMonthEnergy(devIds,energyMonth);

        }
        catch ( Exception e){
            e.printStackTrace();
        }


        return analysisList;
    }

    /**
     * 查询powerEnergy analysis in month列表
     *
     * @param energyMonth 选择的设备id数组
     * @return powerEnergy analysis in month
     */
    @Override
    public List<EnergyAnalysis> selectEnergyMonthList(EnergyMonth energyMonth)
    {
        List<EnergyAnalysis> analysisList=new ArrayList<>();
        String devIdStr= (String) energyMonth.getParams().get("devIds");
        List<Integer> devIds= JSON.parseArray(devIdStr, Integer.class);
        if(devIds.size()==0)
            return analysisList;
        //利用开始的采集时间，计算出下一个月第一天的时间，并做为查询的终止时间
        try {
            Date dateStart=energyMonth.getCollectTime();
            Map<String ,Object> params=energyMonth.getParams();
            params.put("beginTime",dateStart);
            Calendar calendar= Calendar.getInstance();
            calendar.setTime(dateStart);
            calendar.add(Calendar.MONTH, 1);
            calendar.add(Calendar.DATE,1);
            /*int month=calendar.get(Calendar.MONTH)+2;
            String endTimeStr=Integer.toString(calendar.get(Calendar.YEAR))+"-"+String.format("%02d",month)
                    +"-"+"01 23:59:59";*/
            Date endTime=calendar.getTime();
            params.put("endTime",endTime);
        }
        catch ( Exception e){
            e.printStackTrace();
        }
        analysisList= analysisMonthEnergy(devIds,energyMonth);
        return analysisList;
       // return energyMonthMapper.selectEnergyMonthList(energyMonth);
    }
//获取月分析list
    private List<EnergyAnalysis> analysisMonthEnergy(List<Integer> devIds, EnergyMonth energyMonth) {
       /* SysUser usr= getLoginUser().getUser();
        List<SysRole> roles=usr.getRoles();
        //如果只有一个角色，role_key是common
        if(roles!=null && roles.size()==1){
            if(roles.get(0).getRoleKey().equals("common")){
               // dept.setDeptId(usr.getDeptId());
            }

        }*/
        Integer lenth=devIds.size();
        Integer i;
        List<EnergyMonth> energyList=new ArrayList<>();
        List<EnergyAnalysis> energyAnalysisList=new ArrayList<>();
        Long devId;
        for(i=0;i<lenth;i++){
            EnergyAnalysis energyAnalysis=new EnergyAnalysis();
            ArrayList<Float> energyData=new ArrayList<>();
            energyAnalysis.setEnergyData(energyData);
            energyMonth.setDevId(devIds.get(i));
            energyList=energyMonthMapper.selectEnergyMonthList(energyMonth);

            devId=devIds.get(i).longValue();
            Device device=deviceMapper.selectDeviceByDevId(devId);
            if (device!=null) {
               //如果没有找到月记录，那只返回线路名称
                energyAnalysis.setDevName(device.getDevName());

                //分析设备devId的月数据，并转换成
                getEneryAnalysisList(energyList, energyAnalysis,device.getPt(),device.getCt());

                energyAnalysisList.add(energyAnalysis);
            }
        }
        return energyAnalysisList;

    }
/*
* 获取月报表的头部
* */
    @Override
    public LinkedHashMap<String, DynamicExcelData> getHeadNameList() {
        LinkedHashMap<String,DynamicExcelData> headData=new LinkedHashMap<>();
        DynamicExcelData routeName=new DynamicExcelData("线路名称 电能（Kwh)","线路名称");
        String energyName;
        headData.put("线路名称",routeName);
        DynamicExcelData sumData=new DynamicExcelData("总计","0.0");

        for(int i=1;i<32;i++){
            energyName=String.valueOf(i)+"日";
            DynamicExcelData dayEnergyData=new DynamicExcelData(energyName,"");
            headData.put(energyName,dayEnergyData);
        }
        headData.put("总计",sumData);
        return headData;
    }

    /*
* 将EnergyList转换成月分析的记录
* */
    private void getEneryAnalysisList(List<EnergyMonth> energyList,EnergyAnalysis energyAnalysis,int pt,int ct) {
        //存放月电能数据
        ArrayList<Float> energyData=new ArrayList<Float>();
        Date date;
        Integer i;
        Integer listLength=energyList.size();
        Float energyTemp;
        int startDay;
        int endDay;
        int nowPosition=1;
        float k=1;
        float startDayEnergy;
        float endDayEnergy;
        float totalEnergy=0;
        int maxDayInMonth;
        Calendar calendar = Calendar.getInstance();
        if(listLength<2)
            return ;
        else {
            for (i=0;i<listLength-1;i++) {
                startDayEnergy= energyList.get(i).getEpp2();
                calendar.clear();
                calendar.setTime(energyList.get(i).getCollectTime());
                maxDayInMonth=calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
                startDay=calendar.get(Calendar.DAY_OF_MONTH);
                //如果之前没有记录电能，将没有记录电能赋值为0
                for(int j=nowPosition;j<startDay;j++){
                    energyData.add((float) 0.0);
                }
                //当前已经赋值的电能的天数更改为现在的日startDay
                nowPosition=startDay;
                //寻找下一天的记录
                for(int j=i+1;j<listLength;j++)
                {
                    calendar.setTime(energyList.get(j).getCollectTime());
                    endDay = calendar.get(Calendar.DAY_OF_MONTH);
                    if (startDay == (endDay - 1)) {

                        endDayEnergy = energyList.get(j).getEpp2();
                        energyTemp = (endDayEnergy - startDayEnergy) * pt * ct * k;
                        totalEnergy=totalEnergy+energyTemp;
                        energyData.add(energyTemp);
                        nowPosition = nowPosition+1;
                        i=j-1;
                        break;
                    }
                    else if((endDay-startDay)<0) {
                        //如果是最后一天
                        if (startDay == maxDayInMonth && endDay == 1)
                        {
                            endDayEnergy = energyList.get(j).getEpp2();
                            energyTemp = (endDayEnergy - startDayEnergy) * pt * ct * k;
                            totalEnergy=totalEnergy+energyTemp;
                            energyData.add(energyTemp);
                            nowPosition = nowPosition+1;
                        }

                    }
                    else if(endDay-startDay>1){
                        break;
                    }

                }
                //如果已经获取到了整月数据，退出循环
                if(energyData.size()==maxDayInMonth)
                    break;
            }
            energyAnalysis.setTotalEnergy(totalEnergy);
            energyAnalysis.setEnergyData(energyData);
        }

    }

    /**
     * 新增powerEnergy analysis in month
     *
     * @param energyMonth powerEnergy analysis in month
     * @return 结果
     */
    @Override
    public int insertEnergyMonth(EnergyMonth energyMonth)
    {
        return energyMonthMapper.insertEnergyMonth(energyMonth);
    }

    /**
     * 修改powerEnergy analysis in month
     *
     * @param energyMonth powerEnergy analysis in month
     * @return 结果
     */
    @Override
    public int updateEnergyMonth(EnergyMonth energyMonth)
    {
        return energyMonthMapper.updateEnergyMonth(energyMonth);
    }

    /**
     * 批量删除powerEnergy analysis in month
     *
     * @param ids 需要删除的powerEnergy analysis in month主键
     * @return 结果
     */
    @Override
    public int deleteEnergyMonthByIds(Long[] ids)
    {
        return energyMonthMapper.deleteEnergyMonthByIds(ids);
    }

    /**
     * 删除powerEnergy analysis in month信息
     *
     * @param id powerEnergy analysis in month主键
     * @return 结果
     */
    @Override
    public int deleteEnergyMonthById(Long id)
    {
        return energyMonthMapper.deleteEnergyMonthById(id);
    }
//出来month数据，将数据转成线路名称、1日、二日....12日、总计
    @Override
    public List<Map<String, Object>> controlMonthData(List<EnergyAnalysis> list) {
        List<Map<String,Object>> listData=new ArrayList<>();


        if(list.size()<1)
            return listData;
        for(int i=0;i<list.size();i++){
            //线路名称
            HashMap<String,Object> mapData=new HashMap<>();
            mapData.put("线路名称",list.get(i).getDevName());
            //总计
            mapData.put("总计",list.get(i).getTotalEnergy());
            ArrayList<Float> energyAnalysis=list.get(i).getEnergyData();
            //每日电能添加到数据中
            if(energyAnalysis!=null) {
                for (int j = 0; j < energyAnalysis.size(); j++) {
                 String dataName=String.valueOf(j+1)+"日";
                 mapData.put(dataName,energyAnalysis.get(j));
                }
            }
            listData.add(mapData);
        }
        return listData;
    }


}
