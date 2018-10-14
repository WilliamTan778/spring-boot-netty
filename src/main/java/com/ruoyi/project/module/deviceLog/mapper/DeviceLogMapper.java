package com.ruoyi.project.module.deviceLog.mapper;

import com.ruoyi.project.module.deviceLog.domain.DeviceLog;
import java.util.List;	

/**
 * 设备数据日志 数据层
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public interface DeviceLogMapper 
{
	/**
     * 查询设备数据日志信息
     * 
     * @param id 设备数据日志ID
     * @return 设备数据日志信息
     */
	public DeviceLog selectDeviceLogById(String id);
	
	/**
     * 查询设备数据日志列表
     * 
     * @param deviceLog 设备数据日志信息
     * @return 设备数据日志集合
     */
	public List<DeviceLog> selectDeviceLogList(DeviceLog deviceLog);
	
	/**
     * 新增设备数据日志
     * 
     * @param deviceLog 设备数据日志信息
     * @return 结果
     */
	public int insertDeviceLog(DeviceLog deviceLog);
	
	/**
     * 修改设备数据日志
     * 
     * @param deviceLog 设备数据日志信息
     * @return 结果
     */
	public int updateDeviceLog(DeviceLog deviceLog);
	
	/**
     * 删除设备数据日志
     * 
     * @param id 设备数据日志ID
     * @return 结果
     */
	public int deleteDeviceLogById(String id);
	
	/**
     * 批量删除设备数据日志
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteDeviceLogByIds(String[] ids);
	
}