package com.zoubei.service.Impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.tourist.TouristCatelRel;
import com.zoubei.mapper.tourist.TouristCatelRelMapper;
import com.zoubei.service.CateOrderRelService;
/**
 * 
 * @项目名称：maven_travel 美食订单管理 关联游客表
 *
 * @author ： YXM
 *
 * @date : 2018年4月25日 上午11:16:34
 */
@Service
public class CateOrderRelServiceImpl implements CateOrderRelService {
	
	@Autowired(required = false)
	private TouristCatelRelMapper touristCatelRelMapper ;

	//美食订单管理列表展示
	@Override
	public List<TouristCatelRel> selectOrderByFoodList() {
		// TODO Auto-generated method stub
		List<TouristCatelRel> list = touristCatelRelMapper.selectOrderByFoodList();
		for (TouristCatelRel o : list) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(o.getOrderDate());
			o.setOrderDates(format2);
		}
		return list;
	}

	//美食信息确认查看   (修改状态)
	@Override
	public int updateFoodByOrderMsg(Integer orderId) {
		// TODO Auto-generated method stub
		TouristCatelRel cateRel = new TouristCatelRel();
		cateRel.setOrderId(orderId);
		cateRel.setStatusId(1);
		int count = touristCatelRelMapper.updateByPrimaryKeySelective(cateRel);
		return count;
	}

	//美食商家登录  -- 查询订单美食 关联用户
	@Override
	public List<TouristCatelRel> selectOrderByGroupFoodList(Integer cgpId) {
		// TODO Auto-generated method stub
		List<TouristCatelRel> list = touristCatelRelMapper.selectOrderByGroupFoodList(cgpId);
		for (TouristCatelRel o : list) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(o.getOrderDate());
			o.setOrderDates(format2);
		}
		return list;
	}

	
}
