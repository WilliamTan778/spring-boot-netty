package com.ruoyi.project.module.deviceGroup.mapper;

import com.ruoyi.project.module.deviceGroup.domain.DeviceGroup;
import java.util.List;	

/**
 * 设备组 数据层
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public interface DeviceGroupMapper 
{
	/**
     * 查询设备组信息
     * 
     * @param groupId 设备组ID
     * @return 设备组信息
     */
	public DeviceGroup selectDeviceGroupById(Integer groupId);
	
	/**
     * 查询设备组列表
     * 
     * @param deviceGroup 设备组信息
     * @return 设备组集合
     */
	public List<DeviceGroup> selectDeviceGroupList(DeviceGroup deviceGroup);

	/**
     * 新增设备组
     * 
     * @param deviceGroup 设备组信息
     * @return 结果
     */
	public int insertDeviceGroup(DeviceGroup deviceGroup);
	
	/**
     * 修改设备组
     * 
     * @param deviceGroup 设备组信息
     * @return 结果
     */
	public int updateDeviceGroup(DeviceGroup deviceGroup);
	
	/**
     * 删除设备组
     * 
     * @param groupId 设备组ID
     * @return 结果
     */
	public int deleteDeviceGroupById(Integer groupId);
	
	/**
     * 批量删除设备组
     * 
     * @param groupIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteDeviceGroupByIds(String[] groupIds);
	
}