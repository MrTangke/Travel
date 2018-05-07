package com.zoubei.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.hotel.Hotel;
import com.zoubei.entity.hotel.HotelPriceRel;
import com.zoubei.mapper.hotel.HotelMapper;
import com.zoubei.mapper.hotel.HotelPriceRelMapper;
import com.zoubei.service.HotelService;
/**
 * 
 * @项目名称：maven_travel 酒店表service实现类
 *
 * @author ： YXM
 *
 * @date : 2018年4月19日 上午10:25:23
 */
@Service
public class HotelServiceImpl implements HotelService {

	@Autowired(required = false)
	private HotelMapper hotelMapper ;
	
	//酒店类型价格中间表mapper
	@Autowired(required = false)
	private HotelPriceRelMapper hotelPriceRelMapper ;

	/**
	 * 根据景点区域id 查询该区域酒店 排行优先推荐销量高的酒店推荐 order by
	 */
	@Override
	public List<Hotel> selectHotelBySceneAreaId(Integer areaId) {
		// TODO Auto-generated method stub
		return hotelMapper.selectHotelBySceneAreaId(areaId);
	}

	/**
	 * 查询不同城市地区的酒店
	 */
	@Override
	public List<Hotel> selectHotelList(Integer areaId) {
		// TODO Auto-generated method stub
		return hotelMapper.selectHotelList(areaId);
	}

	/**
	 * 添加酒店  上传logo 并添加中间表
	 */
	@Override
	public void insertHotelByHpr(Hotel hotel, HotelPriceRel hotelPriceRel) {
		// TODO Auto-generated method stub
		//先添加酒店表数据  并且返回主键
		hotelMapper.insertHotelByReturnKey(hotel);
		//添加酒店中间表数据
		hotelPriceRel.setHotelId(hotel.getHotelId());
		hotelPriceRel.setStatusId(0);
		hotelPriceRelMapper.insertSelective(hotelPriceRel);
	}

	/**
	 * g根据酒店id查询酒店信息
	 */
	@Override
	public Hotel selectHotelEchoByHotelId(Integer hotelId) {
		// TODO Auto-generated method stub
		return hotelMapper.selectHotelEchoByHotelId(hotelId);
	}

	/**
	 * 动态修改酒店信息
	 */
	@Override
	public void updateHotel(Hotel hotel) {
		// TODO Auto-generated method stub
		hotelMapper.updateByPrimaryKeySelective(hotel);
	}

	/**
	 * 批量删除 酒店 酒店中间表
	 */
	@Override
	public Integer deleteHotelAndHotelPriceRel(Integer[] ids) {
		// TODO Auto-generated method stub
		Integer count = 0;
		try {
			for (Integer hotelId : ids) {
				count += hotelMapper.deleteByPrimaryKey(hotelId);
				hotelPriceRelMapper.deleteHotelPriceRelByhotelId(hotelId);
			}
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return count ;
		}
		
	}

	/**
	 * 普通商家登录查询自己酒店
	 */
	@Override
	public List<Hotel> selectHotelGroupList(Integer hgpId) {
		// TODO Auto-generated method stub
		return hotelMapper.selectHotelGroupList(hgpId);
	}
}
