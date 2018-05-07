package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.tourist.TouristSceneAppraise;

/**
 * 
 * @项目名称：maven_travel 景点评论表
 *
 * @author ： YXM
 *
 * @date : 2018年4月27日 下午10:14:07
 */
public interface SceneAppraiseService {

	//通过游客id获得游客评论
	List<TouristSceneAppraise> selectTouristAppraise(Integer touristId);

	//添加用户评论
	int insertTouristAppraise(TouristSceneAppraise touristSceneAppraise);

	//获得景点评论记录条数通过景点id
	Integer selectSceneAppraiseRecord(Integer sceneId);

}
