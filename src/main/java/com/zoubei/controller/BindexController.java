package com.zoubei.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneImg;
import com.zoubei.entity.tourist.Tourist;
import com.zoubei.entity.tourist.TouristSceneCollecRel;
import com.zoubei.entity.tourist.TouristSceneOrderPriceRel;
import com.zoubei.service.BindexService;
import com.zoubei.service.TouristSceneOrderPriceRelService;
import com.zoubei.utils.FilesUtils;

/**
 * 	首页展示Controller相关操作
 * 	时间：	2018/4/16 上午07:44:04
 *	作者：	车明磊
 */
@Controller
@RequestMapping("/index/")
public class BindexController {
	
	@Autowired
	private BindexService bindexService;
	
	// 查询景点订单中间表  支付
	@Autowired(required = false)
	private TouristSceneOrderPriceRelService touristSceneOrderPriceRelService ;
	
	/**
	 * 	功能：	前往首页
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   上午07:48
	 *	作者：	樊晓飞
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request){
		List<Scene> listScene = bindexService.selectScene();
		for (Scene scene : listScene) {
			List<SceneImg> listSceneImg = new ArrayList<SceneImg>();
			listSceneImg = bindexService.selectSceneImg(scene.getSceneId());
			scene.setListSceneImg(listSceneImg);
		}
		List<Scene> listScenes = new ArrayList<Scene>();
		for (int i=0;i<4;i++) {
			listScenes.add(listScene.get(i));
		}
		request.setAttribute("listScene", listScenes);
		return "before/index";
	} 
	
	/**
	 * 	功能：	推荐行程
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/20   上午07:49
	 *	作者：	樊晓飞
	 */
	@RequestMapping("tuijian")
	public String tuijian(HttpServletRequest request){
		// 查询所有的市   与之相对应的区的集合
		List<Area> listArea = bindexService.selectAreaShiQuList();
		request.setAttribute("listArea", listArea);
		
		//查询旅游的优先景点
		List<Scene> listScene = bindexService.selectScene();
		for (Scene scene : listScene) {
			List<SceneImg> listSceneImg = new ArrayList<SceneImg>();
			listSceneImg = bindexService.selectSceneImg(scene.getSceneId());
			scene.setListSceneImg(listSceneImg);
		}
		List<Scene> listScenes = new ArrayList<Scene>();
		for (int i=0;i<6;i++) {
			listScenes.add(listScene.get(i));
		}
		request.setAttribute("listScene", listScenes);
		return "before/tuijian";
	} 
	
	/**
	 * 	功能：	推荐行程
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/20   上午19:16
	 *	作者：	樊晓飞
	 */
	@ResponseBody
	@RequestMapping("selectSceneByAreaId")
	public List<Scene> selectSceneByAreaId(Scene scene){
		List<Scene> listScene = bindexService.selectSceneByAreaId(scene.getAreaId());
		//String json = JSONObject.toJSONString(listScene);
		return listScene;
	}
	
	
	/**
	 * 	功能：	关于我们
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   上午07:51
	 *	作者：	樊晓飞
	 */
	@RequestMapping("about")
	public String about(){
		return "before/about";
	}
	
	/**
	 * 	功能：	个人中心
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   上午07:51
	 *	作者：	樊晓飞
	 */
	@RequestMapping("mycenter")
	public String mycenter(HttpServletRequest request){
		Tourist tourist = (Tourist) request.getSession().getAttribute("tourist");
		if(tourist != null){
			Tourist tourists = bindexService.selectToutistList(tourist.getTouristId());
			request.setAttribute("tourists", tourists);
			return "before/mycenter";
		}
		return "before/login2";
	}
	
