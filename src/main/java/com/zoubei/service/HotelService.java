package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.hotel.Hotel;
import com.zoubei.entity.hotel.HotelPriceRel;

/**
 * 
 * @项目名称：maven_travel 酒店表service
 *
 * @author ： YXM
 *
 * @date : 2018年4月19日 上午10:24:07
 */
public interface HotelService {

	//根据景点区域id 查询该区域酒店 排行优先推荐销量高的酒店推荐 order by
	List<Hotel> selectHotelBySceneAreaId(Integer areaId);

	List<Hotel> selectHotelList(Integer areaId);

	//添加酒店  上传logo 并添加中间表
	void insertHotelByHpr(Hotel hotel, HotelPriceRel hotelPriceRel);

	Hotel selectHotelEchoByHotelId(Integer hotelId);

	void updateHotel(Hotel hotel);

	Integer deleteHotelAndHotelPriceRel(Integer[] ids);

	List<Hotel> selectHotelGroupList(Integer hgpId);

}
