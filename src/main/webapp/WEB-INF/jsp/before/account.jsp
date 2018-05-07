<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户设置</title>
	<%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/css/user.css" />
</head>
<body>
    <div class="index_top">
    <div class="top_logo">
        <h3>
          	  定制您的人生体验</h3>
        <a href="index.html">
            <img src="<%=basePath %>styles/before/webimages/index_02.png" width="117" height="121" alt="" /></a>
    </div>
    <div class="top_menu">
        <div class="login">
            <em style="display:none;">分享</em> 
           		<c:if test="${sessionScope.tourist == null }"><a href="<%=basePath %>login/login">登录</a>|<a href="<%=basePath %>login/register">注册</a></c:if>
            	<c:if test="${sessionScope.tourist != null }">欢迎登录：${sessionScope.tourist.touristRealname }</c:if>
              <span>
	             <c:if test="${sessionScope.tourist == null }">
	             	<a href="<%=basePath %>login/login">请登录</a>
	             </c:if>
	             <c:if test="${sessionScope.tourist != null }">
	             	<a href="<%=basePath %>login/loginOut">退出</a>
	             </c:if>
             </span>
        </div>
        <ul>
            <li class="fir_li" id="cur_1"><a href="<%=basePath %>index/index">首 页</a></li>
            <li id="cur_2"><a href="<%=basePath %>index/tuijian">旅游景点</a></li>
            <li id="cur_3"><a href="<%=basePath %>other/toHotel">酒店公寓</a></li>
			<li id="cur_4"><a href="<%=basePath %>other/toCate">经典美食</a></li>
            
            <li id="cur_5"><a href="<%=basePath %>index/about">关于我们</a></li>
            
            <li id="cur_6" class="fir_li cur"><a href="<%=basePath %>index/mycenter">个人中心</a></li>
            <li class="last_li">
                <img src="<%=basePath %>styles/before/webimages/index_22.png" width="18" height="17" alt="" />
                <em><img src="<%=basePath%>upload/imgwx/wx.png" alt="" /></em>
            </li>
            <div class="clear">
            </div>
        </ul>
    </div>
    <div class="clear">
    </div>
</div>
<hr style="margin-top: 10px">

<!-----------------用户banner---------------->
<div id="user_banner">
	<div class="pic">
		<a href="<%=basePath%>index/photo">
			<img src="<%=basePath%>${tourists.touristImage}"/>
			<div>更换头像</div>
		</a>
	</div>
	<div class="con">
		<h2>${tourists.touristNickname}</h2>
		<p>${tourists.touristContent}</p>
	</div>
</div>
<!-----------------快捷导航---------------->
<div id="quick_nav">
	<a href="<%=basePath%>index/mycenter"><span class="ico1"><img src="<%=basePath%>styles/before/images/nav_ico1.png"/></span>个人信息</a>
	<a href="<%=basePath%>index/wait"><span class="ico2"><img src="<%=basePath%>styles/before/images/nav_ico2.png"/></span>发布游记</a>
	<a href="<%=basePath%>index/wait"><span class="ico7"><img src="<%=basePath%>styles/before/images/nav_ico7.png"/></span>我的游记</a>
	<a href="<%=basePath%>index/tocollect"><span class="ico3"><img src="<%=basePath%>styles/before/images/nav_ico3.png"/></span>我的收藏</a>
	<!-- 删除多余订单 -->
	<a href="<%=basePath%>index/orderfrom"><span class="ico5"><img src="<%=basePath%>styles/before/images/nav_ico5.png"/></span>我的订单</a>
	<a href="<%=basePath%>index/comment"><span class="ico6"><img src="<%=basePath%>styles/before/images/nav_ico6.png"/></span>我的评论</a>
