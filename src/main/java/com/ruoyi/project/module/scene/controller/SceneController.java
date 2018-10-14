package com.ruoyi.project.module.scene.controller;

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
import com.ruoyi.project.module.scene.domain.Scene;
import com.ruoyi.project.module.scene.service.ISceneService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;

/**
 * 场景 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Controller
@RequestMapping("/module/scene")
public class SceneController extends BaseController
{
    private String prefix = "module/scene";
	
	@Autowired
	private ISceneService sceneService;
	
	@RequiresPermissions("module:scene:view")
	@GetMapping()
	public String scene()
	{
	    return prefix + "/scene";
	}
	
	/**
	 * 查询场景列表
	 */
	@RequiresPermissions("module:scene:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Scene scene)
	{
		startPage();
        List<Scene> list = sceneService.selectSceneList(scene);
		return getDataTable(list);
	}
	
	/**
	 * 新增场景
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存场景
	 */
	@RequiresPermissions("module:scene:add")
	@Log(title = "场景", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Scene scene)
	{		
		return toAjax(sceneService.insertScene(scene));
	}

	/**
	 * 修改场景
	 */
	@GetMapping("/edit/{sceneId}")
	public String edit(@PathVariable("sceneId") Integer sceneId, ModelMap mmap)
	{
		Scene scene = sceneService.selectSceneById(sceneId);
		mmap.put("scene", scene);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存场景
	 */
	@RequiresPermissions("module:scene:edit")
	@Log(title = "场景", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Scene scene)
	{		
		return toAjax(sceneService.updateScene(scene));
	}
	
	/**
	 * 删除场景
	 */
	@RequiresPermissions("module:scene:remove")
	@Log(title = "场景", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(sceneService.deleteSceneByIds(ids));
	}
	
}
