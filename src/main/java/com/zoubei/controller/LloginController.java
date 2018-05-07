package com.zoubei.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneGroup;
import com.zoubei.entity.scene.SceneType;
import com.zoubei.service.AreaService;
import com.zoubei.service.LgroupService;

/**
 * 	后台登录Controller相关操作
 * 	时间：	2018/4/15 上午11:01:04
 *	作者：	樊晓飞
 */
@Controller
@RequestMapping("/lastlogin/")
public class LloginController {
	
	
	@Autowired(required = false)
	private LgroupService lgroupService;
	
	//地址表
	@Autowired(required = false)
	private AreaService areaService ;

	/**
	 * 	功能：	前往后台登录
	 *	结果：	return string;
	 *	时间：	2018/4/17   上午08:45
	 *	作者：	樊晓飞
	 *	http://localhost:8080/maven_travel/lastlogin/toLogin
	 */
	@RequestMapping("toLogin")
	public String toLogin(){
		return "laster/laster_login" ;
	}
	
	/**
	 * 	功能：	进行后台登录
	 *	结果：	return string;	登录成功返回1  否则为2
	 *	时间：	2018/4/17   上午09：:2
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("login")
	public String login(HttpServletRequest request, String nickname, String password, String statusId){
		System.out.println(nickname+"---"+password+"---"+statusId);
		HashMap<String, Object> map = new HashMap<>();
		map.put("nickname", nickname);
		map.put("password", password);
		map.put("statusId", statusId);
		
		String str = lgroupService.selectGroupByNnameSid(request, map);
		return str ;
	}
	
	/**
	 * 	功能：	后台登录成功，返回  超管后台首页lastIndex页面
	 *	结果：	return string;
	 *	时间：	2018/4/17   上午09：:2
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toSmLastIndex")
	public String toSmLastIndex(HttpServletRequest request){
		//查询景点的管理商家
		List<SceneGroup> listSceneGroup = lgroupService.selectSceneGroupList();
		request.setAttribute("listSceneGroup", listSceneGroup);
		//去展示酒店菜单
		List<Area> list = areaService.selectAreaListBySupperAll();
		request.setAttribute("list", list);
		request.setAttribute("hotelInfo","酒店产品管理" );
		request.setAttribute("cateInfo","美食产品管理" );
		
		return "laster/laster_index_sm";
	}
	
	/**
	 * 	功能：	后台登录成功，返回  商家管理后台首页lastIndex页面
	 *	结果：	return string;
	 *	时间：	2018/4/17   上午09：:2
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toLastIndex")
	public String toLastIndex(HttpServletRequest request){
		return "laster/laster_index";
	}
	
	/**
	 * 	功能：	注销登录，退出该页，返回登录页面
	 *	结果：	return string;
	 *	时间：	2018/4/18   上午09：:20
	 *	作者：	樊晓飞
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		// 注销掉session中的信息
		request.getSession().invalidate();
		return "redirect:/lastlogin/toLogin";
	}
	
	/**
	 * 	功能：	进入后台欢迎页面
	 *	结果：	return string;
	 *	时间：	2018/4/19   上午09：:50
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toHome")
	public String toHome(HttpServletRequest request){
		return "laster/laster_home";
	}
	
	/**
	 * 	功能：	敬请期待
	 *	结果：	return string;
	 *	时间：	2018/4/19   上午09：:56
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toExpect")
	public String toExpect(HttpServletRequest request){
		return "laster/laster_expect";
	}
	
	/**
	 * 	功能：	跳转至制定商家管理的景点列表管理页面
	 *	结果：	return string;
	 *	时间：	2018/4/19   上午09：:56
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toSceneBySceneId")
	public String toSceneBySceneId(HttpServletRequest request, String sgpId){
		Integer id = Integer.parseInt(sgpId.trim());
		// 查询制定的商家对应的数据
		SceneGroup sceneGroup = lgroupService.selectSceneGroupBySid(id);
		// 查询商家管理的地区的景点列表
		List<Scene> listSceneByGid = lgroupService.selectSceneByGid(sceneGroup.getAreaId());
		
		request.setAttribute("sceneGroup", sceneGroup);
		request.setAttribute("listSceneByGid", listSceneByGid);
		
		return "laster/laster_scenebyid";
	}
	
	/**
	 * 	功能：	根据指定城市id   sgpId  去往添加相应的景点的页面
	 *	结果：	return string;
	 *	时间：	2018/4/19   上午09：:56
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toSceneAddBySgpid")
	public String toSceneAddBySgpid(HttpServletRequest request, String id){
		request.setAttribute("sgpId", id);
		Integer sgpid = Integer.parseInt(id.trim());
		//根据管理员的id查询相应的管理区域，得到区域的list对象
		List<Area> listArea = lgroupService.selectAreaListBySgpId(sgpid);
		request.setAttribute("listArea", listArea);
		//查询出所有的景点类型list集合
		List<SceneType> listSceneType = lgroupService.selectSceneType();
		request.setAttribute("listSceneType", listSceneType);
		return "laster/laster_sceneAdd";
	}
	
	/**
	 * 	功能：	根据指定城市id   sgpId  进行添加相应的景点
	 *	结果：	return string;    1表示添加成功
	 *	时间：	2018/4/19   上午09：:56
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("sceneAddBySgpid")
	public String sceneAddBySgpid(HttpServletRequest request, Scene scene, String sgpId){
		// 后台进行添加数据库
		String str = lgroupService.insertSceneBySgpid(scene);
		return str ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人： 余晓明 
	 * @修改时间：修改樊小飞 前台景点添加 后台子页面关闭 刷新父页面处理  方法： tocloseLayer --sceneAddBySgpid 
	 * @业务内容 ： 城市根据ID添加景点 返回JSON处理关闭子页面 刷新父页面 并传递参数
	 * @parameter：Integer sgpId
	 * @return：String
	 * @date : 2018年4月20日 上午8:41:13
	 */
	@RequestMapping("tocloseLayer")
	public String tocloseLayer(Integer sgpId,HttpServletRequest request){
		String redirectUrl = "lastlogin/toSceneBySceneId?sgpId="+sgpId ;
		request.setAttribute("redirectUrl", redirectUrl);
		return "laster/closeLayer" ;
	}
	
