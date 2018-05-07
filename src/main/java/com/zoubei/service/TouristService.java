package com.zoubei.service;

import java.util.List;

import com.zoubei.entity.cate.Cate;
import com.zoubei.entity.cate.Foods;
import com.zoubei.entity.hotel.Hotel;
import com.zoubei.entity.hotel.HotelPrice;
import com.zoubei.entity.hotel.HotelType;
import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneImg;
import com.zoubei.entity.tourist.Tourist;
import com.zoubei.entity.tourist.TouristHotelRel;
import com.zoubei.entity.tourist.TouristSceneCollecRel;
import com.zoubei.entity.tourist.TouristSceneOrderRel;

/**
 * 
 * @项目名称：maven_travel 游客service
 *
 * @author ： YXM
 *
 * @date : 2018年4月17日 下午2:14:15
 */
public interface TouristService {

	// 游客景点收藏
	String touristSceneCollect(TouristSceneCollecRel tscr);
	// 根据sid查询景点图片集合
	List<SceneImg> selectSceneImgBySid(Integer sceneId);
	// sid查询制定的景点
	Scene selectSceneBySid(Integer sceneId);
	// 查询景点所在区域的酒店信息
	List<Hotel> selectHotelBySid(Integer sceneId);
	// 进行订单的生成   (景点订单及酒店订单)
	String insertOrder(TouristSceneOrderRel tsor, TouristHotelRel thr);
	// 查询市的list
	List<Area> selectAreaShiList();
	//查询酒店的类型
	List<HotelType> selectHotelType();
	//查询酒店的价格集合
	List<HotelPrice> selectPriceList();
	// 根据pid查询区
	List<Area> selectAreaQuList(int parseInt);
	//根据aid查询酒店
	List<Hotel> selectSceneByAreaId(int areaId);
	//预定酒店
	String insertTouristHotelOrder(TouristHotelRel thr);
	//根据id查询城市
	Area selectAreaById(int areaId);

	
	//个人中心修改用户的头像
	Integer updateUplodTouristImg(Tourist tourist);
	//通过登录id获得当前的用户数据
	Tourist selectTouristData(Integer touristId);
	//比对密码是否与原密码相同
	int comparingPwd(String pwd, Integer touristId);
	//个人中心 修改密码
	Integer updateTouristIdPassword(Tourist tourist);
	// 查询所有的美食店铺
	List<Cate> selectCateList();
	// 查询销量高的美食集合
	List<Foods> selectFoodsOrder();
	// 根据店铺ID查询相应的美食
	List<Foods> selectCateFoodByCateId(int cateId);

	



}
