package com.zoubei.service.Impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.tourist.TouristHotelEvaluateRel;
import com.zoubei.mapper.tourist.TouristHotelEvaluateRelMapper;
import com.zoubei.service.TouristHotelEvaluateRelService;
/**
 * 
 * @项目名称：maven_travel 酒店评论表
 *
 * @author ： YXM
 *
 * @date : 2018年4月28日 下午2:27:10
 */
@Service
public class TouristHotelEvaluateRelServiceImpl implements
		TouristHotelEvaluateRelService {

	@Autowired(required = false)
	private TouristHotelEvaluateRelMapper touristHotelEvaluateRelMapper ;

	/**
	 * 通过用户的id查询用户酒店评论
	 */
	@Override
	public List<TouristHotelEvaluateRel> selectHotelEvaluateByTouristId(
			Integer touristId) {
		// TODO Auto-generated method stub
		List<TouristHotelEvaluateRel> ther = touristHotelEvaluateRelMapper.selectHotelEvaluateByTouristId(touristId);
		for (TouristHotelEvaluateRel s : ther) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(s.getAppraiseDate());
			s.setAppraiseDates(format2);
		}
		return ther;
	}
	
	
}