	/**
	 * 	功能：	根据选择的ids进行导出相应的数据
	 *	结果：	return string;    1表示添加成功
	 *	时间：	2018/4/27   16:03
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("exportExcel")
	public String exportExcel(HttpServletRequest request, HttpServletResponse response, String ids){
		String str = lgroupService.exportExcel(request, response, ids);
		return str ;
	}
	
	/**
	 * 	功能：	导入scene表格文件
	 *	时间：	2018/4/27   22:22
	 *	作者：	樊晓飞
	 */
	@RequestMapping("toSceneImportExcel")
	public String toSceneImportExcel(HttpServletRequest request, String id){
		request.setAttribute("areaId", id);
		return "laster/laster_sceneImport" ;
	}
	
	/**
	 * 	功能：	导入excel
	 *	结果：	return string;    1表示添加成功
	 *	时间：	2018/4/27   16:03
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("SceneImportExcel")
	public String SceneImportExcel(HttpServletRequest request, MultipartFile excelfile){
		String str = lgroupService.SceneImportExcel(request, excelfile);
		return str ;
	}
	
	
	
	/**
	 * 	功能：	下载excel导入模板
	 *	时间：	2018/4/28   14:23
	 *	作者：	樊晓飞
	 */
	@RequestMapping("downloadexcel")
	public void downloadexcel(HttpServletRequest request, HttpServletResponse response){
		try {
			//获取要下载的文件名
			String fileExcel = "/upload/excel/景点导入模板.xls";
			// 设置响应	应用程序强制下载
			response.setContentType("application/force-download");
			// 读取文件
			String fileDownloadExcel = request.getRealPath(fileExcel);
			
			//String fileDownloadExcel = request.getContextPath()+fileExcel;
			
			FileInputStream in = new FileInputStream(fileDownloadExcel);

			// 设置响应头   对文件进行url编码
			URLEncoder.encode(fileExcel, "utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="+new String("景点导入模板".getBytes(), "ISO8859-1") + ".xls");
			response.setContentLength(in.available());
			
			// 开始COPY
			ServletOutputStream out = response.getOutputStream();
			byte[] b = new byte[1024];
		    int len = 0;
		    while((len = in.read(b))!=-1){
		      out.write(b, 0, len);
		    }
		    out.flush();
		    out.close();
		    in.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
}
