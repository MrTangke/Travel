package com.zoubei.service.Impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.zoubei.entity.tourist.TouristSceneOrderPriceRel;
import com.zoubei.entity.tourist.TouristSceneOrderRel;
import com.zoubei.mapper.cate.CateMapper;
import com.zoubei.mapper.cate.FoodsMapper;
import com.zoubei.mapper.hotel.HotelMapper;
import com.zoubei.mapper.hotel.HotelPriceMapper;
import com.zoubei.mapper.hotel.HotelTypeMapper;
import com.zoubei.mapper.other.AreaMapper;
import com.zoubei.mapper.scene.SceneImgMapper;
import com.zoubei.mapper.scene.SceneMapper;
import com.zoubei.mapper.tourist.TouristHotelRelMapper;
import com.zoubei.mapper.tourist.TouristMapper;
import com.zoubei.mapper.tourist.TouristSceneCollecRelMapper;
import com.zoubei.mapper.tourist.TouristSceneOrderPriceRelMapper;
import com.zoubei.mapper.tourist.TouristSceneOrderRelMapper;
import com.zoubei.service.TouristService;
/**
 * 
 * @项目名称：maven_travel 游客ServiceImpl
 *
 * @author ： YXM
 *
 * @date : 2018年4月17日 下午1:27:42
 */
@Service
public class TouristServiceImpl implements TouristService {

	@Autowired(required = false)
	private TouristMapper touristMapper;
	
	@Autowired(required = false)
	private TouristSceneCollecRelMapper touristSceneCollecRelMapper;
	
	@Autowired(required = false)
	private SceneImgMapper sceneImgMapper;
	
	@Autowired(required = false)
	private SceneMapper sceneMapper;
	
	@Autowired(required = false)
	private HotelMapper hotelMapper;
	
	@Autowired(required = false)
	private AreaMapper areaMapper;
	
	@Autowired(required = false)
	private TouristSceneOrderRelMapper touristSceneOrderRelMapper ;
	
	@Autowired(required = false)
	private TouristHotelRelMapper touristHotelRelMapper  ;
	
	@Autowired(required = false)
	private HotelTypeMapper hotelTypeMapper  ;
	
	@Autowired(required = false)
	private HotelPriceMapper hotelPriceMapper  ;
	
	@Autowired(required = false)
	private CateMapper cateMapper  ;
	
	@Autowired(required = false)
	private FoodsMapper foodsMapper  ;
	
	@Autowired(required = false)
	private TouristSceneOrderPriceRelMapper touristSceneOrderPriceRelMapper  ;

	
	
	@Override
	public String touristSceneCollect(TouristSceneCollecRel tscr) {
		String flag = "0";
		try {
			TouristSceneCollecRel another = touristSceneCollecRelMapper.selctRecordByTidSid(tscr);
			if(another == null ){
				touristSceneCollecRelMapper.insertSelective(tscr);
				flag = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 根据sid查询
	@Override
	public List<SceneImg> selectSceneImgBySid(Integer sceneId) {
		return sceneImgMapper.selectSceneImgBySceneId(sceneId);
	}

	//sid查询制定的景点
	@Override
	public Scene selectSceneBySid(Integer sceneId) {
		return sceneMapper.selectByPrimaryKey(sceneId);
	}

	@Override
	public List<Hotel> selectHotelBySid(Integer sceneId) {
		// 查询景点所在区域的酒店list集合
		return hotelMapper.selectHotelBySceneId(sceneId);
	}
	// 进行订单的生成   (景点订单及酒店订单     还有就是订单支付)
	@Override
	public String insertOrder(TouristSceneOrderRel tsor, TouristHotelRel thr) {
		String flag = "0";
		try {
			//景点订单
			int n = touristSceneOrderRelMapper.insertSelective(tsor);
			//景点支付订单
			TouristSceneOrderPriceRel t = new TouristSceneOrderPriceRel();
			t.setOrderId(tsor.getOrderId());
			t.setOrderUuid(UUID.randomUUID().toString());
			t.setOrderStatus(0);
			
			int f = touristSceneOrderPriceRelMapper.insertSelective(t);
			//酒店订单
			int m = touristHotelRelMapper.insertSelective(thr);
			if(n > 0 && m >0 && f >0){
				flag = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 查询市的list
	@Override
	public List<Area> selectAreaShiList() {
		return areaMapper.selectAreaShiQuList(0);
	}

	//查询酒店的类型
	@Override
	public List<HotelType> selectHotelType() {
		return hotelTypeMapper.selectHotelTypeList();
	}

	//查询酒店的价格集合
	@Override
	public List<HotelPrice> selectPriceList() {
		return hotelPriceMapper.selectHotelPriceList();
	}

	// 根据pid查询区
	@Override
	public List<Area> selectAreaQuList(int pid) {
		return areaMapper.selectAreaShiQuList(pid);
	}

	//根据aid查询酒店
	@Override
	public List<Hotel> selectSceneByAreaId(int areaId) {
		return hotelMapper.selectHotelByAreaId(areaId);
	}

	// 预定酒店
	@Override
	public String insertTouristHotelOrder(TouristHotelRel thr) {
		return ""+touristHotelRelMapper.insertSelective(thr);
	}

	//根据id查询城市
	@Override
	public Area selectAreaById(int areaId) {
		return areaMapper.selectByPrimaryKey(areaId);
	}

	//个人中心修改用户的头像
	@Override
	public Integer updateUplodTouristImg(Tourist tourist) {
		// TODO Auto-generated method stub
		return touristMapper.updateByPrimaryKeySelective(tourist);
	}

	////通过登录id获得当前的用户数据
	@Override
	public Tourist selectTouristData(Integer touristId) {
		// TODO Auto-generated method stub
		return touristMapper.selectByPrimaryKey(touristId);
	}

	//比对密码是否与原密码相同
	@Override
	public int comparingPwd(String pwd, Integer touristId) {
		// TODO Auto-generated method stub
		Integer count = 0 ;
		Tourist tourist = touristMapper.selectByPrimaryKey(touristId);
		if (tourist.getTouristPassword().equals(pwd)) {
			count = 1 ;
		}else{
			count = 0 ;
		}
		return count ;
	}

	//个人中心 修改密码
	@Override
	public Integer updateTouristIdPassword(Tourist tourist) {
		// TODO Auto-generated method stub
		return touristMapper.updateByPrimaryKeySelective(tourist);
	}

	// 查询所有的美食店铺
	@Override
	public List<Cate> selectCateList() {
		return cateMapper.selectCateListAll();
	}

	// 查询销量高的美食集合
	@Override
	public List<Foods> selectFoodsOrder() {
		return foodsMapper.selecCateFoodsListOrder();
	}

	//根据店铺ID查询相应的美食
	@Override
	public List<Foods> selectCateFoodByCateId(int cateId) {
		return foodsMapper.selectCateFoodByCateId(cateId);
	}
	
}
