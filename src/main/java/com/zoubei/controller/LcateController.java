package com.zoubei.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zoubei.entity.cate.Cate;
import com.zoubei.entity.cate.CateGroup;
import com.zoubei.entity.cate.Foods;
import com.zoubei.entity.other.Area;
import com.zoubei.service.AreaService;
import com.zoubei.service.CateService;
import com.zoubei.service.FoodsService;
import com.zoubei.utils.FilesUtils;
/**
 * 
 * @项目名称：maven_travel 美食店铺表
 *
 * @author ： YXM
 *
 * @date : 2018年4月22日 下午7:39:43
 */
@Controller
@RequestMapping("/lastercate/")
public class LcateController {
	
	// 美食表
	@Autowired(required = false )
	private CateService cateService ;
	
	//地址
	@Autowired(required = false)
	private AreaService areaService ;
	
	//食物表
	@Autowired(required = false)
	private FoodsService foodsService ;
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 通过城市id获得该地区的美食
	 * @parameter：Integer areaId
	 * @return：String
	 * @date : 2018年4月22日 下午8:02:32
	 */
	@RequestMapping("selectCateList")
	public String selectCateList(Integer areaId , HttpServletRequest request){
		List<Cate> list = cateService.selectCateList(areaId);
		request.setAttribute("list", list);
		return "laster/laster_cate" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去美食店铺添加页面 展示地区
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月22日 下午8:36:39
	 */
	@RequestMapping("toCateInsert")
	public String toCateInsert(HttpServletRequest request){
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listArea", listArea);
		return "laster/laster_cateInsert" ;
	}
	

	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 添加美食店铺 
	 * @parameter：MultipartFile Cate
	 * @return：String
	 * @date : 2018年4月22日 下午8:56:57
	 */
	@RequestMapping("insertCate")
	public String insertCate(Cate cate , MultipartFile imgfile ,HttpServletRequest request){
		String filePath = FilesUtils.FilesUpload_xm(request, imgfile, "/upload/imgc/dianpuLogo");
		cate.setCateLogo(filePath);
		cate.setCateSales(0);
		//获得商家登录对象
		CateGroup cateGroup = (CateGroup) request.getSession().getAttribute("cateGroup");
		if (cateGroup != null) {
			cateService.insertCate(cate,cateGroup.getCgpId());
			Area area = areaService.selectHotelAreaByAreaId(cate.getAreaId());
			String redirectUrl = "lastercate/selectCateByGroup?cgpId="+cateGroup.getCgpId() ;
			request.setAttribute("redirectUrl",redirectUrl);
			return "laster/closeLayer" ;
		}else{
			cateService.insertCate(cate);
			Area area = areaService.selectHotelAreaByAreaId(cate.getAreaId());
			String redirectUrl = "lastercate/selectCateList?areaId="+area.getAreaPid() ;
			request.setAttribute("redirectUrl",redirectUrl);
			return "laster/closeLayer" ;
		}
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 去修改店铺页面
	 * @parameter：cateId
	 * @return：String
	 * @date : 2018年4月22日 下午9:12:47
	 */
	@RequestMapping("toUpdateByCate")
	public String toUpdateByCate(Integer cateId , HttpServletRequest request){
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listArea", listArea);
		request.setAttribute("cateId", cateId);
		return "laster/laster_cateUpdate" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：ajax回显店铺数据
	 * @parameter：TODO
	 * @return：Map<String,Object>
	 * @date : 2018年4月22日 下午9:35:55
	 */
	@ResponseBody
	@RequestMapping("selectCateEchoByHotelId")
	public Map<String, Object> selectCateEchoByHotelId(Integer cateId){
		Cate cate = cateService.selectCateEchoByHotelId(cateId);
		//获得酒店地址
		Area area = areaService.selectHotelAreaByAreaId(cate.getAreaId());
		List<Area> listAreas = areaService.selectAreaListAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cate", cate);
		map.put("area", area);
		map.put("listAreas", listAreas);
		return map ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 修改美食店鋪表
	 * @parameter：Cate cate , MultipartFile imgfile
	 * @return：String
	 * @date : 2018年4月22日 下午10:06:18
	 */
	@RequestMapping("updateCateBy")
	public String updateCateBy(Cate cate , MultipartFile imgfile ,HttpServletRequest request){
		String filename = imgfile.getOriginalFilename();
		if (filename.length() > 0) {
			String filePath = FilesUtils.FilesUpload_xm(request, imgfile, "/upload/imgc/dianpuLogo");
			cate.setCateLogo(filePath);
		}
		cateService.updateCateBy(cate);
		//获得商家登录对象
		CateGroup cateGroup = (CateGroup) request.getSession().getAttribute("cateGroup");
		if (cateGroup != null) {
			String redirectUrl = "lastercate/selectCateByGroup?cgpId="+cateGroup.getCgpId() ;
			request.setAttribute("redirectUrl",redirectUrl);
			return "laster/closeLayer" ;
		}else{
			Area area = areaService.selectHotelAreaByAreaId(cate.getAreaId());
			String redirectUrl = "lastercate/selectCateList?areaId="+area.getAreaPid() ;
			request.setAttribute("redirectUrl",redirectUrl);
			return "laster/closeLayer" ;
		}
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：批量刪除
	 * @parameter：ids
	 * @return：String
	 * @date : 2018年4月22日 下午10:14:10
	 */
	@ResponseBody
	@RequestMapping("deleteCate")
	public int deleteCate(Integer[] ids ){
		Integer count = cateService.deleteCate(ids);
		return  count ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM 
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去展示全部美食列表（超管）
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月23日 上午8:00:14
	 */
	@RequestMapping("selectCateFoodList")
	public String selectCateFoodList(HttpServletRequest request){
		List<Foods> list = foodsService.selectCateFoodsList();
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listArea", listArea);
		request.setAttribute("list", list);
		return "laster/laster_foods" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：二级联动动态获取，不同地区美食列表 动态获取地区和市区美食
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月23日 下午5:28:27
	 */
	@RequestMapping("selectFoodByAreaId")
	public String selectFoodByAreaId(Integer areaPid , Integer areaId , HttpServletRequest request){
		System.out.println("联动查询美食 + = "+areaPid + ","+areaId);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("areaPid", areaPid);
		map.put("areaId", areaId);
		List<Foods> list = foodsService.selectFoodByAreaId(map);
		Area area = areaService.selectFoodByAreaEcho(areaPid , areaId );
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("area", area);
		request.setAttribute("listArea", listArea);
		request.setAttribute("list", list);
		return "laster/laster_foodse" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：查询动态回显的美食地址下拉菜单回显
	 * @parameter：TODO
	 * @return：Map<String,Object>
	 * @date : 2018年4月23日 下午6:43:42
	 */
	@ResponseBody
	@RequestMapping("selectFoodByAreaEcho")
	public Map<String, Object> selectFoodByAreaEcho(Integer areaPid , Integer areaId ){
		Area area = areaService.selectFoodByAreaEcho(areaPid , areaId );
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("area", area);
		return map ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去食物添加页面  获得所有的店铺
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月23日 下午7:46:34
	 */
	@RequestMapping("toFoodInsert")
	public String toFoodInsert(HttpServletRequest request){
		//获得商家登录对象
		CateGroup cateGroup = (CateGroup) request.getSession().getAttribute("cateGroup");
		if (cateGroup != null) {
			//查询商家所有的店铺
			List<Cate> list = cateService.selectCateListAlls(cateGroup.getCgpId());
			request.setAttribute("list",list);
		}else{
			List<Cate> list = cateService.selectCateListAll();
			request.setAttribute("list", list);
		}
		return "laster/laster_foodInsert";
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 添加美食
	 * @parameter：Cate cate , Foods foods
	 * @return：String
	 * @date : 2018年4月23日 下午8:11:33
	 */
	@RequestMapping("insertFood")
	public String insertFood(Cate cate , Foods foods ,HttpServletRequest request){
		foodsService.insertFood(cate,foods);
		//获得商家登录对象
		CateGroup cateGroup = (CateGroup) request.getSession().getAttribute("cateGroup");
		if (cateGroup != null) {
			String redirectUrl = "lastercate/selectFoodByGroup?cgpId="+cateGroup.getCgpId();
			request.setAttribute("redirectUrl", redirectUrl);
			return "laster/closeLayer" ;
		}else{
			//查询去往的地区页面
			Area area = areaService.selectAreaByFoodId(cate.getCateId());
			//也可以通过 传输地址重定向到 查询地区美食页面
			String redirectUrl = "lastercate/selectCateFoodList";
			request.setAttribute("redirectUrl", redirectUrl);
			return "laster/closeLayer" ;
		}
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：通过id查询修改信息  ，并且回显店铺 从中间表
	 * @parameter：foodId
	 * @return：String
	 * @date : 2018年4月23日 下午9:01:32
	 */
	@RequestMapping("toUpdateByFood")
	public String toUpdateByFood(Integer foodId ,HttpServletRequest request){
		//查询回显食物
		Foods food = foodsService.selectFoodByfoodId(foodId);
		//通过食物id获得店铺id
		Cate cate = cateService.selectCateByzhongjian(foodId);
		//店铺列表
		List<Cate> list = cateService.selectCateListAll();
		request.setAttribute("list", list);
		request.setAttribute("food", food);
		request.setAttribute("cate", cate);
		return "laster/laster_foodsUpdate" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：修改美食
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月23日 下午9:32:06
	 */
	@RequestMapping("updateFood")
	public String updateFood(Foods food , HttpServletRequest request){
		foodsService.updateFood(food);
		//获得商家登录对象
		CateGroup cateGroup = (CateGroup) request.getSession().getAttribute("cateGroup");
		if (cateGroup != null) {
			String redirectUrl = "lastercate/selectFoodByGroup?cgpId="+cateGroup.getCgpId();
			request.setAttribute("redirectUrl", redirectUrl);
			return "laster/closeLayer" ;
		}else{
			//也可以通过 传输地址重定向到 查询地区美食页面
			String redirectUrl = "lastercate/selectCateFoodList";
			request.setAttribute("redirectUrl", redirectUrl);
			return "laster/closeLayer" ;
		}
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：删除美食
	 * @parameter：ids
	 * @return：int
	 * @date : 2018年4月23日 下午9:53:10
	 */
	@ResponseBody
	@RequestMapping("deleteFood")
	public int deleteFood(Integer[] ids){
		Integer count = foodsService.deleteFood(ids);
		return count ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：商家登录查询店铺页面
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月23日 下午10:18:23
	 */
	@RequestMapping("selectCateByGroup")
	public String selectCateByGroup(Integer cgpId ,HttpServletRequest request){
		CateGroup cateGroup = (CateGroup) request.getSession().getAttribute("cateGroup");
		if (cateGroup.getCgpId()==cgpId) {
			List<Cate> list = cateService.selectCateByGroup(cgpId);
			request.setAttribute("list", list);
		}else{
			List<Cate> list = cateService.selectCateByGroup(cateGroup.getCgpId());
			request.setAttribute("list", list);
		}
		
		return "laster/laster_cate" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：商家登录查询自己店铺的所有美食
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月24日 下午12:29:45
	 */
	@RequestMapping("selectFoodByGroup")
	public String selectFoodByGroup(Integer cgpId ,HttpServletRequest request){
		List<Foods> list = foodsService.selectFoodByGroup(cgpId);
		//获得所有城市地区 
		List<Area> listArea = areaService.selectAreaList();
		request.setAttribute("listArea", listArea);
		request.setAttribute("list", list);
		return "laster/laster_foods" ;
	}
}
