<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>关于我们</title>
    <%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
    
  </head>
  
  <body>
  		<div class="index_body_about">
		    <div class="index_top">
			    <div class="top_logo">
			        <h3>定制您的人生体验</h3>
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
			            
			            <li id="cur_6"><a href="<%=basePath %>index/mycenter">个人中心</a></li>
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

	        <div class="ny_con_about">
	            <div class="ny_banner">
	            
	            </div>
            <div class="about_nycon">
                <dl class="clearfix">
					<dt>
						<h3>
							关于我们
						</h3>
					</dt>
					<dd>
						<h3>
							走吧的梦想是能够为客户提供最舒适的旅行体验。
						</h3>
						<p>
							我们明白，旅行应该带给旅行者惊喜的发现，激动人心的体验，令人深思的情景和值得记忆的瞬间。我们在旅行的各个环节为客人提供独特的、毕生难忘的旅行体验。无论您想观赏东非神奇的野生动物，在当地人陪同下漫步巴黎的胡同小巷，还是去奥地利的山谷泡着热汤观赏雪山，我们的专家都能让你梦想成真。当您想去世界任何角落旅行，我们都能让您达成所愿。
						</p>
						<p>&nbsp;
							
						</p>
						<p>
							如果您在筹划外出旅行时对目的地选择的事情一无所知，不知从何下手？
				        请垂询我们的旅行专家团队，我们非常乐意与您分享专业知识并给您灵感。欢迎您的到来！
						</p>
					</dd>
				</dl>
            </div>
        </div>
    </div>

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
    <!-- #EndLibraryItem -->

</body>
	
<script src="<%=basePathJs%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(function () {
	        $("#cur_5").addClass("cur");
	    });
	    
	</script>
	
	
	
</html>
