package com.ruoyi.project.module.scene.mapper;

import com.ruoyi.project.module.scene.domain.Scene;
import java.util.List;	

/**
 * 场景 数据层
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public interface SceneMapper 
{
	/**
     * 查询场景信息
     * 
     * @param sceneId 场景ID
     * @return 场景信息
     */
	public Scene selectSceneById(Integer sceneId);
	
	/**
     * 查询场景列表
     * 
     * @param scene 场景信息
     * @return 场景集合
     */
	public List<Scene> selectSceneList(Scene scene);
	
	/**
     * 新增场景
     * 
     * @param scene 场景信息
     * @return 结果
     */
	public int insertScene(Scene scene);
	
	/**
     * 修改场景
     * 
     * @param scene 场景信息
     * @return 结果
     */
	public int updateScene(Scene scene);
	
	/**
     * 删除场景
     * 
     * @param sceneId 场景ID
     * @return 结果
     */
	public int deleteSceneById(Integer sceneId);
	
	/**
     * 批量删除场景
     * 
     * @param sceneIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteSceneByIds(String[] sceneIds);
	
}