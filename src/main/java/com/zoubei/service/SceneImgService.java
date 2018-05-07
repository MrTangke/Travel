package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.scene.SceneImg;

/**
 * 
 * @项目名称：maven_travel 景点图片表
 *
 * @author ： YXM
 *
 * @date : 2018年4月18日 上午10:11:22
 */
public interface SceneImgService {
	//根据景点Id 查询景点图片
	List<SceneImg> selectSceneImgBySceneId(Integer sceneId);

}