</div>
<!-----------------框架---------------->
<div class="cw1000">
	<div class="w280 fl">
		<div class="public_box">
			<!-----------------设置导航---------------->
			<div id="set_nav">
				<ul>
					<li><a class="cur" href="<%=basePath%>index/mycenter"><i class="ico1"></i>我的信息</a></li>
					<li><a href="<%=basePath%>index/account"><i class="ico3"></i>设置信息</a></li>
					<li><a href="<%=basePath%>index/photo"><i class="ico2"></i>我的头像</a></li>
					<li><a href="<%=basePath%>index/changepw"><i class="ico4"></i>修改密码</a></li>
				</ul>
			</div>
		</div>	
	</div>
	<div class="w700 fr">
		<div class="public_box">
			<!-----------------我的信息---------------->
			<div id="set_box">
				<div class="title"><h2>我的信息</h2></div>
				<form action="<%=basePath%>index/tomycenter" method="post">
				<table class="table_list">
					<tr>
						<th>昵称：</th>
						<td><input type="hidden" name="touristId" value="${tourists.touristId}"><input class="text" name="touristNickname" type="text" value="${tourists.touristNickname}"/></td>
					</tr>
					<tr>
						<th>姓名：</th>
						<td><input class="text" type="text" name="touristRealname" value="${tourists.touristRealname}"/></td>
					</tr>
					<tr>
						<th>性别：</th>
						<td>
							<label class="am-radio">
								
								<input class="radio" type="radio" name="touristSex" value="男" ${tourists.touristSex == "男"?"checked":""} > 男
							</label>
							<label class="am-radio">
								<input class="radio" type="radio" name="touristSex" value="女" ${tourists.touristSex=="女"?"checked":""}> 女
							</label>
							<label class="am-radio">
								<input class="radio" type="radio" name="touristSex" value="不详" ${tourists.touristSex=="不详"?"checked":""} > 不详
							</label>
						</td>
					</tr>
					
					<tr>
						<th>出生日期：</th>
						<td><input type="text" name="touristBirth" class="text" value="${tourists.touristBirth}"></td>
					</tr>
					<tr>
						<th>身份证号：</th>
						<td><input class="text" type="text" name="touristCardid" value="${tourists.touristCardid}"/></td>
					</tr>
					<tr>
						<th>电话号码：</th>
						<td><input class="text" type="text" name="touristPhone" value="${tourists.touristPhone}"/></td>
					</tr>
					<tr>
						<th>居住城市：</th>
						<td><input class="text" type="text" name="touristAddress" value="${tourists.touristAddress}"/></td>
					</tr>
					<tr>
						<th>个人签名：</th>
						<td><input class="text" type="text" name="touristContent" value="${tourists.touristContent}"/></td>
					</tr>
					
				</table>
				<div class="operation"><input type="submit" class="save" value="保存" /></div>
				</form>
			</div>
		</div>	
	</div>
	<div class="clear"></div>
