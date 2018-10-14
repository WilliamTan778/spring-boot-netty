package com.ruoyi.project.module.device.controller;

import java.util.List;

import com.ruoyi.project.module.deviceGroup.domain.DeviceGroup;
import com.ruoyi.project.module.deviceGroup.service.IDeviceGroupService;
import com.ruoyi.project.system.post.service.IPostService;
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
import com.ruoyi.project.module.device.domain.Device;
import com.ruoyi.project.module.device.service.IDeviceService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;

/**
 * 设备 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Controller
@RequestMapping("/module/device")
public class DeviceController extends BaseController
{
    private String prefix = "module/device";
	
	@Autowired
	private IDeviceService deviceService;

	@Autowired
	private IDeviceGroupService deviceGroupService;
	
	@RequiresPermissions("module:device:view")
	@GetMapping()
	public String device()
	{
	    return prefix + "/device";
	}
	
	/**
	 * 查询设备列表
	 */
	@RequiresPermissions("module:device:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Device device)
	{
		startPage();
        List<Device> list = deviceService.selectDeviceList(device);
		return getDataTable(list);
	}


	/**
	 * 设备采集端动态曲线图
	 *
	 */
	@GetMapping("/diagram")
	public String diagram()
	{
		return prefix + "/diagram";
	}

	/**
	 * 设备控制端界面
	 *
	 */
	@GetMapping("/command")
	public String command()
	{
		return prefix + "/command";
	}

	/**
	 * 新增设备
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存设备
	 */
	@RequiresPermissions("module:device:add")
	@Log(title = "设备", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Device device)
	{		
		return toAjax(deviceService.insertDevice(device));
	}

	/**
	 * 修改设备
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") String id, ModelMap mmap)
	{
		Device device = deviceService.selectDeviceById(id);
		mmap.put("device", device);
		DeviceGroup deviceGroup = new DeviceGroup();
		deviceGroup.setDelFlag("0");
		mmap.put("groups",deviceGroupService.selectDeviceGroupList(deviceGroup));
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存设备
	 */
	@RequiresPermissions("module:device:edit")
	@Log(title = "设备", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Device device)
	{		
		return toAjax(deviceService.updateDevice(device));
	}
	
	/**
	 * 删除设备
	 */
	@RequiresPermissions("module:device:remove")
	@Log(title = "设备", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(deviceService.deleteDeviceByIds(ids));
	}
	
}
