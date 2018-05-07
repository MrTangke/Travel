package com.zoubei.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
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
import com.zoubei.service.TouristService;

/**
 * 	Controller相关操作
 * 	时间：	2018/4/15 上午11:01:04
 *	作者：	樊晓飞
 */
@Controller
@RequestMapping("/other/")
public class BotherController {
	
	// service 对象
	@Autowired(required = false)
	private TouristService touristService;
	

	/**
	 * 	功能：	进行后台上传操作(至服务器)
	 * 	参数：	MutipartFile
	 *	结果：	return string; 路径
	 *	时间：	2018/4/16   上午099:06
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toUploadImageFile")
	public String toUploadImageFile(){
		
		return "";
	}
	
	/**
	 * 	功能：	进行后台上传操作(至服务器)
	 * 	参数：	MutipartFile
	 *	结果：	return string; 路径
	 *	时间：	2018/4/16   上午099:06
	 *	作者：	樊晓飞
	 */
	@RequestMapping("uploadImageFile")
	public String uploadImageFile(MultipartFile image){
		
		return "";
	}
	
	/**
	 * 	功能：	游客景点收藏
	 *	结果：	return string;   1 表示收藏成功
	 *	时间：	2018/4/21   上午09:49
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("touristSceneCollect")
	public String touristSceneCollect(HttpServletRequest request, TouristSceneCollecRel tscr){
		Tourist tourist = (Tourist)request.getSession().getAttribute("tourist");
		tscr.setTouristId(tourist.getTouristId());
		String str = touristService.touristSceneCollect(tscr);
		return str;
	}
	
	/**
	 * 	功能：	跳转定制页面
	 *	结果：	return string;  
	 *	时间：	2018/4/21   上午10:28
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toDingzhi")
	public String toDingzhi(HttpServletRequest request, Scene scene){
		//sid查询制定的景点
		Scene sceneBysid = touristService.selectSceneBySid(scene.getSceneId());
		request.setAttribute("sceneBysid", sceneBysid);
		//根据sid查询景点的图片集合
		List<SceneImg> listSceneImg = touristService.selectSceneImgBySid(scene.getSceneId());
		request.setAttribute("listSceneImg", listSceneImg);
		// 查询景点所在区域的酒店信息
		List<Hotel> listHotel = touristService.selectHotelBySid(scene.getSceneId());
		request.setAttribute("listHotel", listHotel);
		return "before/dingzhi";
	}
	/**
	 * 	功能：	进行订单的生成   (景点订单及酒店订单)
	 *	结果：	return string;  
	 *	时间：	2018/4/21   上午10:28
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("insertOrder")
	public String insertOrder(HttpServletRequest request, String orderdays, String goTime, String ticket, TouristSceneOrderRel tsor, TouristHotelRel thr){
		try {
			if(!"".equals(goTime) || goTime!=null){
				Date godate = new SimpleDateFormat("yyyy-MM-dd").parse(goTime);
				tsor.setOrderDate(godate);					//设置前往时间
				thr.setThrDate(godate);
			}
			if(!"".equals(tsor.getOrderGoaddress())){		//设置酒店的前往目的地
				thr.setThrGoaddress(tsor.getOrderGoaddress());
			}
			if(!"".equals(orderdays) || orderdays!=null){
				String orderOther = tsor.getOrderOther();
				tsor.setOrderOther("行程天数："+orderdays+"，行程要求："+orderOther+"。");
			}
			tsor.setStatusId(1);
			
			String str = touristService.insertOrder(tsor, thr);
			return str;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "0";
	}
	
	/**
	 * 	功能：	跳转至酒店页面
	 *	结果：	return string;  
	 *	时间：	2018/4/21   上午10:28
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toHotel")
	public String toHotel(HttpServletRequest request){
		// 查询市的list
		List<Area> listArea = touristService.selectAreaShiList();
		request.setAttribute("listArea", listArea);
		//查询酒店的类型
		List<HotelType> listType = touristService.selectHotelType();
		request.setAttribute("listType", listType);
		//查询酒店的价格集合
		List<HotelPrice> listPrice = touristService.selectPriceList();
		request.setAttribute("listPrice", listPrice);
		
		return "before/hotel";
	}
	
	/**
	 * 	功能：	根据pid查询区
	 *	结果：	return string;   1 表示收藏成功
	 *	时间：	2018/4/25   上午16:09
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("selectAreaByPid")
	public List<Area> selectAreaByPid(HttpServletRequest request, String pid){
		List<Area> listArea = touristService.selectAreaQuList(Integer.parseInt(pid.trim()));
		return listArea;
	}
	
	/**
	 * 	功能：	根据aid查询酒店
	 *	结果：	return string;
	 *	时间：	2018/4/25   上午16:09
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("selecthotelByAreaid")
	public List<Hotel> selecthotelByAreaid(HttpServletRequest request, String areaId){
		List<Hotel> listHotel = touristService.selectSceneByAreaId(Integer.parseInt(areaId.trim()));
		return listHotel;
	}

	
	/**
	 * 	功能：	预定酒店
	 *	结果：	return string; 
	 *	时间：	2018/4/25   上午16:40
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("insertTouristHotelOrder")
	public String insertTouristHotelOrder(HttpServletRequest request, TouristHotelRel thr, String areapid, String thrDateStr){
		//转换时间
		if(!"".equals(thrDateStr) || thrDateStr!=null){
			try {
				Date parse = new SimpleDateFormat("yyyy-MM-dd").parse(thrDateStr);
				thr.setThrDate(parse);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		//查询城市
		if(areapid!=null || !"".equals(areapid)){
			Area area = touristService.selectAreaById(Integer.parseInt(areapid.trim()));
			thr.setThrGoaddress(area.getAreaName());
		}
		String str = touristService.insertTouristHotelOrder(thr);
		return str;
	}
	
	/**
	 * 	功能：	跳转至美食
	 *	结果：	return string;  
	 *	时间：	2018/4/26   上午10:28
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toCate")
	public String toCate(HttpServletRequest request){
		// 查询所有的美食店铺
		List<Cate> listCates = touristService.selectCateList();
		request.setAttribute("listCates", listCates);
		// 查询销量高的美食集合
		List<Foods> listFoods = touristService.selectFoodsOrder();
		request.setAttribute("listFoods", listFoods);
		
		return "before/cate";
	}
	
	/**
	 * 	功能：	根据店铺ID查询相应的美食
	 *	结果：	return string;  
	 *	时间：	2018/4/26   20:28
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("toCateFoodsByCid")
	public List<Foods> toCateFoodsByCid(String cateId){
		List<Foods> listFood = touristService.selectCateFoodByCateId(Integer.parseInt(cateId.trim()));
		return listFood;
	}
	
	
	
	
	
	
	
	
}
