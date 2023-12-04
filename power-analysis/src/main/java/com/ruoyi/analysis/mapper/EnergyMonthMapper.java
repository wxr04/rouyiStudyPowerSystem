package com.ruoyi.analysis.mapper;

import java.util.List;
import com.ruoyi.analysis.domain.EnergyMonth;

/**
 * powerEnergy analysis in monthMapper接口
 * 
 * @author 微笑
 * @date 2023-10-28
 */
public interface EnergyMonthMapper 
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
    public List<EnergyMonth> selectEnergyMonthList(EnergyMonth energyMonth);

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
     * 删除powerEnergy analysis in month
     * 
     * @param id powerEnergy analysis in month主键
     * @return 结果
     */
    public int deleteEnergyMonthById(Long id);

    /**
     * 批量删除powerEnergy analysis in month
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEnergyMonthByIds(Long[] ids);
}
