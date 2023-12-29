package com.ruoyi.analysis.service.impl;

import java.util.*;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.analysis.domain.EnergyAnalysis;
import com.ruoyi.analysis.domain.EnergyMonth;
import com.ruoyi.analysis.domain.EnergyYear;
import com.ruoyi.analysis.mapper.EnergyYearMapper;
import com.ruoyi.analysis.service.IEnergyYearService;
import com.ruoyi.common.core.domain.entity.Device;
import com.ruoyi.common.utils.easyExecl.DynamicExcelData;
import com.ruoyi.system.mapper.DeviceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2023-12-19
 */
@Service
public class EnergyYearServiceImpl implements IEnergyYearService
{
    @Autowired
    private EnergyYearMapper energyYearMapper;
    @Autowired
    private DeviceMapper deviceMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public EnergyYear selectEnergyYearById(Long id)
    {

        return energyYearMapper.selectEnergyYearById(id);
    }

    /**
     * 更加EnergyYear中的params中的devs查找年电能
     *
     * @param energyYear 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<EnergyAnalysis> selectEnergyYearList(EnergyYear energyYear)
    {
        List<EnergyAnalysis> analysisList=new ArrayList<>();
        String devIdStr= (String) energyYear.getParams().get("devIds");
        List<Integer> devIds= JSON.parseArray(devIdStr, Integer.class);
        if(devIds.size()==0)
            return analysisList;
        //利用开始的采集时间，计算出下一个月第一天的时间，并做为查询的终止时间
        try {
            Date dateStart=energyYear.getCollectTime();

            Map<String ,Object> params=energyYear.getParams();
            // params.put("beginTime",dateStart);
            Calendar calendar= Calendar.getInstance();

            calendar.setTime(dateStart);
            Integer year=calendar.get(Calendar.YEAR);
            String startTimeStr=Integer.toString(year)+"-01-01 00:00:00";
            String endTimeStr=Integer.toString(year+1)+"-01-01 23:59:59";
            params.put("beginTime",startTimeStr);
            params.put("endTime",endTimeStr);
        }
        catch ( Exception e){
            e.printStackTrace();
        }
        analysisList= analysisYearEnergy(devIds,energyYear);
        return analysisList;
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param energyYear 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertEnergyYear(EnergyYear energyYear)
    {
        return energyYearMapper.insertEnergyYear(energyYear);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param energyYear 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateEnergyYear(EnergyYear energyYear)
    {
        return energyYearMapper.updateEnergyYear(energyYear);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteEnergyYearByIds(Long[] ids)
    {
        return energyYearMapper.deleteEnergyYearByIds(ids);
    }
/*
* 获取年报表
* */
    @Override
    public List<EnergyAnalysis> selectEnergyMonthListByDepId(EnergyYear energyYear, List<Device> deviceList) {
        List<EnergyAnalysis> analysisList=new ArrayList<>();

        //利用开始的采集时间，计算出下一个月第一天的时间，并做为查询的终止时间
        try {
            List<Integer> devIds=new ArrayList<>();
            if(deviceList==null||deviceList.size()==0)
                return analysisList;
            for(int i=0;i<deviceList.size();i++){
                devIds.add(Integer.valueOf(deviceList.get(i).getDevId().toString()));
            }

            Date dateStart=energyYear.getCollectTime();

            Map<String ,Object> params=energyYear.getParams();
            // params.put("beginTime",dateStart);
            Calendar calendar= Calendar.getInstance();

            calendar.setTime(dateStart);
            Integer year=calendar.get(Calendar.YEAR);
            String startTimeStr=Integer.toString(year)+"-01-01 00:00:00";
            String endTimeStr=Integer.toString(year+1)+"-01-01 23:59:59";
            params.put("beginTime",startTimeStr);
            params.put("endTime",endTimeStr);
            analysisList= analysisYearEnergy(devIds,energyYear);

        }
        catch ( Exception e){
            e.printStackTrace();
        }


        return analysisList;
    }

 /*   @Override
    public List<EnergyAnalysis> selectEnergyMonthList(EnergyMonth energyMonth) {
        return null;
    }*/

    /*获取导出表格的表头
* */
    @Override
    public LinkedHashMap<String, DynamicExcelData> getHeadNameList() {
        LinkedHashMap<String,DynamicExcelData> headData=new LinkedHashMap<>();
        DynamicExcelData routeName=new DynamicExcelData("线路名称 电能（Kwh)","线路名称");
        String energyName;
        headData.put("线路名称",routeName);
        DynamicExcelData sumData=new DynamicExcelData("总计","0.0");

        for(int i=1;i<13;i++){
            energyName=String.valueOf(i)+"月";
            DynamicExcelData dayEnergyData=new DynamicExcelData(energyName,"");
            headData.put(energyName,dayEnergyData);
        }
        headData.put("总计",sumData);
        return headData;
    }

