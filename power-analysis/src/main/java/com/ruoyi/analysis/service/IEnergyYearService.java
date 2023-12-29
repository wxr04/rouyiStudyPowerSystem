package com.ruoyi.analysis.service;

import com.ruoyi.analysis.domain.EnergyAnalysis;

import com.ruoyi.analysis.domain.EnergyYear;
import com.ruoyi.common.core.domain.entity.Device;
import com.ruoyi.common.utils.easyExecl.DynamicExcelData;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * 【请填写功能名称】Service接口
 *
 * @author ruoyi
 * @date 2023-12-19
 */
public interface IEnergyYearService
{
    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public EnergyYear selectEnergyYearById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param energyYear 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<EnergyAnalysis> selectEnergyYearList(EnergyYear energyYear);

    /**
     * 新增【请填写功能名称】
     *
     * @param energyYear 【请填写功能名称】
     * @return 结果
     */
    public int insertEnergyYear(EnergyYear energyYear);

    /**
     * 修改【请填写功能名称】
     *
     * @param energyYear 【请填写功能名称】
     * @return 结果
     */
    public int updateEnergyYear(EnergyYear energyYear);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteEnergyYearByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteEnergyYearById(Long id);

    List<EnergyAnalysis> selectEnergyMonthListByDepId(EnergyYear energyYear, List<Device> deviceList);

    List<Map<String, Object>> controlYearData(List<EnergyAnalysis> list);
    //获取导出表格表头
    LinkedHashMap<String, DynamicExcelData> getHeadNameList();


}
