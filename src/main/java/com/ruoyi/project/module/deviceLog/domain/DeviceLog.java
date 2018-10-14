package com.ruoyi.project.module.deviceLog.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 设备数据日志表 bu_device_log
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public class DeviceLog extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 系统记录id */
	private String id;
	/** 设备id */
	private String deviceId;
	/** 设备名称 */
	private String deviceData;

	public void setId(String id) 
	{
		this.id = id;
	}

	public String getId() 
	{
		return id;
	}
	public void setDeviceId(String deviceId) 
	{
		this.deviceId = deviceId;
	}

	public String getDeviceId() 
	{
		return deviceId;
	}
	public void setDeviceData(String deviceData) 
	{
		this.deviceData = deviceData;
	}

	public String getDeviceData() 
	{
		return deviceData;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deviceId", getDeviceId())
            .append("deviceData", getDeviceData())
            .toString();
    }
}
