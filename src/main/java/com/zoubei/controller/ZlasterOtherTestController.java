package com.zoubei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/laster/")
public class ZlasterOtherTestController {
	/**
	 * 
	 * @方法作者 ：YXM
	 *
	 * @修改人：
	 *
	 * @修改时间：
	 *
	 * @业务内容 ：登陆
	 *
	 * @parameter：TODO
	 *
	 * @return：String
	 *
	 * @date : 2018年4月15日 下午10:10:37
	 */
	@RequestMapping("login")
	public String login(){
		return "laster/laster_login" ;
	}

	/**
	 * 
	 * @方法作者 ：YXM
	 *
	 * @修改人：
	 *
	 * @修改时间：
	 *
	 * @业务内容 ：首页
	 *
	 * @parameter：TODO
	 *
	 * @return：String
	 *
	 * @date : 2018年4月15日 下午10:10:48
	 */
	@RequestMapping("index")
	public String index(){
		return "laster/laster_index" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 *
	 * @修改人：
	 *
	 * @修改时间：
	 *
	 * @业务内容 ：使用于酒店
	 *
	 * @parameter：TODO
	 *
	 * @return：String
	 *
	 * @date : 2018年4月15日 下午10:11:04
	 */
	@RequestMapping("hotel")
	public String chart(){
		return "laster/laster_hotel" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 *
	 * @修改人：
	 *
	 * @修改时间：
	 *
	 * @业务内容 ：
	 *
	 * @parameter：去酒店页面
	 *
	 * @return：String
	 *
	 * @date : 2018年4月15日 下午10:11:23
	 */
	@RequestMapping("toListHotelJsp")
	public String toListChartJsp(){
		return "laster/laster_hotel" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 *
	 * @修改人：
	 *
	 * @修改时间：
	 *
	 * @业务内容 ：商家
	 *
	 * @parameter：TODO
	 *
	 * @return：String
	 *
	 * @date : 2018年4月15日 下午10:11:57
	 */
	@RequestMapping("shops")
	public String shops(){
		return "laster/laster_shops" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 *
	 * @修改人：
	 *
	 * @修改时间：
	 *
	 * @业务内容 ：文件上传
	 *
	 * @parameter：TODO
	 *
	 * @return：String
	 *
	 * @date : 2018年4月15日 下午10:12:10
	 */
	@RequestMapping("fileupload")
	public String fileupload(){
		return "laster/laster_fileupload" ;
	}
	
	/**
	 * 
	 * @方法作者 ：YXM
	 *
	 * @修改人：
	 *
	 * @修改时间：
	 *
	 * @业务内容 ：添加页面
	 *
	 * @parameter：TODO
	 *
	 * @return：String
	 *
	 * @date : 2018年4月15日 下午10:12:21
	 */
	@RequestMapping("insert")
	public String insert(){
		return "laster/laster_insert" ;
	}
}
