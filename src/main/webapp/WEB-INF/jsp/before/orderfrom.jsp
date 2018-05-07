<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>我的订单</title>
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
			<img src="<%=basePath%>${sessionScope.tourist.touristImage}"/>
			<div>更换头像</div>
		</a>
	</div>
	<div class="con">
		<h2>${sessionScope.tourist.touristNickname }</h2>
		<p>${sessionScope.tourist.touristContent }</p>
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
	<a href="<%=basePath%>tourist/selectTouristAppraise?touristId=${sessionScope.tourist.touristId}"><span class="ico6"><img src="<%=basePath%>styles/before/images/nav_ico6.png"/></span>我的评论</a>
</div> 	
<div class="cw1000" style="margin-top: 4%">
	<div class="public_box pd10">
		<div class="list_title">
			<h2>${sessionScope.tourist.touristNickname }的订单</h2>
		</div>
		<div class="public_tag">
			<ul>
				<li><a class="cur" href="#" onclick="suoyou()">全部订单</a></li>
				<li><a href="#" onclick="daifu()">待付款</a></li>
				<li><a href="#" onclick="daichu()">待出游</a></li>
				<li><a href="#" onclick="daiping()">待评价</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------景区订单---------------->
		<div class="order_list">
			<div class="column_title">
				<ul>
					<li style="width:35%;">订单信息</li>
					<li style="width:10%;">数量</li>
					<li style="width:10%;">单价</li>
					<li style="width:10%;">总价</li>
					<li style="width:20%;">订单状态</li>
					<li style="width:15%;">操作</li>
				</ul>
			</div>
			<div class="list_con">
				<ul id="suoyou">
					<!-- 循环取出订单 -->
					<c:forEach items="${listTSOPR }" var="s">
					<li>
						<div class="serial">订单编号：${s.orderUuid }<a href="#" onclick="del()"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="<%=basePath %>${s.imgUrl}" /></a></div>
									<div class="name">
										<a href="#">${s.sceneName }门票</a>
										<p>下单日期：${s.orderDate }</p>
									</div>
									<div class="clear"></div>
								</div>
								<div class="number" style="width:10%;margin-top: 18px;">x${s.orderNum }</div>
								<div class="price" style="width:10%;margin-top: 18px;">￥${s.scenePrice}</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥${s.orderCount }</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p style="margin-top: 12px;">${s.orderStatus==0?'待支付':'已支付' }</p>
									</div>
								</div>
								<c:if test="${s.orderStatus==1}">
								<div class="operation" style="width:15%;">
									<div class="middle">
										<a class="evaluation" href="<%=basePath %>index/touristComment?orderId=${s.orderId }" >评价</a>
									</div>
								</div>
								</c:if>
								<c:if test="${s.orderStatus==0 }">
									<div class="operation" style="width:15%;">
										<div class="middle">
											<a class="buy" href="<%=basePath%>index/toSceneOrderPay?orderId=${s.orderId}">去付款</a>
										</div>
									</div>
								</c:if>
								<div class="clear"></div>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
				<ul id="daifukuan">
					<!-- 循环取出订单 -->
					<c:forEach items="${listTSOPR }" var="s">
					<c:if test="${s.orderStatus==0 }">
					<li>
						<div class="serial">订单编号：${s.orderUuid }<a href="#"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="<%=basePath %>${s.imgUrl}" /></a></div>
									<div class="name">
										<a href="#">${s.sceneName }门票</a>
										<p>下单日期：${s.orderDate }</p>
									</div>
									<div class="clear"></div>
								</div>
								<div class="number" style="width:10%;margin-top: 18px;">x${s.orderNum }</div>
								<div class="price" style="width:10%;margin-top: 18px;">￥${s.scenePrice}</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥${s.orderCount }</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p style="margin-top: 12px;">${s.orderStatus==0?'待支付':'已支付' }</p>
									</div>
								</div>
								<c:if test="${s.orderStatus==1}">
								<div class="operation" style="width:15%;">
									<div class="middle">
										<a class="evaluation" href="<%=basePath %>index/touristComment?orderId=${s.orderId }">评价</a>
									</div>
								</div>
								</c:if>
								<c:if test="${s.orderStatus==0 }">
									<div class="operation" style="width:15%;">
										<div class="middle">
											<a class="buy" href="<%=basePath%>index/toSceneOrderPay?orderId=${s.orderId}">去付款</a>
										</div>
									</div>
								</c:if>
								<div class="clear"></div>
							</div>
						</div>
					</li>
					</c:if>
					</c:forEach>
				</ul>
				
				<ul id="daichuyou">
					<!-- 待出游 -->
					<c:forEach items="${listTSOPR }" var="s">
					<c:if test="${s.orderStatus==1 }">
					<li>
						<div class="serial">订单编号：${s.orderUuid }<a href="#"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="<%=basePath %>${s.imgUrl}" /></a></div>
									<div class="name">
										<a href="#">${s.sceneName }门票</a>
										<p>下单日期：${s.orderDate }</p>
									</div>
									<div class="clear"></div>
								</div>
								<div class="number" style="width:10%;margin-top: 18px;">x${s.orderNum }</div>
								<div class="price" style="width:10%;margin-top: 18px;">￥${s.scenePrice}</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥${s.orderCount }</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p style="margin-top: 12px;">${s.orderStatus==0?'待支付':'已支付' }</p>
									</div>
								</div>
								<c:if test="${s.orderStatus==1}">
								<div class="operation" style="width:15%;">
									<div class="middle">
										<a class="evaluation" href="<%=basePath %>index/touristComment?orderId=${s.orderId }">评价</a>
									</div>
								</div>
								</c:if>
								<c:if test="${s.orderStatus==0 }">
									<div class="operation" style="width:15%;">
										<div class="middle">
											<a class="buy" href="<%=basePath%>index/toSceneOrderPay?orderId=${s.orderId}">去付款</a>
										</div>
									</div>
								</c:if>
								<div class="clear"></div>
							</div>
						</div>
					</li>
					</c:if>
					</c:forEach>
				</ul>
			</div>
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
                <a href="#">关于我们</a><span>|</span><a href="#">走呗精彩旅迹</a><span>|</span><a href="#">索取资料</a><span>|</span><a href="#">联系我们</a></p>
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
		$("#daifukuan").hide();
		$("#daichuyou").hide();
		$("#suoyou").show();
	})
	
	function daifu(){
		$("#suoyou").hide();
		$("#daichuyou").hide();
		$("#daifukuan").show();
	}
	
	function daichu(){
		$("#suoyou").hide();
		$("#daifukuan").hide();
		$("#daichuyou").show();
	}
	
	function daiping(){
		$("#suoyou").hide();
		$("#daifukuan").hide();
		$("#daichuyou").show();
	}
	
	function suoyou(){
		$("#daifukuan").hide();
		$("#daichuyou").hide();
		$("#suoyou").show();
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
	
</script>
</html>