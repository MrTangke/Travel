package com.zoubei.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoubei.entity.scene.SceneImg;
import com.zoubei.entity.tourist.TouristSceneOrderPriceRel;
import com.zoubei.mapper.scene.SceneImgMapper;
import com.zoubei.mapper.tourist.TouristSceneOrderPriceRelMapper;
import com.zoubei.service.TouristSceneOrderPriceRelService;
/**
 * 
 * @项目名称：maven_travel  景点订单 支付 中间表
 *
 * @author ： YXM
 *
 * @date : 2018年4月26日 下午7:06:50
 */
@Service
public class TouristSceneOrderPriceRelServiceImpl implements
		TouristSceneOrderPriceRelService {
	
	// 注入景点订单 支付中间表
	@Autowired(required = false)
	private TouristSceneOrderPriceRelMapper TsoprMapper ;
	
	//注入景点图片表
	@Autowired(required = false)
	private SceneImgMapper SceneImgMapper ;
	
	//订单  --前台定单页面  -待支付订单
	@Override
	public List<TouristSceneOrderPriceRel> selectTouristSceneOrderPriceRelServiceByTouristId(
			Integer touristId) {
		// TODO Auto-generated method stub
		//获得待支付订单查询到的数据集合
		List<TouristSceneOrderPriceRel> listTsopr = TsoprMapper.selectTsoprByTouristId(touristId);
		//循环获得每个景点的图片路径放到订单集合中
		for (TouristSceneOrderPriceRel tsopr : listTsopr) {
			//初始化接受价格单位
			double count = 0 ;
			//计算景点单价 * 订单的数量
			count = tsopr.getScenePrice()*tsopr.getOrderNum() ;
			//根据景点id获得景点的图片url
			SceneImg sceneImg = SceneImgMapper.selectSceneImgByTsoprSceneId(tsopr.getSceneId());
			//存放数据 图片 和 订单总价
			tsopr.setImgUrl(sceneImg.getImgUrl());
			tsopr.setOrderCount(count);
		}
		return listTsopr;
	}

	//根据订单id获得支付信息  总价  产品名称 等
	@Override
	public TouristSceneOrderPriceRel selectSceneOrderPayByOrderId(
			Integer orderId) {
		// TODO Auto-generated method stub
		TouristSceneOrderPriceRel tsopr = TsoprMapper.selectSceneOrderPayByOrderId(orderId);
		double count = 0 ;
		count = tsopr.getScenePrice() * tsopr.getOrderNum() ; 
		tsopr.setOrderCount(count);
		return tsopr;
	}

	//修改支付订单状态
	@Override
	public void updateTouristPayInfo(TouristSceneOrderPriceRel tsopr) {
		// TODO Auto-generated method stub
		TsoprMapper.updateTouristPayInfo(tsopr);
	}

}
