package com.zoubei.service.Impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.tourist.TouristHotelRel;
import com.zoubei.mapper.tourist.TouristHotelRelMapper;
import com.zoubei.service.HotelOrderRelService;
/**
 * 
 * @项目名称：maven_travel 酒店订单管理 关联游客 实现类service
 *
 * @author ： YXM
 *
 * @date : 2018年4月25日 上午7:41:24
 */
@Service
public class HotelOrderRelServiceImpl implements HotelOrderRelService {

	@Autowired(required = false)
	private TouristHotelRelMapper houristHotelRelMapper ;

	//酒店订单管理列表展示
	@Override
	public List<TouristHotelRel> selectOrderByHotelList() {
		// TODO Auto-generated method stub
		List<TouristHotelRel> list = houristHotelRelMapper.selectOrderByHotelList();
		//处理时间
		for (TouristHotelRel o : list) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(o.getThrDate());
			o.setThrDates(format2);
		}
		return list;
	}

	//酒店商家登录查看订单
	@Override
	public List<TouristHotelRel> selectOrderByGroupHotelList(Integer hgpId) {
		// TODO Auto-generated method stub
		List<TouristHotelRel> list = houristHotelRelMapper.selectOrderByGroupHotelList(hgpId);
		//处理时间
		for (TouristHotelRel o : list) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(o.getThrDate());
			o.setThrDates(format2);
		}
		return list;
	}

}
