package com.zoubei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/before/")
public class ZbeforeOtherTestController {

	//	首页
	@RequestMapping("index")
	public String index(){
		return "before/index";
	} 
	
	//	推荐行程
	@RequestMapping("tuijian")
	public String tuijian(){
		return "before/tuijian";
	} 
	
	//	关于我们
	@RequestMapping("about")
	public String about(){
		return "before/about";
	}
	
	//	样式
	@RequestMapping("particulars")
	public String particulars(){
		return "before/before_particulars";
	}
	
	
	
	
}
