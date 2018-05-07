package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.hotel.HotelType;

/**
 * 
 * @项目名称：maven_travel 酒店类型表
 *
 * @author ： YXM
 *
 * @date : 2018年4月21日 下午7:51:20
 */
public interface HotelTypeService {

	//下拉菜单展示类型
	List<HotelType> selectHotelTypeList();

}
