package com.ruoyi.project.module.device.service;

import java.util.List;

import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.module.device.mapper.DeviceMapper;
import com.ruoyi.project.module.device.domain.Device;
import com.ruoyi.project.module.device.service.IDeviceService;
import com.ruoyi.common.support.Convert;

/**
 * 设备 服务层实现
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Service
public class DeviceServiceImpl implements IDeviceService 
{
	@Autowired
	private DeviceMapper deviceMapper;

	/**
     * 查询设备信息
     * 
     * @param id 设备ID
     * @return 设备信息
     */
    @Override
	public Device selectDeviceById(String id)
	{
	    return deviceMapper.selectDeviceById(Convert.toLong(id));
	}
	
	/**
     * 查询设备列表
     * 
     * @param device 设备信息
     * @return 设备集合
     */
	@Override
	public List<Device> selectDeviceList(Device device)
	{
	    return deviceMapper.selectDeviceList(device);
	}
	
    /**
     * 新增设备
     * 
     * @param device 设备信息
     * @return 结果
     */
	@Override
	public int insertDevice(Device device)
	{
		device.setCreateBy(ShiroUtils.getLoginName());
		return deviceMapper.insertDevice(device);
	}
	
	/**
     * 修改设备
     * 
     * @param device 设备信息
     * @return 结果
     */
	@Override
	public int updateDevice(Device device)
	{
		device.setUpdateBy(ShiroUtils.getLoginName());
		return deviceMapper.updateDevice(device);
	}

	/**
     * 删除设备对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteDeviceByIds(String ids)
	{
		return deviceMapper.deleteDeviceByIds(Convert.toLongArray(ids));
	}
	
}
