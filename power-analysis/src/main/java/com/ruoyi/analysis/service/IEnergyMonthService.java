package com.ruoyi.analysis.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.analysis.domain.EnergyAnalysis;
import com.ruoyi.analysis.domain.EnergyMonth;
import com.ruoyi.common.core.domain.entity.Device;
import com.ruoyi.common.utils.easyExecl.DynamicExcelData;

/**
 * powerEnergy analysis in monthService接口
 *
 * @author 微笑
 * @date 2023-10-28
 */
public interface IEnergyMonthService
{
    /**
     * 查询powerEnergy analysis in month
     *
     * @param id powerEnergy analysis in month主键
     * @return powerEnergy analysis in month
     */
    public EnergyMonth selectEnergyMonthById(Long id);

    /**
     * 查询powerEnergy analysis in month列表
     *
     * @param energyMonth powerEnergy analysis in month
     * @return powerEnergy analysis in month集合
     */
   public List<EnergyAnalysis> selectEnergyMonthList(EnergyMonth energyMonth);

    /**
     * 新增powerEnergy analysis in month
     *
     * @param energyMonth powerEnergy analysis in month
     * @return 结果
     */
    public int insertEnergyMonth(EnergyMonth energyMonth);

    /**
     * 修改powerEnergy analysis in month
     *
     * @param energyMonth powerEnergy analysis in month
     * @return 结果
     */
    public int updateEnergyMonth(EnergyMonth energyMonth);

    /**
     * 批量删除powerEnergy analysis in month
     *
     * @param ids 需要删除的powerEnergy analysis in month主键集合
     * @return 结果
     */
    public int deleteEnergyMonthByIds(Long[] ids);

    /**
     * 删除powerEnergy analysis in month信息
     *
     * @param id powerEnergy analysis in month主键
     * @return 结果
     */
    public int deleteEnergyMonthById(Long id);


    //List<EnergyAnalysis> exportEnergyMonthList(EnergyMonth energyMonth);

    List<Map<String, Object>> controlMonthData(List<EnergyAnalysis> list);

    LinkedHashMap<String, DynamicExcelData> getHeadNameList();
//根据区域号获取设备数据
    List<EnergyAnalysis> selectEnergyMonthListByDepId(EnergyMonth energyMonth,List<Device> devices);
/*
* 根据区域号获取所属设备
* */
    List<Device> getDevicesByDepartId(EnergyMonth energyMonth);

    // List<EnergyMonth> selectEnergyMonthList(List<Integer> devIds);
}
