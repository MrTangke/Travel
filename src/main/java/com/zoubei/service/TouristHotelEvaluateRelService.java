package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.tourist.TouristHotelEvaluateRel;

/**
 * 
 * @项目名称：maven_travel 酒店评论表
 *
 * @author ： YXM
 *
 * @date : 2018年4月28日 下午2:26:06
 */
public interface TouristHotelEvaluateRelService {

	//通过用户的id查询用户酒店评论
	List<TouristHotelEvaluateRel> selectHotelEvaluateByTouristId(
			Integer touristId);

}
