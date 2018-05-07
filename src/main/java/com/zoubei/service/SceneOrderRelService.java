package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.tourist.TouristSceneOrderRel;

/**
 * 
 * @项目名称：maven_travel 景点 订单表
 *
 * @author ： YXM
 *
 * @date : 2018年4月24日 下午8:13:41
 */
public interface SceneOrderRelService {

	//获得所有景点的订单   关联景点游客
	List<TouristSceneOrderRel> selectOrderBySceneList();

	//修改消息状态  1是修改已经查看
	int updateSceneByOrderMsg(Integer orderId);

	// 景点商家 -- 登录查询自己的景点关联订单信息 通过商家id
	List<TouristSceneOrderRel> selectOrderByGroupSceneList(Integer sgpId);

}
