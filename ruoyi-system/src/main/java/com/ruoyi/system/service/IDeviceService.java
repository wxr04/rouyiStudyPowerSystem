package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.Device;

/**
 * 电力监控Service接口
 *
 * @author 微笑
 * @date 2023-10-19
 */
public interface IDeviceService
{/*
 * 根据区域号获取所属设备
 * */

    public List<Device> getDevicesByDepartId(Long departId);
    /**
     * 查询电力监控
     *
     * @param devId 电力监控主键
     * @return 电力监控
     */
    public Device selectDeviceByDevId(Long devId);

    /**
     * 查询电力监控列表
     *
     * @param device 电力监控
     * @return 电力监控集合
     */
    public List<Device> selectDeviceList(Device device);

    /**
     * 新增电力监控
     *
     * @param device 电力监控
     * @return 结果
     */
    public int insertDevice(Device device);

    /**
     * 修改电力监控
     *
     * @param device 电力监控
     * @return 结果
     */
    public int updateDevice(Device device);

    /**
     * 批量删除电力监控
     *
     * @param devIds 需要删除的电力监控主键集合
     * @return 结果
     */
    public int deleteDeviceByDevIds(Long[] devIds);

    /**
     * 删除电力监控信息
     *
     * @param devId 电力监控主键
     * @return 结果
     */
    public int deleteDeviceByDevId(Long devId);
}
