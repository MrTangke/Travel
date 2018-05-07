package com.zoubei.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.hotel.HotelPriceRel;
import com.zoubei.mapper.hotel.HotelPriceRelMapper;
import com.zoubei.service.HotelPriceRelService;
/**
 * 
 * @项目名称：maven_travel 酒店类型价格中间表
 *
 * @author ： YXM
 *
 * @date : 2018年4月22日 下午1:16:36
 */
@Service
public class HotelPriceRelServiceImpl implements HotelPriceRelService {

	@Autowired(required = false)
	private HotelPriceRelMapper hotelPriceRelMapper ;

	//通过酒店Id获得价格类型中间表
	@Override
	public HotelPriceRel selectHotelAreaByHotelId(Integer hotelId) {
		// TODO Auto-generated method stub
		return hotelPriceRelMapper.selectHotelAreaByHotelId(hotelId);
	}

	//修改酒店信息价格类型中间表
	@Override
	public void updateHotelPriceRel(HotelPriceRel hotelPriceRel) {
		// TODO Auto-generated method stub
		hotelPriceRelMapper.updateByPrimaryKeySelective(hotelPriceRel);
	}
}
