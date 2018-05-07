package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.tourist.TouristCatelEvaluateRel;

/**
 * 
 * @项目名称：maven_travel 美食用户评论表
 *
 * @author ： YXM
 *
 * @date : 2018年4月28日 下午1:22:10
 */
public interface CatelEvaluateService {

	//查询评价表  关联订单 和 食物 和订单 店铺名称 通过用户id查询
	List<TouristCatelEvaluateRel> selectCatelEvaluateByTouristId(
			Integer touristId);

}
