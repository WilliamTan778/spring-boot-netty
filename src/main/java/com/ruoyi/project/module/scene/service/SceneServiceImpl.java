package com.ruoyi.project.module.scene.service;

import java.util.List;

import com.ruoyi.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.module.scene.mapper.SceneMapper;
import com.ruoyi.project.module.scene.domain.Scene;
import com.ruoyi.project.module.scene.service.ISceneService;
import com.ruoyi.common.support.Convert;

/**
 * 场景 服务层实现
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
@Service
public class SceneServiceImpl implements ISceneService 
{
	@Autowired
	private SceneMapper sceneMapper;

	/**
     * 查询场景信息
     * 
     * @param sceneId 场景ID
     * @return 场景信息
     */
    @Override
	public Scene selectSceneById(Integer sceneId)
	{
	    return sceneMapper.selectSceneById(sceneId);
	}
	
	/**
     * 查询场景列表
     * 
     * @param scene 场景信息
     * @return 场景集合
     */
	@Override
	public List<Scene> selectSceneList(Scene scene)
	{
	    return sceneMapper.selectSceneList(scene);
	}
	
    /**
     * 新增场景
     * 
     * @param scene 场景信息
     * @return 结果
     */
	@Override
	public int insertScene(Scene scene)
	{
		scene.setCreateBy(ShiroUtils.getLoginName());
		return sceneMapper.insertScene(scene);
	}
	
	/**
     * 修改场景
     * 
     * @param scene 场景信息
     * @return 结果
     */
	@Override
	public int updateScene(Scene scene)
	{
		scene.setUpdateBy(ShiroUtils.getLoginName());
		return sceneMapper.updateScene(scene);
	}

	/**
     * 删除场景对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteSceneByIds(String ids)
	{
		return sceneMapper.deleteSceneByIds(Convert.toStrArray(ids));
	}
	
}
