package com.ruoyi.analysis.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.analysis.domain.EnergyAnalysis;
import com.ruoyi.analysis.domain.EnergyMonth;
import com.ruoyi.analysis.domain.EnergyYear;
import com.ruoyi.analysis.service.IEnergyYearService;
import com.ruoyi.common.core.domain.entity.Device;
import com.ruoyi.common.utils.easyExecl.DynamicExcelData;
import com.ruoyi.common.utils.easyExecl.EasyExcelUtil;
import com.ruoyi.system.service.IDeviceService;
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

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2023-12-19
 */
@RestController
@RequestMapping("/analysis/energyYear")
public class EnergyYearController extends BaseController
{
    @Autowired
    private IEnergyYearService energyYearService;
    @Autowired
    private IDeviceService deviceService;
    /**
     * 查询powerEnergy analysis in month列表
     */
    @PreAuthorize("@ss.hasPermi('analysis:energyYear:compare')")
    @GetMapping("/compare")
    public TableDataInfo compareEnergyMonth(EnergyYear energyYear)
    {


        List<EnergyAnalysis> list = energyYearService.selectEnergyYearList(energyYear);
        return getDataTable(list);
    }
    /**
     * 查询【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('system:year:list')")
    @GetMapping("/list")
    public TableDataInfo list(EnergyYear energyYear)
    {
        startPage();
        //根据区域号，获取设备
        Long departId=energyYear.getDeptId();
        List<Device> deviceList=deviceService.getDevicesByDepartId(departId);
        //System.out.println(energyMonth.getCollectTime());
        List<EnergyAnalysis> list = energyYearService.selectEnergyMonthListByDepId(energyYear,deviceList);


        return getDataTable(list,deviceList);
    }

    /**
     * 导出年报表
     */
    @PreAuthorize("@ss.hasPermi('system:year:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EnergyYear energyYear)
    {
        //根据区域号，获取设备
        List<Device> deviceList=deviceService.getDevicesByDepartId(energyYear.getDeptId());
        List<EnergyAnalysis> list =energyYearService.selectEnergyMonthListByDepId(energyYear,deviceList);
        List<Map<String, Object>> dataList=energyYearService.controlYearData(list);
        LinkedHashMap<String, DynamicExcelData> headNameMap=new LinkedHashMap<>();
        headNameMap=energyYearService.getHeadNameList();
        EasyExcelUtil.noModelWriteMy(dataList,"月电能","月电能分析",headNameMap,response);
        // util.exportExcel(response, list, "powerEnergy analysis in month数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:year:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(energyYearService.selectEnergyYearById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:year:add')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EnergyYear energyYear)
    {
        return toAjax(energyYearService.insertEnergyYear(energyYear));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:year:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EnergyYear energyYear)
    {
        return toAjax(energyYearService.updateEnergyYear(energyYear));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('system:year:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(energyYearService.deleteEnergyYearByIds(ids));
    }
}
