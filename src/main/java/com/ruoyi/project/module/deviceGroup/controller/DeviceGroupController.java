package com.ruoyi.project.module.deviceGroup.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.module.deviceGroup.domain.DeviceGroup;
import com.ruoyi.project.module.deviceGroup.service.IDeviceGroupService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;

/**
 * 设备组 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Controller
@RequestMapping("/module/deviceGroup")
public class DeviceGroupController extends BaseController
{
    private String prefix = "module/deviceGroup";
	
	@Autowired
	private IDeviceGroupService deviceGroupService;
	
	@RequiresPermissions("module:deviceGroup:view")
	@GetMapping()
	public String deviceGroup()
	{
	    return prefix + "/deviceGroup";
	}


    /**
	 * 查询设备组列表
	 */
	@RequiresPermissions("module:deviceGroup:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(DeviceGroup deviceGroup)
	{
		startPage();
        List<DeviceGroup> list = deviceGroupService.selectDeviceGroupList(deviceGroup);
		return getDataTable(list);
	}
	
	/**
	 * 新增设备组
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存设备组
	 */
	@RequiresPermissions("module:deviceGroup:add")
	@Log(title = "设备组", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(DeviceGroup deviceGroup)
	{		
		return toAjax(deviceGroupService.insertDeviceGroup(deviceGroup));
	}

	/**
	 * 修改设备组
	 */
	@GetMapping("/edit/{groupId}")
	public String edit(@PathVariable("groupId") Integer groupId, ModelMap mmap)
	{
		DeviceGroup deviceGroup = deviceGroupService.selectDeviceGroupById(groupId);
		mmap.put("deviceGroup", deviceGroup);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存设备组
	 */
	@RequiresPermissions("module:deviceGroup:edit")
	@Log(title = "设备组", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(DeviceGroup deviceGroup)
	{		
		return toAjax(deviceGroupService.updateDeviceGroup(deviceGroup));
	}
	
	/**
	 * 删除设备组
	 */
	@RequiresPermissions("module:deviceGroup:remove")
	@Log(title = "设备组", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(deviceGroupService.deleteDeviceGroupByIds(ids));
	}

	/**
     * 设备组态
     */

	/**
	 * 加载设备组列表树
	 */
	@GetMapping("/treeData")
	@ResponseBody
	public List<Map<String, Object>> treeData()
	{
		List<Map<String, Object>> tree = deviceGroupService.selectDeviceGroupTree();
		return tree;
	}

}