</div>
 <%--    <div class="q_pagecontainer">
      <div class="q_pagewrap">
        <div class="q_page">
          <div class="l_s175m770 clr_after">
            <div class="l_s175">
              <div class="q_ucsidebar q_ucsidebar_user_exp">
                <link data-hfstamp="20180416152047" id="hf-style-sidebar" data-hffile="ucsidebar_styles" rel="stylesheet" href="//common.qunarzz.com/hf_qzz/prd/styles/default/ucsidebar@2c0bafcfaf6c0bd7423dcc40cb18bb8d.css">

                <ul id="q_usidebar_main"> 
                	<li class="q_ucsidebar_order">
                		<a target="_top" href="<%=basePath %>index/mycenter">个人信息</a>
                	</li> 
                	<li class="q_ucsidebar_order">
                		<a target="_top" href="<%=basePath%>index/account">账户设置</a>
                	</li>
                	<li class="q_ucsidebar_order">
                		<a target="_top" href="">我的订单</a>
                	</li>  
                	
                	<li class="q_ucsidebar_hotel"> 
                		<a href="javascript:">我的酒店<span class="q_ucsidebar_arrow"></span></a> <dl> <dd class="q_ucsidebar_item2"><a target="_top" href="http://hotel.qunar.com/myfavorite.jsp">我的收藏</a></dd> <dd class="q_ucsidebar_item3"><a target="_top" href="http://review.qunar.com/mall/index.htm">积分商城</a></dd> <dd class="q_ucsidebar_item4"><a target="_top" href="http://tips.qunar.com">点评社区</a></dd> <dd class="q_ucsidebar_item6"><a target="_top" href="http://hotel.qunar.com/mypic.jsp">我的图片</a></dd> <dd class="q_ucsidebar_item9"><a target="_top" href="http://hotel.qunar.com/eh/myeh.jsp">其他贡献</a></dd> <dd class="q_ucsidebar_item11"><a target="_top" href="http://hotel.qunar.com/myqa.jsp">我的问答</a></dd> </dl>
                	</li> 
                	                	<li class="q_ucsidebar_package"> 
                		<a href="javascript:">我的消息<span class="q_ucsidebar_arrow"></span></a> <dl> <dd class="q_ucsidebar_package"><a target="_top" href="http://dujia.qunar.com/myorder.jsp">度假订单</a></dd> <dd class="q_ucsidebar_item3"><a target="_top" href="http://dujia.qunar.com/myorder.jsp?orderSrc=http%3A%2F%2Fm.package.qunar.com%2Fuser%2Fcomment%2FcommentList.qunar">评价管理</a></dd> <dd class="q_ucsidebar_item2"><a target="_top" href="http://dujia.qunar.com/myorder.jsp?orderSrc=http%3A%2F%2Fm.package.qunar.com%2FcashCoupon%2FmyCashCoupon.qunar">我的代金券</a></dd> <dd class="q_ucsidebar_item4"><a target="_top" href="http://dujia.qunar.com/myorder.jsp?orderSrc=http%3A%2F%2Fm.package.qunar.com%2Forder%2FPromoCode.jsp">我的返礼码</a></dd> </dl> 
                	</li> 
                	
                	</ul> <script type="text/javascript"> !function(){function e(){for(var e=0,c=i.length;e<c;e++)!function(){var c=i[e];n(c)&&a(c)}()}function n(e){for(var n=0,a=e.children.length;n<a;n++)if(/^dl$/i.test(e.children[n].nodeName))return e.children[n]}function a(e){e.className=e.className.replace(/\s?q_usidebar_u?n?chosen/g,""),e.className+=" q_usidebar_unchosen"}function c(e){e.className=e.className.replace(/\s?q_usidebar_unchosen/g,""),e.className+=" q_usidebar_chosen"}function s(e){return/q_usidebar_chosen/.test(e.className)}for(var r=document.getElementById("q_usidebar_main"),i=r.children,l=0;l<i.length;l++)!function(){var a=i[l],r=a.children[0];a.className;n(a)&&(r.onclick=function(){var n=s(a);e(),!n&&c(a)})}()}(); </script> 
              </div>
            </div>
            <div class="l_m770 g-main-ctn">

            </div>
          </div>
        </div>
      </div>
    </div>
 	
    
    <div style="width: 1020px;height :454px;margin-left: 18%;">
    	<div style="width: 1020px;height: 454px;border: 1px solid #e8e8e8;background-image: url('<%=basePath%>styles/before/images/bei.jpg');background-size:100% 100%;">
    		<h1 style="font-size: 33px;font-family: cursive;margin-left: 24px;margin-top: 20px">修改信息</h1>
    		<div style="width: 200px;height: 200px;border: 1px solid #e8e8e8;margin-top: 20px;margin-left: 14px;float: left;">
    			<img alt="" src="<%=basePath%>${tourists.touristImage}" style="width: 200px;height: 200px"><span style="margin-top: 10%;margin-left: 30%" onclick="jump()">修改图片</span>
    		</div>
    		<form action="<%=basePath%>index/tomycenter" method="post">
    		
    		<div style="width: 780px;height: 400px;margin-top: -1px;margin-left: 9px;float: right;">
    			
    			<div style=""><span style="font-size: 25px;font-family: cursive;">用户 &nbsp;<input type="text" name="touristNickname" value="${tourists.touristNickname}" style="font-size: 25px;font-family: cursive;"></span></div>
    			<hr>
    			<div style=""><span style="font-size: 25px;font-family: cursive;">密码 &nbsp;<input type="text" name="touristPassword" value="${tourists.touristPassword}" style="font-size: 25px;font-family: cursive;"></span></div>
    			<hr>
    			<div style=""><span style="font-size: 25px;font-family: cursive;">姓名 &nbsp;<input type="text" name="touristRealname" value="${tourists.touristRealname}" style="font-size: 25px;font-family: cursive;"></span></div>
    			<hr>
    			<div style=""><span style="font-size: 25px;font-family: cursive;">性别 &nbsp;<input type="text" name="touristSex" value="${tourists.touristSex}" style="font-size: 25px;font-family: cursive;"></span></div>
    			<hr>
    			<div style=""><span style="font-size: 25px;font-family: cursive;">生日 &nbsp;<input type="text" name="touristBirth" value="<fmt:formatDate value='${tourists.touristBirth}' pattern='yyyy-MM-dd'/>" style="font-size: 25px;font-family: cursive;" onfocus="WdatePicker()"></span></div>
    			<hr>
    			<div style=""><span style="font-size: 25px;font-family: cursive;">生日 &nbsp;<input type="text" name="touristBirth" value="${tourists.touristBirth}" style="font-size: 25px;font-family: cursive;" onfocus="WdatePicker()"></span></div>
    			<hr>
    			<div style=""><span style="font-size: 25px;font-family: cursive;">电话 &nbsp;<input type="text" name="touristPhone" value="${tourists.touristPhone}" style="font-size: 25px;font-family: cursive;"></span></div>
    			<hr>
    			<div style=""><span style="font-size: 25px;font-family: cursive;">地址 &nbsp;<input type="text" name="touristAddress" value="${tourists.touristAddress}" style="font-size: 25px;font-family: cursive;" size="50"></span></div>
    			<hr>
    			<input type="submit" value="保存信息" style="margin-left: 70%">
    			
    		</div>
    		</form>
    		
    	</div>
    </div>
     --%>
     <div class="index_footer">
        <div class="footer_list">
            <em id="fenxiang_btn">
                <div class="bdsharebuttonbox"><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
				<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "16" }, "share": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
			</em>
            <p>
                <a href="#">关于我们</a><span>|</span><a href="#">精彩旅迹</a><span>|</span><a href="#">索取资料</a><span>|</span><a href="#">联系我们</a></p>
            <p>
                		深圳办公地址：深圳市福田中心区福华五路卓越世纪中心3号楼B座818  <span>咨询电话：0755-82029695；0755-82934944</span> <span style="display:none;">商务合作咨询电话：0755-12345678</span>
                <span></span></p>
            <p>重庆办公地址：重庆市渝北区金开大道355号万科万悦汇2幢14-16号<span> 咨询电话：023-63424884；13618331099 </span>
			</p>
            <p>
                	电子邮件：info@sansetrip.com 出境旅游经营许可证：L-CQ-CJ00035</p>
            <ul class="clearfix">
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150923/2015092319103984.png"  rel="UpLoadFiles/20150923/2015092319104482.png" height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511592197.png"  rel="webimages/link3.jpg" height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511591008.png"  rel="webimages/link4.jpg" height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511585791.png"  rel="webimages/link5.jpg" height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511584205.png"  rel="webimages/link6.jpg" height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511583107.png"  rel="webimages/link7.jpg" height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511581715.png"  rel="webimages/link8.jpg" height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150923/2015092319240614.png"  rel="UpLoadFiles/20150923/2015092319240897.png" height="60px" width="100px" /></a></li>
            </ul>
        </div>
        <div class="footer_copy">
            <p>
                2013-2015©走吧旅行-高端品质旅行专家™ All rights reserved. 走吧旅行有限公司 版权所有<span><a href="#" target="_blank">技术支持：</a>
                <a href="http://www.smallseashell.com" target="_blank">网站模板</a></span><em>E-MAIL : info@sansetrip.com</em></p>
        </div>
    </div>
</body>
<script src="<%=basePathJs%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
function jump(){
	window.open ( "<%=basePath%>index/tupain" , "blank" , "height=300,width=200,scrollbars=no,location=no") ;
}
</script>
</html>