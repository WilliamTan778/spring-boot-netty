package com.ruoyi.project.module.device.mapper;

import com.ruoyi.project.module.device.domain.Device;
import java.util.List;	

/**
 * 设备 数据层
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public interface DeviceMapper 
{
	/**
     * 查询设备信息
     * 
     * @param id 设备ID
     * @return 设备信息
     */
	public Device selectDeviceById(Long id);
	
	/**
     * 查询设备列表
     * 
     * @param device 设备信息
     * @return 设备集合
     */
	public List<Device> selectDeviceList(Device device);
	
	/**
     * 新增设备
     * 
     * @param device 设备信息
     * @return 结果
     */
	public int insertDevice(Device device);
	
	/**
     * 修改设备
     * 
     * @param device 设备信息
     * @return 结果
     */
	public int updateDevice(Device device);
	
	/**
     * 删除设备
     * 
     * @param id 设备ID
     * @return 结果
     */
	public int deleteDeviceById(Long id);
	
	/**
     * 批量删除设备
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteDeviceByIds(Long[] ids);
	
}