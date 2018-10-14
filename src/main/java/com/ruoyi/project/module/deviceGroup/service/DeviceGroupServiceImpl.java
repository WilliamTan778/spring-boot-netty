package com.ruoyi.project.module.deviceGroup.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.module.deviceGroup.mapper.DeviceGroupMapper;
import com.ruoyi.project.module.deviceGroup.domain.DeviceGroup;
import com.ruoyi.common.support.Convert;

/**
 * 设备组 服务层实现
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Service
public class DeviceGroupServiceImpl implements IDeviceGroupService 
{
	@Autowired
	private DeviceGroupMapper deviceGroupMapper;

	/**
     * 查询设备组信息
     * 
     * @param groupId 设备组ID
     * @return 设备组信息
     */
    @Override
	public DeviceGroup selectDeviceGroupById(Integer groupId)
	{
	    return deviceGroupMapper.selectDeviceGroupById(groupId);
	}
	
	/**
     * 查询设备组列表
     * 
     * @param deviceGroup 设备组信息
     * @return 设备组集合
     */
	@Override
	public List<DeviceGroup> selectDeviceGroupList(DeviceGroup deviceGroup)
	{
	    return deviceGroupMapper.selectDeviceGroupList(deviceGroup);
	}
	
    /**
     * 新增设备组
     * 
     * @param deviceGroup 设备组信息
     * @return 结果
     */
	@Override
	public int insertDeviceGroup(DeviceGroup deviceGroup)
	{
		deviceGroup.setCreateBy(ShiroUtils.getLoginName());
		return deviceGroupMapper.insertDeviceGroup(deviceGroup);
	}
	
	/**
     * 修改设备组
     * 
     * @param deviceGroup 设备组信息
     * @return 结果
     */
	@Override
	public int updateDeviceGroup(DeviceGroup deviceGroup)
	{
		deviceGroup.setUpdateBy(ShiroUtils.getLoginName());
	    return deviceGroupMapper.updateDeviceGroup(deviceGroup);
	}

	/**
     * 删除设备组对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteDeviceGroupByIds(String ids)
	{
		return deviceGroupMapper.deleteDeviceGroupByIds(Convert.toStrArray(ids));
	}

	@Override
	public List<Map<String, Object>> selectDeviceGroupTree() {
		List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
		List<DeviceGroup> groupList = selectDeviceGroupList(new DeviceGroup());
		trees = getTrees(groupList, false, null);
		return trees;
	}

	/**
	 * 对象转设备组树
	 *
	 * @param groupList 设备组列表
	 * @param isCheck 是否需要选中
	 * @param roleDeptList 角色已存在菜单列表
	 * @return
	 */
	public List<Map<String, Object>> getTrees(List<DeviceGroup> groupList, boolean isCheck, List<String> roleDeptList)
	{

		List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
		for (DeviceGroup group : groupList)
		{
			if (UserConstants.DEPT_NORMAL.equals(group.getStatus()))
			{
				Map<String, Object> groupMap = new HashMap<String, Object>();
                groupMap.put("id", group.getGroupId());
                groupMap.put("pId", group.getParentId());
                groupMap.put("name", group.getGroupName());
                groupMap.put("title", group.getGroupName());
				if (isCheck)
				{
                    groupMap.put("checked", roleDeptList.contains(group.getGroupId() + group.getGroupName()));
				}
				else
				{
                    groupMap.put("checked", false);
				}
				trees.add(groupMap);
			}
		}
		return trees;
	}

}
