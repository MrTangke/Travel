package com.zoubei.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zoubei.entity.tourist.Tourist;
import com.zoubei.service.BloginService;

/**
 * 	游客Controller相关操作
 * 	时间：	2018/4/15 上午11:01:04
 *	作者：	王双双
 */
@Controller
@RequestMapping("/login/")
public class BloginController {
	@Autowired
	private BloginService bloginService;
	
	
	/**
	 * 	功能：	前往登录
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   上午07:48
	 *	作者：	王双双
	 */
	@RequestMapping("login")
	public String index(){
		
		return "before/login2";
	} 
	
	/**
	 * 	功能：	登录
	 * 	参数：	无
	 *	结果：	
	 *	时间：	2018/4/18  下午14:44
	 *	作者：	车明磊
	 */
	@RequestMapping("tologin")
	public String toLogin(HttpServletRequest request,Tourist tourist,String touristNickname,String touristPassword,String txtCode){
		String msg = "";
		String randomCode = (String) request.getSession().getAttribute("randomCode");
		if(txtCode == null || txtCode == ""){
			msg="请输入验证码";
		}else{
			if(randomCode.equals(txtCode)){
				if(touristNickname != null){
					tourist =  this.bloginService.selectTourist(tourist.getTouristNickname());
					if(tourist != null){
						if(tourist.getTouristPassword().equals(touristPassword)){
							request.getSession().setAttribute("tourist", tourist);
							
							return "redirect:/index/index";
						}
					}
				}
			}else{
				msg="验证码输入有误";
			}
			
		}
		request.setAttribute("msg", msg);
		return "before/login2";
	}
	
	/**
	 * 	功能：	前往注册
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   下午19:48
	 *	作者：	王双双
	 */
	@RequestMapping("register")
	public String register(){
		
		return "before/register";
	} 
	
	/**
	 * 	功能：	前往注册
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/16   下午19:48
	 *	作者：	王双双
	 */
	@RequestMapping("toRegister")
	@ResponseBody
	public void toRegister(String touristNickname,String touristPassword,String touristPassword2,Tourist tourist){

		bloginService.insertRegister(tourist);
	} 
	
	/**
	 * 	功能：	注销
	 * 	参数：	无
	 *	结果：	return string;
	 *	时间：	2018/4/23   下午18:44
	 *	作者：	车明磊
	 */
	@RequestMapping("loginOut")
	public String loginOut(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:/index/index";
	} 
	
}
