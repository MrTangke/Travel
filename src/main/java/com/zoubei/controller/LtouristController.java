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

import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneImg;
import com.zoubei.entity.tourist.Tourist;
import com.zoubei.service.LtouristService;
import com.zoubei.utils.FilesUtils;

@Controller
@RequestMapping("/ltourist/")
public class LtouristController {

	@Autowired
	private LtouristService ltouristService;
	

	/**
	 * 	功能：	后台所有游客的信息
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/26   下午14:58
	 *	作者：	车明磊
	 */
	@RequestMapping("list")
	public String touristList(HttpServletRequest request){
		List<Tourist> listTourist = ltouristService.selectTouristByList();
		request.setAttribute("listTourist", listTourist);
		return "laster/laster_touristList";
	}
	
	
	/**
	 * 	功能：	回显游客的信息
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/26   下午14:59
	 *	作者：	车明磊
	 */
	/*@RequestMapping("toUpdateTourist")
	public String toUpdateTourist(Integer touristId,HttpServletRequest request){
		Tourist tourist = ltouristService.toUpdateTourist(touristId);
		request.setAttribute("tourist", tourist);
		return "laster/laster_touristList";
	}*/
	
	/**
	 * 	功能：	景点图片信息
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/26   下午14:59
	 *	作者：	车明磊
	 */
	@RequestMapping("selectSceneByimg")
	public String selectSceneByimg(HttpServletRequest request){
		List<Tourist> listimg = ltouristService.selectSceneByimg();
		request.setAttribute("listimg", listimg);
		return "laster/laster_touristImg";
	}
	
	/**
	 * 	功能：	增加图片界面
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/26   下午14:59
	 *	作者：	车明磊
	 */
	@RequestMapping("insertSceneByimg")
	public String insertSceneByimg(HttpServletRequest request){
	
		return "laster/laster_touristInginsert";
	}
	
	/**
	 * 	功能：	增加图片
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/26   下午14:59
	 *	作者：	车明磊
	 */
	@RequestMapping("toinsertSceneByimg")
	public String toinsertSceneByimg(HttpServletRequest request,MultipartFile file,SceneImg sceneImg){
		Scene scene = ltouristService.selectSi();
		String filePath = FilesUtils.FilesUpload_xm(request, file, "/upload/toxiang");
		sceneImg.setImgUrl(filePath);
		//ltouristService.insertSi(sceneImg);
		return "laster/closeLayer";
	}
	
	/**
	 * 	功能：	景点购票图形报表界面
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/28   下午13:59
	 *	作者：	车明磊
	 */
	@RequestMapping("touristShou")
	public String touristShou(HttpServletRequest request){
	
		return "laster/laster_touristShou";
	}
	
	/**
	 * 	功能：	景点购票图形报表界面
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/28   下午13:59
	 *	作者：	车明磊
	 */
	@RequestMapping("touristShounum")
	@ResponseBody
	public Map<String,Object> touristShounum(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Scene> listshou = ltouristService.selectShounum();
		map.put("listshou",listshou);
		return map;
	}
}
