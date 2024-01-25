package com.ruoyi.alarm.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.alarm.domain.Alarm;
import com.ruoyi.alarm.service.IAlarmService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 报警查询Controller
 *
 * @author weixiao
 * @date 2024-01-12
 */
@RestController
@RequestMapping("/powerMonitor/alarm")
public class AlarmController extends BaseController
{
    @Autowired
    private IAlarmService alarmService;

    /**
     * 查询报警查询列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:alarm:list')")
    @Log(title = "报警查询", businessType = BusinessType.EXPORT)
    @GetMapping("/list")
    public TableDataInfo list(Alarm alarm)
    {
        startPage();
        List<Alarm> list = alarmService.selectAlarmList(alarm);
        return getDataTable(list);
    }

    /**
     * 导出报警查询列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:alarm:export')")
    @Log(title = "报警导出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Alarm alarm)
    {
        List<Alarm> list = alarmService.selectAlarmList(alarm);
        ExcelUtil<Alarm> util = new ExcelUtil<Alarm>(Alarm.class);
        util.exportExcel(response, list, "报警查询数据");
    }

    /**
     * 获取报警查询详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:alarm:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(alarmService.selectAlarmById(id));
    }

    /**
     * 新增报警查询
     */
    @PreAuthorize("@ss.hasPermi('alarm:alarm:add')")
    @Log(title = "报警查询", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Alarm alarm)
    {
        return toAjax(alarmService.insertAlarm(alarm));
    }

    /**
     * 修改报警查询
     */
    @PreAuthorize("@ss.hasPermi('alarm:alarm:edit')")
    @Log(title = "报警查询", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Alarm alarm)
    {
        return toAjax(alarmService.updateAlarm(alarm));
    }

    /**
     * 删除报警查询
     */
    @PreAuthorize("@ss.hasPermi('alarm:alarm:remove')")
    @Log(title = "报警查询", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmService.deleteAlarmByIds(ids));
    }
}
