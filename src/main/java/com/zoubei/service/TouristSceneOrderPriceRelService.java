package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.tourist.TouristSceneOrderPriceRel;

/**
 * 
 * @项目名称：maven_travel  景点订单 支付 中间表 关键--
 *
 * @author ： YXM
 *
 * @date : 2018年4月26日 下午7:01:36
 */
public interface TouristSceneOrderPriceRelService {

	List<TouristSceneOrderPriceRel> selectTouristSceneOrderPriceRelServiceByTouristId(
			Integer touristId);

	//根据订单id获得支付信息  总价  产品名称 等
	TouristSceneOrderPriceRel selectSceneOrderPayByOrderId(Integer orderId);

	//修改支付订单状态
	void updateTouristPayInfo(TouristSceneOrderPriceRel tsopr);

}
