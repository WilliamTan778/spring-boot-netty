package com.ruoyi.project.module.scene.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 场景表 bu_scene
 * 
 * @author ruoyi
 * @date 2018-09-03
 */
public class Scene extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/**  */
	private Integer sceneId;
	/** 场景名称 */
	private String sceneName;
	/** 场景状态（0启用，1停用） */
	private String sceneStatus;
	/** 场景参数 */
	private String sceneParams;
	/** 删除标志（0-正常，2删除） */
	private String delFlag;

	public void setSceneId(Integer sceneId) 
	{
		this.sceneId = sceneId;
	}

	public Integer getSceneId() 
	{
		return sceneId;
	}
	public void setSceneName(String sceneName) 
	{
		this.sceneName = sceneName;
	}

	public String getSceneName() 
	{
		return sceneName;
	}
	public void setSceneStatus(String sceneStatus) 
	{
		this.sceneStatus = sceneStatus;
	}

	public String getSceneStatus() 
	{
		return sceneStatus;
	}
	public void setSceneParams(String sceneParams) 
	{
		this.sceneParams = sceneParams;
	}

	public String getSceneParams() 
	{
		return sceneParams;
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
            .append("sceneId", getSceneId())
            .append("sceneName", getSceneName())
            .append("sceneStatus", getSceneStatus())
            .append("sceneParams", getSceneParams())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
