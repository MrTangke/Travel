package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.tourist.TouristCatelRel;

/**
 * 
 * @项目名称：maven_travel 美食订单中间表  关联游客
 *
 * @author ： YXM
 *
 * @date : 2018年4月25日 上午11:12:50
 */
public interface CateOrderRelService {

	//美食订单管理列表展示
	List<TouristCatelRel> selectOrderByFoodList();

	//美食信息确认查看
	int updateFoodByOrderMsg(Integer orderId);

	//美食商家登录  -- 查询订单美食 关联用户
	List<TouristCatelRel> selectOrderByGroupFoodList(Integer cgpId);

}
