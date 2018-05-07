package com.zoubei.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zoubei.entity.cate.Cate;
import com.zoubei.entity.hotel.Hotel;
import com.zoubei.entity.other.Area;
import com.zoubei.entity.scene.Scene;
import com.zoubei.entity.scene.SceneImg;
import com.zoubei.entity.scene.SceneMap;
import com.zoubei.entity.scene.SceneType;
import com.zoubei.entity.tourist.Tourist;
import com.zoubei.entity.tourist.TouristCatelEvaluateRel;
import com.zoubei.entity.tourist.TouristHotelEvaluateRel;
import com.zoubei.entity.tourist.TouristSceneAppraise;
import com.zoubei.entity.tourist.TouristSceneOrderPriceRel;
import com.zoubei.service.AreaService;
import com.zoubei.service.CateService;
import com.zoubei.service.CatelEvaluateService;
import com.zoubei.service.HotelService;
import com.zoubei.service.SceneAppraiseService;
import com.zoubei.service.SceneImgService;
import com.zoubei.service.SceneMapService;
import com.zoubei.service.SceneService;
import com.zoubei.service.SceneTypeService;
import com.zoubei.service.TouristHotelEvaluateRelService;
import com.zoubei.service.TouristSceneOrderPriceRelService;
import com.zoubei.service.TouristService;
import com.zoubei.utils.FilesUtils;
import com.zoubei.utils.PaymentUtil;

/**
 * 	游客Controller相关操作
 * 	时间：	2018/4/15 上午11:01:04
 *	作者：	余晓明
 */
@Controller
@RequestMapping("/tourist/")
public class BtouristController {

	//游客service
	@Autowired(required = false)
	private TouristService touristService;
	
	//景点service
	@Autowired(required = false)
	private SceneService sceneService ;
	
	//地区service
	@Autowired(required = false)
	private AreaService areaService ;
	
	//景点类型service
	@Autowired(required = false)
	private SceneTypeService sceneTypeService ; 
	
	//景点图片service
	@Autowired(required = false)
	private SceneImgService sceneImgService ; 
	
	//美食商家店铺service
	@Autowired(required = false)
	private CateService cateService ;
	
	//酒店表 service
	@Autowired(required = false)
	private HotelService hotelService ;
	
	//景点位置坐标 Service
	@Autowired(required = false)
	private SceneMapService sceneMapService ;
	
	// 查询景点订单中间表  游客支付 
	@Autowired(required = false)
	private TouristSceneOrderPriceRelService touristSceneOrderPriceRelService ;
	
	// 景点游客评价表
	@Autowired(required = false)
	private SceneAppraiseService sceneAppraiseService ;
	
	//美食游客评论表
	@Autowired(required = false)
	private CatelEvaluateService catelEvaluateService ;
	
