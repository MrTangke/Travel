package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.tourist.TouristHotelRel;

/**
 * 
 * @项目名称：maven_travel 酒店订单中间表  关联 游客
 *
 * @author ： YXM
 *
 * @date : 2018年4月25日 上午7:39:45
 */
public interface HotelOrderRelService {

	//酒店订单管理列表展示
	List<TouristHotelRel> selectOrderByHotelList();

	//酒店商家登录查看订单
	List<TouristHotelRel> selectOrderByGroupHotelList(Integer hgpId);

}
