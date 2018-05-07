package com.zoubei.service.Impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.tourist.TouristCatelEvaluateRel;
import com.zoubei.mapper.tourist.TouristCatelEvaluateRelMapper;
import com.zoubei.service.CatelEvaluateService;
/**
 * 
 * @项目名称：maven_travel 美食游客评论表
 *
 * @author ： YXM
 *
 * @date : 2018年4月28日 下午1:23:15
 */
@Service
public class CatelEvaluateServiceImpl implements CatelEvaluateService {

	@Autowired(required = false)
	private TouristCatelEvaluateRelMapper touristCatelEvaluateRelMapper ;

	//查询评价表  关联订单 和 食物 和订单 店铺名称 通过用户id查询
	@Override
	public List<TouristCatelEvaluateRel> selectCatelEvaluateByTouristId(
			Integer touristId) {
		// TODO Auto-generated method stub
		List<TouristCatelEvaluateRel> list = touristCatelEvaluateRelMapper.selectCatelEvaluateByTouristId(touristId);
		for (TouristCatelEvaluateRel t : list) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(t.getAppraiseDate());
			t.setAppraiseDates(format2);
		}
		return list;
	}
}
