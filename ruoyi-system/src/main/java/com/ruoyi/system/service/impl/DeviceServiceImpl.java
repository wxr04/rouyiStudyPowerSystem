package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.mapper.DeviceMapper;
import com.ruoyi.system.service.IDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.core.domain.entity.Device;


import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 电力监控Service业务层处理
 *
 * @author 微笑
 * @date 2023-10-19
 */
@Service
public class DeviceServiceImpl implements IDeviceService
{
    @Autowired
    private DeviceMapper deviceMapper;
/*
* 更加区域号查找设备
* departId用户所在区域号
* */
    @Override
    public List<Device> getDevicesByDepartId(Long departId) {
        List<Device>devices=new ArrayList<>();

        SysUser usr= getLoginUser().getUser();
        List<SysRole> roles=usr.getRoles();
        List<Integer> devIds=new ArrayList<>();

        //如果只有一个角色，role_key是common 并且查询的区域不是所在区域返回null
        if(roles!=null && roles.size()==1) {
            if (roles.get(0).getRoleKey().equals("common")&&(!usr.getDeptId().equals(departId))) {

                return devices;
            }
        }
        Device device=new Device();
        device.setDeptId(departId);
        devices=deviceMapper.selectDeviceList(device);
        return devices;
    }

    /**
     * 查询电力监控
     *
     * @param devId 电力监控主键
     * @return 电力监控
     */
    @Override
    public Device selectDeviceByDevId(Long devId)
    {
        return deviceMapper.selectDeviceByDevId(devId);
    }

    /**
     * 查询电力监控列表
     *
     * @param device 电力监控
     * @return 电力监控
     */
    @Override
    public List<Device> selectDeviceList(Device device)
    {
        SysUser usr= getLoginUser().getUser();
        List<SysRole> roles=usr.getRoles();

        //如果只有一个角色，role_key是common
        if(roles!=null && roles.size()==1) {
            if (roles.get(0).getRoleKey().equals("common")) {

                device.setDeptId(usr.getDeptId());
            }
        }
            return deviceMapper.selectDeviceList(device);
    }

    /**
     * 新增电力监控
     *
     * @param device 电力监控
     * @return 结果
     */
    @Override
    public int insertDevice(Device device)
    {
        return deviceMapper.insertDevice(device);
    }

    /**
     * 修改电力监控
     *
     * @param device 电力监控
     * @return 结果
     */
    @Override
    public int updateDevice(Device device)
    {
        device.setUpdateTime(DateUtils.getNowDate());
        return deviceMapper.updateDevice(device);
    }

    /**
     * 批量删除电力监控
     *
     * @param devIds 需要删除的电力监控主键
     * @return 结果
     */
    @Override
    public int deleteDeviceByDevIds(Long[] devIds)
    {
        return deviceMapper.deleteDeviceByDevIds(devIds);
    }

    /**
     * 删除电力监控信息
     *
     * @param devId 电力监控主键
     * @return 结果
     */
    @Override
    public int deleteDeviceByDevId(Long devId)
    {
        return deviceMapper.deleteDeviceByDevId(devId);
    }
}
