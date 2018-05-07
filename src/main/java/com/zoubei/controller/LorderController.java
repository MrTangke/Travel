package com.zoubei.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zoubei.entity.tourist.TouristCatelRel;
import com.zoubei.entity.tourist.TouristHotelRel;
import com.zoubei.entity.tourist.TouristSceneOrderRel;
import com.zoubei.service.CateOrderRelService;
import com.zoubei.service.HotelOrderRelService;
import com.zoubei.service.SceneOrderRelService;
/**
 * 
 * @项目名称：maven_travel  订单表  关联景点 和 游客
 *
 * @author ： YXM
 *
 * @date : 2018年4月24日 下午8:10:36
 */
@Controller
@RequestMapping("/lasterOrder/")
public class LorderController {
	
	//景点订单service
	@Autowired(required = false)
	private SceneOrderRelService sceneOrderRelService ;
	
	//酒店订单service
	@Autowired(required = false)
	private HotelOrderRelService hotelOrderRelService ;
	
	//美食订单service
	@Autowired(required = false)
	private CateOrderRelService cateOrderRelService ;
	
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 获得所有景点的订单   关联景点游客
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月24日 下午8:26:57
	 */
	@RequestMapping("selectOrderBySceneList")
	public String selectOrderBySceneList(HttpServletRequest request){
		
		List<TouristSceneOrderRel> listSceneOrder = sceneOrderRelService.selectOrderBySceneList();
		request.setAttribute("listSceneOrder",listSceneOrder);
		return "laster/laster_sceneOrder" ; 
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 修改消息状态  1是修改已经查看
	 * @parameter：TODO
	 * @return：int
	 * @date : 2018年4月24日 下午9:59:53
	 */
	@ResponseBody
	@RequestMapping("updateSceneByOrderMsg")
	public int updateSceneByOrderMsg(Integer orderId){
		int count = sceneOrderRelService.updateSceneByOrderMsg(orderId);
		return count ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：酒店订单管理列表展示
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月25日 上午7:35:33
	 */
	@RequestMapping("selectOrderByHotelList")
	public String selectOrderByHotelList(HttpServletRequest request){
		List<TouristHotelRel> listHotelOrder = hotelOrderRelService.selectOrderByHotelList();
		request.setAttribute("listHotelOrder",listHotelOrder);
		return "laster/laster_hotelOrder" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：美食订单管理列表展示
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月25日 上午11:06:28
	 */
	@RequestMapping("selectOrderByFoodList")
	public String selectOrderByFoodList(HttpServletRequest request){
		
		List<TouristCatelRel> listFoodList = cateOrderRelService.selectOrderByFoodList();
		request.setAttribute("listFoodList", listFoodList);
		return "laster/laster_foodOrder" ;
	}

	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：美食确认查看信息
	 * @parameter：orderId
	 * @return：int
	 * @date : 2018年4月25日 下午12:21:29
	 */
	@ResponseBody
	@RequestMapping("updateFoodByOrderMsg")
	public int  updateFoodByOrderMsg(Integer orderId){
		int count = cateOrderRelService.updateFoodByOrderMsg(orderId);
		return count ;
	}
	
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 景点商家 -- 登录查询自己的景点关联订单信息 通过商家id
	 * @parameter：cgpId
	 * @return：String
	 * @date : 2018年4月25日 下午1:07:51
	 */
	@RequestMapping("selectOrderByGroupSceneList")
	public String selectOrderByGroupSceneList(Integer sgpId , HttpServletRequest request){
		List<TouristSceneOrderRel> listSceneOrder = sceneOrderRelService.selectOrderByGroupSceneList(sgpId);
		request.setAttribute("listSceneOrder",listSceneOrder);
		return "laster/laster_sceneOrder" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：酒店商家登录 -- 订单列表展示
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月25日 下午3:43:15
	 */
	@RequestMapping("selectOrderByGroupHotelList")
	public String selectOrderByGroupHotelList(Integer hgpId ,HttpServletRequest request){
		List<TouristHotelRel> listHotelOrder = hotelOrderRelService.selectOrderByGroupHotelList(hgpId) ;
		request.setAttribute("listHotelOrder",listHotelOrder);
		return "laster/laster_hotelOrder" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：美食商家登录  -- 查询订单美食 关联用户
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月25日 下午4:24:28
	 */
	@RequestMapping("selectOrderByGroupFoodList")
	public String selectOrderByGroupFoodList(Integer cgpId , HttpServletRequest request){
		List<TouristCatelRel> listFoodList = cateOrderRelService.selectOrderByGroupFoodList(cgpId);
		request.setAttribute("listFoodList", listFoodList);
		return "laster/laster_foodOrder" ;
	}
}
