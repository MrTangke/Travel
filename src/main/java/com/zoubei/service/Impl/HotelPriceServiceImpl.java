package com.zoubei.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.hotel.HotelPrice;
import com.zoubei.mapper.hotel.HotelPriceMapper;
import com.zoubei.service.HotelPriceService;
/**
 * 
 * @项目名称：maven_travel 酒店价格表 实现类
 *
 * @author ： YXM
 *
 * @date : 2018年4月21日 下午7:43:52
 */
@Service
public class HotelPriceServiceImpl implements HotelPriceService {

	@Autowired(required = false)
	private HotelPriceMapper hotelPriceMapper ;

	/**
	 * 下拉菜单展示价格添加
	 */
	@Override
	public List<HotelPrice> selectHotelPriceList() {
		// TODO Auto-generated method stub
		return hotelPriceMapper.selectHotelPriceList();
	}
}
