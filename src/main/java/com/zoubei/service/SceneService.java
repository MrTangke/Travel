package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;

/**
 * 
 * @项目名称：maven_travel 景点service
 *
 * @author ： YXM
 *
 * @date : 2018年4月17日 下午2:13:57
 */
public interface SceneService {

	Area selectAreaBySceneAreaId(Integer areaId);

	Scene selectSceneById(Integer sceneId);

	List<Area> selectAreaList();

	List<Scene> selectSceneList();

	//获得景点排序 景点排名
	int selectSceneOrderBy(String sceneId);



}
