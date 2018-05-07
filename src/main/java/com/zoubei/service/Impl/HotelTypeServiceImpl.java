package com.zoubei.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.hotel.HotelType;
import com.zoubei.mapper.hotel.HotelTypeMapper;
import com.zoubei.service.HotelTypeService;
/**
 * 
 * @项目名称：maven_travel 酒店类型表
 *
 * @author ： YXM
 *
 * @date : 2018年4月21日 下午7:52:07
 */
@Service
public class HotelTypeServiceImpl implements HotelTypeService {

	@Autowired(required = false)
	private HotelTypeMapper hotelTypeMapper ;

	/**
	 * 下拉菜单展示类型
	 */
	@Override
	public List<HotelType> selectHotelTypeList() {
		// TODO Auto-generated method stub
		return hotelTypeMapper.selectHotelTypeList();
	}
}
