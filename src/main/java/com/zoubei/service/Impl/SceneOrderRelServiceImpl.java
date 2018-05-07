package com.zoubei.service.Impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.tourist.TouristSceneOrderRel;
import com.zoubei.mapper.tourist.TouristSceneOrderRelMapper;
import com.zoubei.service.SceneOrderRelService;
/**
 * 
 * @项目名称：maven_travel 景点订单 游客 关联 景 点 订单
 *
 * @author ： YXM
 *
 * @date : 2018年4月24日 下午8:14:35
 */
@Service
public class SceneOrderRelServiceImpl implements SceneOrderRelService {

	@Autowired(required = false)
	private TouristSceneOrderRelMapper touristSceneOrderRelMapper ;

	//获得所有景点的订单   关联景点游客
	@Override
	public List<TouristSceneOrderRel> selectOrderBySceneList() {
		// TODO Auto-generated method stub
		List<TouristSceneOrderRel> list = touristSceneOrderRelMapper.selectOrderBySceneList();
		for (TouristSceneOrderRel o : list) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(o.getOrderDate());
			o.setOrderDates(format2);
		}
		return list;
	}

	//修改消息状态  1是修改已经查看
	@Override
	public int updateSceneByOrderMsg(Integer orderId) {
		// TODO Auto-generated method stub
		TouristSceneOrderRel sceneOrderRel = new TouristSceneOrderRel();
		sceneOrderRel.setStatusId(1);
		sceneOrderRel.setOrderId(orderId);
		int count = touristSceneOrderRelMapper.updateByPrimaryKeySelective(sceneOrderRel);
		return count;
	}

	/**
	 *  景点商家 -- 登录查询自己的景点关联订单信息 通过商家id
	 */
	@Override
	public List<TouristSceneOrderRel> selectOrderByGroupSceneList(Integer sgpId) {
		// TODO Auto-generated method stub
		List<TouristSceneOrderRel> list = touristSceneOrderRelMapper.selectOrderByGroupSceneList(sgpId);
		for (TouristSceneOrderRel o : list) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format2 = format.format(o.getOrderDate());
			o.setOrderDates(format2);
		}
		return list;
	}
}
