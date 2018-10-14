package com.ruoyi.project.module.deviceGroup.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 设备组表 bu_device_group
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public class DeviceGroup extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 部门id */
	private Integer groupId;
	/** 父部门id */
	private Integer parentId;
	/** 部门名称 */
	private String groupName;
	/** 显示顺序 */
	private Integer orderNum;
	/** 部门状态（0正常 1停用） */
	private String status;
	/** 删除标志（0正常，2删除） */
	private String delFlag;

	public void setGroupId(Integer groupId) 
	{
		this.groupId = groupId;
	}

	public Integer getGroupId() 
	{
		return groupId;
	}
	public void setParentId(Integer parentId) 
	{
		this.parentId = parentId;
	}

	public Integer getParentId() 
	{
		return parentId;
	}
	public void setGroupName(String groupName) 
	{
		this.groupName = groupName;
	}

	public String getGroupName() 
	{
		return groupName;
	}
	public void setOrderNum(Integer orderNum) 
	{
		this.orderNum = orderNum;
	}

	public Integer getOrderNum() 
	{
		return orderNum;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getStatus()
	{
		return status;
	}
	public void setDelFlag(String delFlag)
	{
		this.delFlag = delFlag;
	}

	public String getDelFlag() 
	{
		return delFlag;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("groupId", getGroupId())
            .append("parentId", getParentId())
            .append("groupName", getGroupName())
            .append("orderNum", getOrderNum())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