	//酒店游客评论
	@Autowired(required = false)
	private TouristHotelEvaluateRelService touristHotelEvaluateRelService;
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：实现首页点击某一个景点，景点页面详情展示
	 * @parameter：Integer HttpServletRequest
	 * @return：String 页面
	 * @date : 2018年4月17日 下午1:32:44
	 */
	@RequestMapping("particulars")
	public String toParticulars(String sceneId , HttpServletRequest request){
		
		//假定参数
		//sceneId = 1 ;
		//查询所有景点
		List<Scene> listScene = sceneService.selectSceneList();
		//根据id查询景点详情 
		Scene scene = sceneService.selectSceneById(Integer.parseInt(sceneId));
		//根据景点地址id 查询景点所在地区
		Area area = sceneService.selectAreaBySceneAreaId(scene.getAreaId());
		//查询地址所有地址的集合
		List<Area> listArea =sceneService.selectAreaList();
		//根据景点id 查询景点的 市一级地址
		Area area2 = areaService.selectAreaBySceneId(scene.getSceneId());
		//根据景点类型id 查询景点类型
		SceneType sceneType = sceneTypeService.selectSceneTypeBySceneId(scene.getTypeId());
		//根据景点Id 查询景点图片
		List<SceneImg> listImg = sceneImgService.selectSceneImgBySceneId(scene.getSceneId());
		//根据景点区域id 查询该区域美食商家 排行优先推荐销量高的美食商家 order by
		List<Cate> listCate = cateService.selectCateBySceneAreaId(scene.getAreaId());
		//根据景点区域id 查询该区域酒店 排行优先推荐销量高的酒店推荐 order by
		List<Hotel> listHotel = hotelService.selectHotelBySceneAreaId(scene.getAreaId());
		//根据景点Id查询景点坐标轴位置 -X -Y
		SceneMap sceneMap = sceneMapService.selectSceneMapBySceneId(scene.getSceneId());
		//获得景点排序 景点排名
		int count = sceneService.selectSceneOrderBy(sceneId);
		//获得景点评论记录条数通过景点id
		int record = sceneAppraiseService.selectSceneAppraiseRecord(scene.getSceneId());
		
		//返回前台数据
		request.setAttribute("listScene", listScene);
		request.setAttribute("scene", scene);
		request.setAttribute("area", area);
		request.setAttribute("listArea", listArea);
		request.setAttribute("area2", area2);
		request.setAttribute("sceneType", sceneType);
		request.setAttribute("listImg", listImg);
		request.setAttribute("listCate", listCate);
		request.setAttribute("listHotel", listHotel);
		request.setAttribute("sceneMap", sceneMap);
		request.setAttribute("count", count);
		request.setAttribute("record", record);
		
		return "before/before_particulars" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 个人中心修改用户的头像
	 * @parameter：imgfile  touristId
	 * @return：int
	 * @date : 2018年4月26日 下午12:52:40
	 */
	@ResponseBody
	@RequestMapping("updateUplodTouristImg")
	public int updateUplodTouristImg(MultipartFile imgfile , Integer touristId , HttpServletRequest request){
		System.out.println("文件图片="+imgfile+"  --  "+"用户id = "+ touristId);
		//获得头像上传的路径
		String filePath = FilesUtils.FilesUpload_xm(request, imgfile, "/upload/toxiang");
		Tourist tourist1 = new Tourist();
		tourist1.setTouristId(touristId);
		tourist1.setTouristImage(filePath);
		Integer count = touristService.updateUplodTouristImg(tourist1);
		//清理session
		HttpSession session = request.getSession();
		session.removeAttribute("tourist");
		Tourist tourist = touristService.selectTouristData(touristId);
		session.setAttribute("tourist", tourist);
		return  count ;
	}
	

	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：更换密码核对旧密码是否 - 与 - 原密码相同
	 * @parameter：TODO
	 * @return：int
	 * @date : 2018年4月26日 下午2:25:30
	 */
	@ResponseBody
	@RequestMapping("comparingPwd")
	public int comparingPwd(String pwd ,Integer touristId){
		int count = touristService.comparingPwd(pwd,touristId);
		return count ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：个人中心 修改密码
	 * @parameter：touristPassword   
	 * @return：int
	 * @date : 2018年4月26日 下午3:38:06
	 */
	@ResponseBody
	@RequestMapping("updateTouristIdPassword")
	public int updateTouristIdPassword(String touristPassword , Integer touristId){
		Tourist tourist = new Tourist();
		tourist.setTouristId(touristId);
		tourist.setTouristPassword(touristPassword);
		Integer count = touristService.updateTouristIdPassword(tourist);
		return count ;
	}
	
	/**
	 * 
	 * @throws UnsupportedEncodingException 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：支付接口 易宝支付 订单
	 * @parameter：pd_FrpId银行标示 , orderUuid订单id , orderPrices支付金额 
	 * @return：String
	 * @date : 2018年4月27日 上午11:42:46
	 */
	@RequestMapping("touristSceneOrderPay")
	public String touristSceneOrderPay(String pd_FrpId , String orderUuid , String orderPrices ,HttpServletRequest request) throws UnsupportedEncodingException{
		System.out.println(pd_FrpId +"--"+orderUuid+"--"+orderPrices);
    	request.setCharacterEncoding("GBK");
    	//测试商户：商户编号  
        String accountID = "10001126856";  
        //测试商户：密钥  
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
        //测试成功支付   提供商家返回数据地址
        String accountCallbackURL = "http://localhost:8080/maven_travel/tourist/resulPay";
        
        //提供支付接口所需要的数据源
        String orderID = orderUuid;        //获取订单号  
        String amount = orderPrices;          //获取支付金额  
        String accountBankID = pd_FrpId; //获取用户所选择的银行  
        String businessType = "Buy";  //业务类型。Buy为在线支付  
        String currency = "CNY";      //交易币种。CNY为人民币  
        String productDesc = "";      //商品描述  
        String productCategory = "";  //商品种类  
        String productID = "";        //商品ID  
        String addressFlag = "0";     //送货地址。0为不需要，1为需要  
        String accountMoreInfo = "";  //商户扩展信息  
        String pr_NeedResponse = "0"; //应答机制 
        
        String md5hmac = PaymentUtil.buildHmac(
        		businessType, accountID, orderID, amount, currency, productID, productCategory, 
        		productDesc, accountCallbackURL,
        		addressFlag, accountMoreInfo, accountBankID, pr_NeedResponse, keyValue);
        
        request.setAttribute("businessType",businessType );
        request.setAttribute("accountID",accountID );
        request.setAttribute("orderID", orderID);
        request.setAttribute("amount", amount);
        request.setAttribute("currency", currency);
        request.setAttribute("productID", productID);
        request.setAttribute("productCategory",productCategory );
        request.setAttribute("productDesc",productDesc );
        request.setAttribute("accountCallbackURL", accountCallbackURL);
        request.setAttribute("addressFlag", addressFlag);
        request.setAttribute("accountMoreInfo", accountMoreInfo);
        request.setAttribute("accountBankID", accountBankID);
        request.setAttribute("needResponse", pr_NeedResponse);
        request.setAttribute("md5hmac", md5hmac);
        
    	return "before/conection" ;
	}
	
	
	/**
	 * 
	 * @throws UnsupportedEncodingException 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：支付成功后参数的易宝对接后台回调
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月27日 上午11:54:50
	 */
	@RequestMapping("resulPay")
	public String resulPay(HttpServletRequest request) throws UnsupportedEncodingException{
	    request.setCharacterEncoding("GBK");
    	
   	   //测试商户：商家ID   
       String p1_MerId = "10001126856";  
       //测试商户：商家密钥  
       String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl"; 
       
       String r0_Cmd = request.getParameter("r0_Cmd");      //业务类型  
       String r1_Code = request.getParameter("r1_Code");    //扣款结果。1:扣款成功  
       String r2_TrxId = request.getParameter("r2_TrxId");  //易宝交易订单号  
       String r3_Amt = request.getParameter("r3_Amt");      //扣款金额。交易结束后，易宝交易系统将实际扣款金额返回给商户  
       String r4_Cur = request.getParameter("r4_Cur");      //交易币种。人民币为CNY  
       String r5_Pid = request.getParameter("r5_Pid");      //商品ID  
       String r6_Order = request.getParameter("r6_Order");  //商户订单号  
       String r7_Uid = request.getParameter("r7_Uid");      //易宝会员ID  
       String r8_MP = request.getParameter("r8_MP");        //商户扩展信息。可任意填写1K的字符串，交易返回时将原样返回  
       String r9_BType = request.getParameter("r9_BType");  //交易结果通知类型。1:交易成功回调(浏览器重定向)，2:交易成功主动通知(服务器点对点通讯)  
       String hmac = request.getParameter("hmac");          //MD5交易签名  
       
       boolean result = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
       		r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
       //判断是否支付成功
       if (result) {
       	 if ("1".equals(r1_Code)) {  
       		    //此时操作数据库进行数据修改
       		 	TouristSceneOrderPriceRel tsopr = new TouristSceneOrderPriceRel();
       		 	tsopr.setOrderUuid(r6_Order);
       		 	tsopr.setOrderPrices(Double.parseDouble(r3_Amt));
       		 	//生成当前时间
       		 	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       		 	String format2 = format.format(new Date());
       		 	tsopr.setOrderPaydate(format2);	
       		 	tsopr.setOrderStatus(1);
       		 	//修改支付订单状态
       		 	touristSceneOrderPriceRelService.updateTouristPayInfo(tsopr);
       		 	
       		 	//判断易宝支付回调参数
                StringBuffer message = new StringBuffer();  
                //订单编号
                message.append("订单号为：" + r6_Order + " 的订单支付成功，"); //此时数据库中订单支付状态应为已支付，否则容易出现"无限刷点卡"的BUG  
                //支付价格
                message.append("用户支付了" + r3_Amt + "元。<br/>");  
                message.append("交易结果通知类型：");  
                if ("1".equals(r9_BType)) {  
                    message.append("回到个人中心订单页面。<br/>");  
                } else if ("2".equals(r9_BType)) {  
                    message.append("易宝支付网关后台程序通知。<br/>");  
                }  
                message.append("易宝订单系统中的订单号为：" + r2_TrxId);  
                request.setAttribute("message", message);  
            } else {  
                request.setAttribute("message", "用户支付失败");  
            } 
		}else {
			request.setAttribute("message", "数据来源不合法");  
		}
       return  "before/befor_paysuccess" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：测试访问支付回调页面
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月27日 下午10:11:21
	 */
	@RequestMapping("aaaa")
	public String aaaa(){
		return "before/befor_paysuccess" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 通过用户id 查询用户的评论数据  -- 通过用户的id查看自己所购买的美食
	 * @parameter：touristId
	 * @return：String
	 * @date : 2018年4月27日 下午10:11:46
	 */
	@RequestMapping("selectTouristAppraise")
	public String selectTouristAppraise(Integer touristId ,HttpServletRequest request){
		//景点
		List<TouristSceneAppraise> listAppraise = sceneAppraiseService.selectTouristAppraise(touristId);
		//美食
		List<TouristCatelEvaluateRel> listEvaluate = catelEvaluateService.selectCatelEvaluateByTouristId(touristId);
		//酒店
		List<TouristHotelEvaluateRel> listHotelEvaluate = touristHotelEvaluateRelService.selectHotelEvaluateByTouristId(touristId);
		
		request.setAttribute("listEvaluate", listEvaluate);
		request.setAttribute("listAppraise",listAppraise);
		request.setAttribute("listHotelEvaluate",listHotelEvaluate);
		return "before/comment" ;
	}
	

	/**
	 * 
	 * @方法作者 ：YXM
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ：添加用户评论
	 * @parameter：TODO
	 * @return：String
	 * @date : 2018年4月28日 下午5:21:35
	 */
	@ResponseBody
	@RequestMapping("insertTouristAppraise")
	public int insertTouristAppraise(TouristSceneAppraise touristSceneAppraise ,HttpServletRequest request){
		int count = sceneAppraiseService.insertTouristAppraise(touristSceneAppraise );
		if (count > 0) {
			return count;
		}else{
			return count ;
		}
	}
}
