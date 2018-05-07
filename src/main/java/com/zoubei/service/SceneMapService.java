package com.zoubei.service;

import com.zoubei.entity.scene.SceneMap;

/**
 * 
 * @项目名称：maven_travel 景点位置坐标 Service
 *
 * @author ： YXM
 *
 * @date : 2018年4月19日 下午3:26:23
 */
public interface SceneMapService {

	//根据景点Id查询景点坐标轴位置 -X -Y
	SceneMap selectSceneMapBySceneId(Integer sceneId);

}
