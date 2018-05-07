package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.hotel.HotelPrice;

/**
 * 
 * @项目名称：maven_travel 酒店价格表
 *
 * @author ： YXM
 *
 * @date : 2018年4月21日 下午7:43:03
 */
public interface HotelPriceService {

	//下拉菜单展示价格添加
	List<HotelPrice> selectHotelPriceList();

}
