package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneImg;
import com.zoubei.entity.tourist.Tourist;
import com.zoubei.entity.tourist.TouristSceneCollecRel;

/**
 * 
 * @项目名称：maven_travel 景点图片
 *
 * @author ： 车明磊
 *
 * @date : 2018年4月18日 
 *
 */
public interface BindexService {

	List<Scene> selectScene();

	List<SceneImg> selectSceneImg(Integer sceneId);

	Tourist selectToutistList(Integer touristId);

	//查询所有的市及对应的区
	List<Area> selectAreaShiQuList();

	// 查询该区下面对应的景点
	List<Scene> selectSceneByAreaId(Integer areaId);

	void updateTour(Tourist tourist);

	void updateTuPian(Tourist tourist);
	//按id查询景点
	Tourist selectTouristListById(Integer touristId);
	//按id删除收藏表
	void deleteSceneCollect(Integer sceneId);

	

}
