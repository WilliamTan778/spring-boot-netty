package com.ruoyi.project.module.device.domain;

import com.ruoyi.project.module.deviceGroup.domain.DeviceGroup;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 设备表 bu_device
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public class Device extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	/** 主键*/
	private Long id;
	/** 设备id */
	private String deviceId;
	/** 设备名称 */
	private String deviceName;
	/** 设备状态（0-停用，1-正常） */
	private String deviceStatus;
	/** 设备类型 */
	private String deviceType;
    /** 设备端类型 */
	private String deviceTag;

	/** 删除标志（0代表存在 2代表删除） */
	private String delFlag;
	/** 设备采集参数 */
	private String deviceParam;

	private String deviceGroupId;

	/** 设备组对象 */
	private DeviceGroup deviceGroup;

	public Long getId() {return id;}
	public void setId(Long id) {this.id = id;}

	public void setDeviceId(String deviceId) 
	{
		this.deviceId = deviceId;
	}
	public String getDeviceId() 
	{
		return deviceId;
	}

	public void setDeviceName(String deviceName) 
	{
		this.deviceName = deviceName;
	}
	public String getDeviceName() 
	{
		return deviceName;
	}

	public void setDeviceStatus(String deviceStatus) 
	{
		this.deviceStatus = deviceStatus;
	}
	public String getDeviceStatus() 
	{
		return deviceStatus;
	}

	public void setDeviceType(String deviceType) 
	{
		this.deviceType = deviceType;
	}
	public String getDeviceType() 
	{
		return deviceType;
	}

    public String getDeviceTag() { return deviceTag;}
    public void setDeviceTag(String deviceTag) { this.deviceTag = deviceTag;}

	public void setDeviceGroupId(String deviceGroupId) { this.deviceGroupId = deviceGroupId; }
	public String getDeviceGroupId() { return deviceGroupId; }

	public void setDelFlag(String delFlag){this.delFlag = delFlag;}
	public String getDelFlag() 
	{
		return delFlag;
	}

    public String getDeviceParam() {return deviceParam;}
    public void setDeviceParam(String deviceParam) {this.deviceParam = deviceParam;}

	public void setDeviceGroup(DeviceGroup deviceGroup) {
		this.deviceGroup = deviceGroup;
	}

	public DeviceGroup getDeviceGroup() {
		return deviceGroup;
	}

	@Override
    public String toString() {
        return "Device{" +
                "id=" + id +
                ", deviceId='" + deviceId + '\'' +
                ", deviceName='" + deviceName + '\'' +
                ", deviceStatus='" + deviceStatus + '\'' +
                ", deviceType='" + deviceType + '\'' +
                ", deviceTag='" + deviceTag + '\'' +
				", deviceGroupId='" + deviceGroupId + '\'' +
				", DeviceGroup='" + deviceGroup + '\'' +
                ", delFlag='" + delFlag + '\'' +
                ", deviceParam='" + deviceParam + '\'' +
                '}';
    }
}
