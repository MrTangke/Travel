package com.zoubei.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zoubei.entity.other.Area;
import com.zoubei.service.AreaService;

/**
 * 
 * @项目名称：maven_travel  后台地址表controller
 *
 * @author ： YXM
 *
 * @date : 2018年4月20日 下午5:49:29
 */
@Controller
@RequestMapping("/lasterArea/")
public class LareaController {
	
	//注入地址service
	@Autowired(required = false)
	private AreaService areaService ;
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：后台展示地址表
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月20日 下午5:55:21
	 */
	@RequestMapping("toAreaList")
	public String toAreaList(HttpServletRequest request){
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listArea", listArea);
		return "laster/laster_area" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去地区添加页面
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月20日 下午9:49:31
	 */
	@RequestMapping("toInsertArea")
	public String toInsertArea(){
		return "laster/laster_areaInsert" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：地区添加  城市  地区
	 * @parameter：String areaNamef , String areaNamez 
	 * @return：String
	 * @date : 2018年4月20日 下午10:03:37
	 */
	@RequestMapping("InsertAreaInfo")
	public String InsertAreaInfo(String areaNamef , String areaNamez , HttpServletRequest request){
		try {
			areaService.InsertAreaInfo(areaNamef,areaNamez);
			String redirectUrl = "lasterArea/toAreaList" ;
			request.setAttribute("redirectUrl", redirectUrl);
			return "laster/closeLayer" ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error" ;
		}
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去地区添加页面
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月20日 下午9:49:31
	 */
	@RequestMapping("toInsertAreaCit")
	public String toInsertAreaCit(HttpServletRequest request){
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listArea", listArea);
		return "laster/laster_areaInsertCit" ;
	}
	
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：地区添加 地区
	 * @parameter： 
	 * @return：String
	 * @date : 2018年4月20日 下午10:03:37
	 */
	@RequestMapping("insertAreaInfoCit")
	public String insertAreaInfoCit(Integer areaId , String areaNamez , HttpServletRequest request){
		try {
			areaService.InsertAreaInfoCit(areaId,areaNamez);
			String redirectUrl = "lasterArea/toAreaList" ;
			request.setAttribute("redirectUrl", redirectUrl);
			return "laster/closeLayer" ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error" ;
		}
	}
	
	/**
	 * 删除地区
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：删除一条城市 + 地区
	 * @parameter：areaId
	 * @return：int
	 * @date : 2018年4月21日 上午8:47:31
	 */
	@ResponseBody
	@RequestMapping("deleteAreaInfo")
	public int deleteAreaInfo(Integer areaId){
		Integer count = areaService.deleteAreaInfo(areaId);
		return count ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：批量删除地址 +城市
	 * @parameter：Integer[] ids
	 * @return：int
	 * @date : 2018年4月21日 上午9:50:15
	 */
	@ResponseBody
	@RequestMapping("deleteAreaAll")
	public int deleteAreaAll(Integer[] ids){
		Integer count = areaService.deleteAreaAll(ids);
		return count ;
	}
}
