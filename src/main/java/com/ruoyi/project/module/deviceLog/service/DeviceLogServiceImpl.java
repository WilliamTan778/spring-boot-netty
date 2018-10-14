package com.ruoyi.project.module.deviceLog.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.module.deviceLog.mapper.DeviceLogMapper;
import com.ruoyi.project.module.deviceLog.domain.DeviceLog;
import com.ruoyi.project.module.deviceLog.service.IDeviceLogService;
import com.ruoyi.common.support.Convert;

/**
 * 设备数据日志 服务层实现
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Service
public class DeviceLogServiceImpl implements IDeviceLogService 
{
	@Autowired
	private DeviceLogMapper deviceLogMapper;

	/**
     * 查询设备数据日志信息
     * 
     * @param id 设备数据日志ID
     * @return 设备数据日志信息
     */
    @Override
	public DeviceLog selectDeviceLogById(String id)
	{
	    return deviceLogMapper.selectDeviceLogById(id);
	}
	
	/**
     * 查询设备数据日志列表
     * 
     * @param deviceLog 设备数据日志信息
     * @return 设备数据日志集合
     */
	@Override
	public List<DeviceLog> selectDeviceLogList(DeviceLog deviceLog)
	{
	    return deviceLogMapper.selectDeviceLogList(deviceLog);
	}
	
    /**
     * 新增设备数据日志
     * 
     * @param deviceLog 设备数据日志信息
     * @return 结果
     */
	@Override
	public int insertDeviceLog(DeviceLog deviceLog)
	{
	    return deviceLogMapper.insertDeviceLog(deviceLog);
	}
	
	/**
     * 修改设备数据日志
     * 
     * @param deviceLog 设备数据日志信息
     * @return 结果
     */
	@Override
	public int updateDeviceLog(DeviceLog deviceLog)
	{
	    return deviceLogMapper.updateDeviceLog(deviceLog);
	}

	/**
     * 删除设备数据日志对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteDeviceLogByIds(String ids)
	{
		return deviceLogMapper.deleteDeviceLogByIds(Convert.toStrArray(ids));
	}
	
}
