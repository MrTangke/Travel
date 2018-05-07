package com.zoubei.service;

import com.zoubei.entity.scene.SceneType;

/**
 * 
 * @项目名称：maven_travel  景点类型表
 *
 * @author ： YXM
 *
 * @date : 2018年4月18日 上午9:26:24
 */
public interface SceneTypeService {
	//根据景点类型id 查询景点类型
	SceneType selectSceneTypeBySceneId(Integer typeId);

}