    //格式化year数据，将数据转成线路名称、1日、二日....12日、总计
    @Override
    public List<Map<String, Object>> controlYearData(List<EnergyAnalysis> list) {
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
                    String dataName=String.valueOf(j+1)+"月";
                    mapData.put(dataName,energyAnalysis.get(j));
                }
            }
            listData.add(mapData);
        }
        return listData;
    }

    private List<EnergyAnalysis> analysisYearEnergy(List<Integer> devIds, EnergyYear energyYear) {
        Integer lenth=devIds.size();
        Integer i;
        List<EnergyYear> energyList=new ArrayList<>();
        List<EnergyAnalysis> energyAnalysisList=new ArrayList<>();
        Long devId;
        for(i=0;i<lenth;i++){
            EnergyAnalysis energyAnalysis=new EnergyAnalysis();
            ArrayList<Float> energyData=new ArrayList<>();
            energyAnalysis.setEnergyData(energyData);
            energyYear.setDevId(devIds.get(i));
            energyList=energyYearMapper.selectEnergyYearList(energyYear);

            devId=devIds.get(i).longValue();
            Device device=deviceMapper.selectDeviceByDevId(devId);
            if (device!=null) {
                //如果没有找到月记录，那只返回线路名称
                energyAnalysis.setDevName(device.getDevName());

                //分析设备devId的年数据，并转换成
                getEneryAnalysisList(energyList, energyAnalysis,device.getPt(),device.getCt());

                energyAnalysisList.add(energyAnalysis);
            }
        }
        return energyAnalysisList;
    }

    private void getEneryAnalysisList(List<EnergyYear> energyList, EnergyAnalysis energyAnalysis, Integer pt, Integer ct) {
        //存放年电能数据
        ArrayList<Float> energyData = new ArrayList<Float>();
        Date date;
        Integer i;
        Integer listLength = energyList.size();
        Float energyTemp;
        int startMonth;
        int endMonth;
        int nowPosition = 1;
        float k = 1;
        float endMonthEnergy;
        float startMonthEnergy;
        float totalEnergy = 0;
        int maxDayInMonth;
        Calendar calendar = Calendar.getInstance();
        if (listLength < 2)
            return;
        else {
            for (i = 0; i < listLength - 1; i++) {
                startMonthEnergy = energyList.get(i).getEpp2();
                calendar.clear();
                calendar.setTime(energyList.get(i).getCollectTime());
                maxDayInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
                startMonth = calendar.get(Calendar.MONTH) + 1;
                //如果之前没有记录电能，将没有记录电能赋值为0
                for (int j = nowPosition; j < startMonth; j++) {
                    energyData.add((float) 0.0);
                }
                //当前已经赋值的电能的天数更改为现在的日startDay
                nowPosition = startMonth;
                //寻找下一天的记录
                for (int j = i + 1; j < listLength; j++) {
                    calendar.setTime(energyList.get(j).getCollectTime());
                    endMonth = calendar.get(Calendar.MONTH) + 1;
                    if (startMonth == (endMonth - 1)) {

                        endMonthEnergy = energyList.get(j).getEpp2();
                        energyTemp = (endMonthEnergy - startMonthEnergy) * pt * ct * k;
                        totalEnergy = totalEnergy + energyTemp;
                        energyData.add(energyTemp);
                        nowPosition = nowPosition + 1;
                        i = j - 1;
                        break;
                    } else if ((endMonth - startMonth) < 0) {
                        //如果是最后一天
                        if (startMonth == 12 && endMonth == 1) {
                            endMonthEnergy = energyList.get(j).getEpp2();
                            energyTemp = (endMonthEnergy - startMonthEnergy) * pt * ct * k;
                            totalEnergy = totalEnergy + energyTemp;
                            energyData.add(energyTemp);
                            nowPosition = nowPosition + 1;
                        }

                    } else if (endMonth - startMonth > 1) {
                        break;
                    }

                }
                //如果已经获取到了整月数据，退出循环
                if (energyData.size() == 12)
                    break;
            }
            energyAnalysis.setTotalEnergy(totalEnergy);
            energyAnalysis.setEnergyData(energyData);
        }
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteEnergyYearById(Long id)
    {
        return energyYearMapper.deleteEnergyYearById(id);
    }
}
