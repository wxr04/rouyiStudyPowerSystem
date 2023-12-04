package com.ruoyi.powerMonitor.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.Device;
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
 * 电力监控Controller
 *
 * @author 微笑
 * @date 2023-10-19
 */
@RestController
@RequestMapping("/powerMonitor/powerMonitor")
public class DeviceController extends BaseController
{
    @Autowired
    private IDeviceService deviceService;

    /**
     * 查询电力监控列表
     */
    @PreAuthorize("@ss.hasPermi('device:realtime:list')")
    @GetMapping("/list")
    public TableDataInfo list(Device device)
    {
        startPage();
        List<Device> list = deviceService.selectDeviceList(device);
        return getDataTable(list);
    }

    /**
     * 导出电力监控列表
     */
    @PreAuthorize("@ss.hasPermi('powerMonitor:powerMonitor:export')")
    @Log(title = "电力监控", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Device device)
    {
        List<Device> list = deviceService.selectDeviceList(device);
        if(list!=null){
            int i;
            int rows=list.size();
            //处理显示的Excel显示内容
            for(i=0;i<rows;i++){
                Device dev=list.get(i);
                dev.setDeptName(dev.getDept().getDeptName());
                dev.setEneryF(dev.getPt()*dev.getCt());
            }
        }
        ExcelUtil<Device> util = new ExcelUtil<Device>(Device.class);
        util.exportExcel(response, list, "电力监控数据");
    }

    /**
     * 获取电力监控详细信息
     */
    @PreAuthorize("@ss.hasPermi('powerMonitor:powerMonitor:query')")
    @GetMapping(value = "/{devId}")
    public AjaxResult getInfo(@PathVariable("devId") Long devId)
    {
        return success(deviceService.selectDeviceByDevId(devId));
    }

    /**
     * 新增电力监控
     */
    @PreAuthorize("@ss.hasPermi('powerMonitor:powerMonitor:add')")
    @Log(title = "电力监控", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Device device)
    {
        return toAjax(deviceService.insertDevice(device));
    }

    /**
     * 修改电力监控
     */
    @PreAuthorize("@ss.hasPermi('powerMonitor:powerMonitor:edit')")
    @Log(title = "电力监控", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Device device)
    {
        return toAjax(deviceService.updateDevice(device));
    }

    /**
     * 删除电力监控
     */
    @PreAuthorize("@ss.hasPermi('powerMonitor:powerMonitor:remove')")
    @Log(title = "电力监控", businessType = BusinessType.DELETE)
	@DeleteMapping("/{devIds}")
    public AjaxResult remove(@PathVariable Long[] devIds)
    {
        return toAjax(deviceService.deleteDeviceByDevIds(devIds));
    }
}