	/**
	 * 	功能：	账户设置
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   上午07:51
	 *	作者：           车明磊
	 */
	@RequestMapping("account")
	public String account(HttpServletRequest request){
		Tourist tourist = (Tourist) request.getSession().getAttribute("tourist");
		Tourist tourists = bindexService.selectToutistList(tourist.getTouristId());
		request.setAttribute("tourists", tourists);
		return "before/account";
	}

	
	/**
	 * 	功能：	修改个人信息
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   上午07:51
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("tomycenter")
	public String tomycenter(HttpServletRequest request,Tourist tourist) throws ParseException{
		
		bindexService.updateTour(tourist);
		return "redirect:/index/mycenter";
	}
	
	/**
	 * 	功能：	修改图片界面
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/20  上午14:51
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("tupain")
	public String tupain(HttpServletRequest request){
		Tourist tourist = (Tourist) request.getSession().getAttribute("tourist");
		Tourist tourists = bindexService.selectToutistList(tourist.getTouristId());
		request.setAttribute("tourists", tourists);
		return "before/tupain";
	}
	/**
	 * 	功能：	修改图片
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/20  上午14:51
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("totupain")
	public String totupain(HttpServletRequest request,MultipartFile file,Tourist tourist){
		String filePath = FilesUtils.FilesUpload_xm(request, file, "/upload/toxiang");
		tourist.setTouristImage(filePath);
		bindexService.updateTuPian(tourist);
		
		return "before/close";
	}
		
	/**
	 * 	功能：	收藏界面
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/21  上午09:51
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("tocollect")
	public String tocollect(HttpServletRequest request){
		Tourist tourist = (Tourist) request.getSession().getAttribute("tourist");
		Tourist tourists = bindexService.selectTouristListById(tourist.getTouristId());
		request.setAttribute("tourists", tourists);
		return "before/collect";
	}
	
	/**
	 * 	功能：	取消收藏
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/23  下午20:22
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("cancel")
	public String cancel(HttpServletRequest request,Integer sceneId){
		Tourist tourist = (Tourist) request.getSession().getAttribute("tourist");
		bindexService.deleteSceneCollect(sceneId);
		return "redirect:/index/tocollect";
	}
	
	/**
	 * 	功能：	评论
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/24  下午14:77
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("comment")
	public String comment(HttpServletRequest request){
		
		return "before/comment";
	}
	
	/**
	 * 	功能：	订单  --前台定单页面  -待支付订单
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/24  下午15:44
	 *	作者：           车明磊
	 *  开发者：     余晓明   2018年4月26日18:31:18
	 * @throws ParseException 
	 */
	@RequestMapping("orderfrom")
	public String orderfrom(HttpServletRequest request){
		HttpSession session = request.getSession();
		Tourist tourist = (Tourist) session.getAttribute("tourist");
		List<TouristSceneOrderPriceRel> listTSOPR = touristSceneOrderPriceRelService.selectTouristSceneOrderPriceRelServiceByTouristId(tourist.getTouristId());
		request.setAttribute("listTSOPR", listTSOPR);
		return "before/orderfrom";
	}
	
	/**
	 * 	功能：	待开发
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/25  下午19:22
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("wait")
	public String wait(HttpServletRequest request){
		
		return "before/wait";
	}
	
	/**
	 * 	功能：	改密
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/25  下午19:43
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("changepw")
	public String changepw(HttpServletRequest request){
		
		return "before/changepw";
	}
	
	/**
	 * 	功能：	头像
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/25  下午19:43
	 *	作者：           车明磊
	 * @throws ParseException 
	 */
	@RequestMapping("photo")
	public String photo(HttpServletRequest request){
		Tourist tourist = (Tourist) request.getSession().getAttribute("tourist");
		Tourist tourists = bindexService.selectToutistList(tourist.getTouristId());
		request.setAttribute("tourists", tourists);
		return "before/photo";
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去订单支付页面 回显订单数据  支付总价格  支付产品名称 支付订单编号uuid
	 * @parameter：orderId
	 * @return：String
	 * @date : 2018年4月26日 下午10:05:01
	 */
	@RequestMapping("toSceneOrderPay")
	public String toSceneOrderPay(Integer orderId , HttpServletRequest request){
		TouristSceneOrderPriceRel tsopr = touristSceneOrderPriceRelService.selectSceneOrderPayByOrderId(orderId);
		request.setAttribute("tsopr", tsopr);
		return "before/befor_sceneorder_pay" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：去用户评论页面
	 * @parameter：orderId
	 * @return：String
	 * @date : 2018年4月28日 下午4:46:31
	 */
	@RequestMapping("touristComment")
	public String touristComment(Integer orderId , HttpServletRequest request){
		request.setAttribute("orderId", orderId);
		return "before/befor_touristcomment";
	}

	
	
}
