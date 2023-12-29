package com.ruoyi.analysis.mapper;

import com.ruoyi.analysis.domain.EnergyYear;

import java.util.List;


/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-12-19
 */
public interface EnergyYearMapper
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
    public List<EnergyYear> selectEnergyYearList(EnergyYear energyYear);

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
     * 删除【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteEnergyYearById(Long id);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEnergyYearByIds(Long[] ids);
}
