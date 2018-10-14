package com.ruoyi.project.module.deviceLog.controller;

import java.util.List;
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
import com.ruoyi.project.module.deviceLog.domain.DeviceLog;
import com.ruoyi.project.module.deviceLog.service.IDeviceLogService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;

/**
 * 设备数据日志 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Controller
@RequestMapping("/module/deviceLog")
public class DeviceLogController extends BaseController
{
    private String prefix = "module/deviceLog";
	
	@Autowired
	private IDeviceLogService deviceLogService;
	
	@RequiresPermissions("module:deviceLog:view")
	@GetMapping()
	public String deviceLog()
	{
	    return prefix + "/deviceLog";
	}
	
	/**
	 * 查询设备数据日志列表
	 */
	@RequiresPermissions("module:deviceLog:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(DeviceLog deviceLog)
	{
		startPage();
        List<DeviceLog> list = deviceLogService.selectDeviceLogList(deviceLog);
		return getDataTable(list);
	}
	
	/**
	 * 新增设备数据日志
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存设备数据日志
	 */
	@RequiresPermissions("module:deviceLog:add")
	@Log(title = "设备数据日志", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(DeviceLog deviceLog)
	{		
		return toAjax(deviceLogService.insertDeviceLog(deviceLog));
	}

	/**
	 * 修改设备数据日志
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") String id, ModelMap mmap)
	{
		DeviceLog deviceLog = deviceLogService.selectDeviceLogById(id);
		mmap.put("deviceLog", deviceLog);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存设备数据日志
	 */
	@RequiresPermissions("module:deviceLog:edit")
	@Log(title = "设备数据日志", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(DeviceLog deviceLog)
	{		
		return toAjax(deviceLogService.updateDeviceLog(deviceLog));
	}
	
	/**
	 * 删除设备数据日志
	 */
	@RequiresPermissions("module:deviceLog:remove")
	@Log(title = "设备数据日志", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(deviceLogService.deleteDeviceLogByIds(ids));
	}
	
}
