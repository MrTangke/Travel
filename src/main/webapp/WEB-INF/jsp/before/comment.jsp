<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
	<%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/css/user.css" />
	<%-- <link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/css/amazeui.css" /> --%>

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
			<img src="<%=basePath%>${sessionScope.tourist.touristImage}"/>
			<div>更换头像</div>
		</a>
	</div>
	<div class="con">
		<h2>${sessionScope.tourist.touristNickname }</h2>
		<p>${sessionScope.tourist.touristContent }</p>
	</div>
</div>>
<!-----------------快捷导航---------------->
<div id="quick_nav">
	<a href="<%=basePath%>index/mycenter"><span class="ico1"><img src="<%=basePath%>styles/before/images/nav_ico1.png"/></span>个人信息</a>
	<a href="<%=basePath%>index/wait"><span class="ico2"><img src="<%=basePath%>styles/before/images/nav_ico2.png"/></span>发布游记</a>
	<a href="<%=basePath%>index/wait"><span class="ico7"><img src="<%=basePath%>styles/before/images/nav_ico7.png"/></span>我的游记</a>
	<a href="<%=basePath%>index/tocollect"><span class="ico3"><img src="<%=basePath%>styles/before/images/nav_ico3.png"/></span>我的收藏</a>
	<!-- 删除多余订单 -->
	<a href="<%=basePath%>index/orderfrom"><span class="ico5"><img src="<%=basePath%>styles/before/images/nav_ico5.png"/></span>我的订单</a>
	<a href="<%=basePath%>tourist/selectTouristAppraise?touristId=${sessionScope.tourist.touristId}"><span class="ico6"><img src="<%=basePath%>styles/before/images/nav_ico6.png"/></span>我的评论</a>
</div>

<div class="cw1000" style="margin-top: 4%">
	<div class="public_box pd30">
		<div class="public_tag">
			<ul>
				
				<li><a class="cur" href=""  onclick="jingdian()">景区评论</a></li>
				<li><a href="#"  onclick="jiudian()">酒店评论</a></li>
				<li><a href="#"  onclick="meishi()">美食评论</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------景区评论---------------->
		<div class="comments_list">
		
			<ul id="jingqu">
				<c:forEach items="${listAppraise}" var="s">
				<li class="pd_r150">
					<div class="scenic">
						<div class="tip"><img src="<%=basePath%>styles/before/images/scenic_ico.png">景区</div>
						<a href="#"><h3>${s.sceneName }<span style="margin-left: 20px">评论时间：${s.appraiseDates }</span></h3></a>
						<div class="clear"></div>
					</div>
					<div class="text">
						<p>我评论：${s.appraiseContent }</p>
					</div>
					<div class="del" style="top:52px;">
						<a href="#" onclick="del()"><i class="del_ico"></i>删除评论</a>
					</div>
				</li>
				</c:forEach>
			</ul>
	
			<!-----------------酒店评论---------------->
			
			<ul id="jiudian">
				<c:forEach items="${listHotelEvaluate}" var="s">
				<li class="pd_r150">
					<div class="scenic">
						<div class="tip"><img src="<%=basePath%>styles/before/images/scenic_ico.png">酒店</div>
						<a href="#"><h3>${s.hotelHotelname }<span style="margin-left: 20px">评论时间：${s.appraiseDates }</span></h3></a>
						<div class="clear"></div>
					</div>
					<div class="text">
						<p>我评论：${s.appraiseContent}</p>
					</div>
					<div class="del" style="top:52px;">
						<a href="#" onclick="delh()"><i class="del_ico"></i>删除评论</a>
					</div>
				</li>
			</c:forEach>
			</ul>
		
			<!-----------------美食评论---------------->
		
			<ul id="meishi">
			  <c:forEach items="${listEvaluate }" var="s">
				<li class="pd_r150">
					<div class="scenic">
						<div class="tip"><img src="<%=basePath%>styles/before/images/scenic_ico.png">美食</div>
						<a href="#"><h3>${s.cateShopname}<span style="margin-left: 20px">商品名称：${s.foodName }</span><span style="margin-left: 20px">评论时间：${s.appraiseDates }</span></h3></a>
						<div class="clear"></div>
					</div>
					<div class="text">
						<p>我评论：${s.appraiseContent}</p>
					</div>
					<div class="del" style="top:52px;">
						<a href="#"  onclick="delc()"><i class="del_ico"></i>删除评论</a>
					</div>
				</li>
				</c:forEach>
			</ul>
		
		</div>
	</div>
	<div class="clear"></div>
</div>	
    

    
    
 <div class="index_footer" style="margin-top: 4%">
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
                2013-2015©叁色旅行-高端品质旅行专家™ All rights reserved. 叁色旅行有限公司 版权所有<span><a href="#" target="_blank">技术支持：</a>
                <a href="http://www.smallseashell.com" target="_blank">网站模板</a></span><em>E-MAIL : info@sansetrip.com</em></p>
        </div>
    </div>
   
</body>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("#jiudian").hide();
		$("#meishi").hide();
	})
	
	function jingdian(){
		$("#jiudian").hide();
		$("#meishi").hide();
		$("#jingqu").show();
	}
	function jiudian(){
		$("#jingqu").hide();
		$("#meishi").hide();
		$("#jiudian").show();
	}
	function meishi(){
		$("#jingqu").hide();
		$("#jiudian").hide();
		$("#meishi").show();
	}
	
	function del(){
		
		layer.confirm('主人，您要删除自己的订单么？',function(index){
			layer.confirm('真的想删么？',function(index){
				layer.confirm('还想删？',function(index){
					layer.confirm('就是不死心？',function(index){
						layer.confirm('好吧！',function(index){
							layer.msg('非常遗憾，就不让你删!',{icon:1,time:1000});
						});
					});
				});
			});
		});
	}
	
  function delc(){
	  layer.confirm('主人，你要删除美食么？',function(index){
			layer.confirm('你咋，真的想删么？',function(index){
				layer.confirm('打个商量别删行不？',function(index){
					layer.confirm('你再删我放大招了？',function(index){
						layer.confirm('好吧，大哥！',function(index){
							layer.confirm('你赢了，我扶你！',function(index){
								layer.msg('非常遗憾，就不让你删!',{icon:1,time:1000});
							});
						});
					});
				});
			});
		});
  }
  
  
  function delh(){
	  layer.confirm('主人，你要删除酒店么？',function(index){
			layer.confirm('你再删我揍你了啊？',function(index){
				layer.confirm('打个商量别删行不？',function(index){
					layer.confirm('今日留一面，日后好想见',function(index){
						layer.confirm('好吧，大哥！',function(index){
							layer.confirm('舅扶你！',function(index){
								layer.msg('非常遗憾，就不让你删!',{icon:1,time:1000});
							});
						});
					});
				});
			});
		});
  }
</script>
</html>