package com.ruoyi.project.module.deviceGroup.service;

import com.ruoyi.project.module.deviceGroup.domain.DeviceGroup;
import java.util.List;
import java.util.Map;

/**
 * 设备组 服务层
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public interface IDeviceGroupService 
{
	/**
	 * 查询设备组管理树
	 *
	 * @return 所有设备信息
	 */
	public List<Map<String, Object>> selectDeviceGroupTree();
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
     * 删除设备组信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteDeviceGroupByIds(String ids);
	
}
