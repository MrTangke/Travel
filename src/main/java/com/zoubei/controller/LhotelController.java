package com.zoubei.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zoubei.entity.hotel.Hotel;
import com.zoubei.entity.hotel.HotelPrice;
import com.zoubei.entity.hotel.HotelPriceRel;
import com.zoubei.entity.hotel.HotelType;
import com.zoubei.entity.other.Area;
import com.zoubei.service.AreaService;
import com.zoubei.service.HotelPriceRelService;
import com.zoubei.service.HotelPriceService;
import com.zoubei.service.HotelService;
import com.zoubei.service.HotelTypeService;
import com.zoubei.utils.FilesUtils;
/**
 * 
 * @项目名称：maven_travel 后台酒店表
 *
 * @author ： YXM
 *
 * @date : 2018年4月21日 下午2:24:31
 */
@RequestMapping("/lasterHotel/")
@Controller
public class LhotelController {
	
	@Autowired(required = false)
	private HotelService hotelService ;

	//地址表
	@Autowired(required = false)
	private AreaService areaService ;
	
	// 酒店价格
	@Autowired(required = false)
	private HotelPriceService hotelPriceService ;
	
	//酒店类型
	@Autowired(required = false)
	private HotelTypeService hotelTypeService ;
	
	//酒店类型价格中间表
	@Autowired(required = false)
	private HotelPriceRelService hotelPriceRelService ;
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：查询不同城市地区的酒店
	 * @parameter：areaId
	 * @return：String
	 * @date : 2018年4月21日 下午4:32:49
	 */
	@RequestMapping("selectHotelList")
	public String selectHotelList(Integer areaId , HttpServletRequest request){
		//查询酒店
		List<Hotel> list = hotelService.selectHotelList(areaId);
		//查询酒店区域
		List<Area> listArea = areaService.selectAreaByHotelId(areaId);
		request.setAttribute("listArea", listArea);
		request.setAttribute("list", list);
		return "laster/laster_hotel" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：添加酒店详情
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月21日 下午6:33:13
	 */
	@RequestMapping("toHotelInsert")
	public String toHotelInsert(HttpServletRequest request){
		//下拉菜单展示价格添加
		List<HotelPrice> listPrice = hotelPriceService.selectHotelPriceList();
		//下拉菜单展示类型
		List<HotelType> listType = hotelTypeService.selectHotelTypeList();
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listPrice",listPrice);
		request.setAttribute("listType",listType);
		request.setAttribute("listArea", listArea);
		return "laster/laster_hotelInsert" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：ajax二级城市联动
	 * @parameter：TODO
	 * @return：List<Area>
	 * @date : 2018年4月21日 下午8:46:34
	 */
	@ResponseBody
	@RequestMapping("toSelectAreaList")
	public List<Area> toSelectAreaList(Integer areaId){
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaListByPid(areaId);
		return listArea ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：添加酒店 和酒店中间表  酒店logo添加
	 * @parameter：MultipartFile - Hotel - HotelPriceRel
	 * @return：String
	 * @date : 2018年4月22日 上午10:31:43
	 */
	@RequestMapping("insertHotelByHpr")
	public String insertHotelByHpr(MultipartFile imgfile , Hotel hotel , HotelPriceRel hotelPriceRel , HttpServletRequest request){
		//获得酒店图片上传路径
		String filesPath = FilesUtils.FilesUpload_xm(request, imgfile, "/upload/imgh/");
		//存入图片上传地址   销量默认为0
		hotel.setHotelLogo(filesPath);
		hotel.setHotelNum(0);
		//执行添加方法
		hotelService.insertHotelByHpr(hotel , hotelPriceRel);
		//通过酒店地址查询酒店地址的  市一级Id返回刷新城市页面
		Area area = areaService.selectHotelAreaByAreaId(hotel.getAreaId());
		//关闭子添加页面 去添加地址页面
		String redirectUrl = "lasterHotel/selectHotelList?areaId="+area.getAreaPid();
		request.setAttribute("redirectUrl", redirectUrl);
		return "laster/closeLayer" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去修改酒店页面  通过ID 查询酒店数据
	 * @parameter：hotelId
	 * @return：String
	 * @date : 2018年4月22日 上午11:47:11
	 */
	@RequestMapping("toUpdateByHotel")
	public String toUpdateByHotel(Integer hotelId , HttpServletRequest request){
		System.out.println(hotelId);
		//下拉菜单展示价格添加
		List<HotelPrice> listPrice = hotelPriceService.selectHotelPriceList();
		//下拉菜单展示类型
		List<HotelType> listType = hotelTypeService.selectHotelTypeList();
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listPrice",listPrice);
		request.setAttribute("listType",listType);
		request.setAttribute("listArea", listArea);
		request.setAttribute("hotelId", hotelId);
		return "laster/laster_hotelUpdate" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：查询酒店回显数据根据酒店ID
	 * @parameter：hotelId 
	 * @return：Map<String,Object>
	 * @date : 2018年4月22日 下午1:08:14
	 */
	@ResponseBody
	@RequestMapping("selectHotelEchoByHotelId")
	public Map<String, Object> selectHotelEchoByHotelId(Integer hotelId){
		//获得酒店对象
		Hotel hotel = hotelService.selectHotelEchoByHotelId(hotelId);
		//获得酒店地址
		Area area = areaService.selectHotelAreaByAreaId(hotel.getAreaId());
		List<Area> listAreas = areaService.selectAreaListAll();
		//通过酒店Id获得价格类型中间表
		HotelPriceRel hotelPriceRel = hotelPriceRelService.selectHotelAreaByHotelId(hotelId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hotel", hotel);
		map.put("area", area);
		map.put("hotelPriceRel", hotelPriceRel);
		map.put("listAreas", listAreas);
		return map ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 修改酒店表数据  和酒店类型价格中见表数据 updateHotelByHotelPriceRel
	 * @parameter：MultipartFile HotelPriceRel Hotel
	 * @return：String
	 * @date : 2018年4月22日 下午4:50:23
	 */
	@RequestMapping("updateHotelByHotelPriceRel")
	public String updateHotelByHotelPriceRel(Hotel hotel , HotelPriceRel hotelPriceRel , MultipartFile imgfile , HttpServletRequest request){
		if (null != imgfile) {
			String filePath = FilesUtils.FilesUpload_xm(request, imgfile, "/upload/imgh/");
			hotel.setHotelLogo(filePath);
		}
		hotelService.updateHotel(hotel);
		hotelPriceRelService.updateHotelPriceRel(hotelPriceRel);
		
		//查找酒店地址通过酒店id
		Hotel hotel2 = hotelService.selectHotelEchoByHotelId(hotel.getHotelId());
		Area area = areaService.selectHotelAreaByAreaId(hotel2.getAreaId());
		//关闭子添加页面 去添加地址页面
		String redirectUrl = "lasterHotel/selectHotelList?areaId="+area.getAreaPid();
		request.setAttribute("redirectUrl", redirectUrl);
		return "laster/closeLayer" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：批量删除 酒店 酒店中间表
	 * @parameter：ids
	 * @return：String
	 * @date : 2018年4月22日 下午6:08:17
	 */
	@ResponseBody
	@RequestMapping("deleteHotelAndHotelPriceRel")
	public int deleteHotelAndHotelPriceRel(Integer[] ids){
		Integer count = hotelService.deleteHotelAndHotelPriceRel(ids);
		return count ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：普通酒店商家查看
	 * @parameter：hgpId
	 * @return：String
	 * @date : 2018年4月22日 下午6:44:37
	 */
	@RequestMapping("selectHotelGroupList")
	public String selectHotelGroupList(Integer hgpId , HttpServletRequest request){
		List<Hotel> list = hotelService.selectHotelGroupList(hgpId);
		List<Area> listArea = new ArrayList<Area>();
		for (Hotel h : list) {
			Area area = areaService.selectAreaByHotelAreaId(h.getAreaId());
			listArea.add(area);
		}
		request.setAttribute("list", list);
		request.setAttribute("listArea",listArea);
		return "laster/laster_hotel" ;
	}
	
}
