package com.zoubei.service;

import com.zoubei.entity.hotel.HotelPriceRel;

/**
 * 
 * @项目名称：maven_travel 酒店类型价格中间表
 *
 * @author ： YXM
 *
 * @date : 2018年4月22日 下午1:15:39
 */
public interface HotelPriceRelService {

	//通过酒店Id获得价格类型中间表
	HotelPriceRel selectHotelAreaByHotelId(Integer hotelId);

	//修改酒店信息价格类型中间表
	void updateHotelPriceRel(HotelPriceRel hotelPriceRel);

}
