package com.ruoyi.analysis.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;


import com.ruoyi.analysis.domain.EnergyAnalysis;
import com.ruoyi.common.core.domain.entity.Device;
import com.ruoyi.common.utils.easyExecl.DynamicExcelData;
import com.ruoyi.common.utils.easyExecl.EasyExcelUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.analysis.domain.EnergyMonth;
import com.ruoyi.analysis.service.IEnergyMonthService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.alibaba.fastjson2.JSON;
/**
 * powerEnergy analysis in monthController
 *
 * @author 微笑
 * @date 2023-10-28
 */
@RestController
@RequestMapping("/analysis/energyMonth")
public class EnergyMonthController extends BaseController
{
    @Autowired
    private IEnergyMonthService energyMonthService;
     /*
     *获取devtree内容
     * */

    /**
     * 查询powerEnergy analysis in month列表
     */
    @PreAuthorize("@ss.hasPermi('analysis:energyMonth:list')")
    @GetMapping("/list")
    public TableDataInfo list(EnergyMonth energyMonth)
    {

         startPage();
         //根据区域号，获取设备
         List<Device> deviceList=energyMonthService.getDevicesByDepartId(energyMonth);
        //System.out.println(energyMonth.getCollectTime());

        List<EnergyAnalysis> list = energyMonthService.selectEnergyMonthListByDepId(energyMonth,deviceList);


        return getDataTable(list,deviceList);
    }

    /**
     * 导出powerEnergy analysis in month列表
     */
    @PreAuthorize("@ss.hasPermi('analysis:energyMonth:export')")
    @Log(title = "powerEnergy analysis in month", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EnergyMonth energyMonth)
    {
        //根据区域号，获取设备
        List<Device> deviceList=energyMonthService.getDevicesByDepartId(energyMonth);
        List<EnergyAnalysis> list =energyMonthService.selectEnergyMonthListByDepId(energyMonth,deviceList);
        List<Map<String, Object>> dataList=energyMonthService.controlMonthData(list);
        LinkedHashMap<String, DynamicExcelData> headNameMap=new LinkedHashMap<>();
        headNameMap=energyMonthService.getHeadNameList();
        EasyExcelUtil.noModelWriteMy(dataList,"月电能","月电能分析",headNameMap,response);
       // util.exportExcel(response, list, "powerEnergy analysis in month数据");
    }

    /**
     * 获取powerEnergy analysis in month详细信息
     */
    @PreAuthorize("@ss.hasPermi('analysis:energyMonth:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(energyMonthService.selectEnergyMonthById(id));
    }

    /**
     * 新增powerEnergy analysis in month
     */
    @PreAuthorize("@ss.hasPermi('analysis:energyMonth:add')")
    @Log(title = "powerEnergy analysis in month", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EnergyMonth energyMonth)
    {
        return toAjax(energyMonthService.insertEnergyMonth(energyMonth));
    }

    /**
     * 修改powerEnergy analysis in month
     */
    @PreAuthorize("@ss.hasPermi('analysis:energyMonth:edit')")
    @Log(title = "powerEnergy analysis in month", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EnergyMonth energyMonth)
    {
        return toAjax(energyMonthService.updateEnergyMonth(energyMonth));
    }

    /**
     * 删除powerEnergy analysis in month
     */
    @PreAuthorize("@ss.hasPermi('analysis:energyMonth:remove')")
    @Log(title = "powerEnergy analysis in month", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(energyMonthService.deleteEnergyMonthByIds(ids));
    }
}
