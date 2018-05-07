<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
	<%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/css/user.css" />
	<script type="text/javascript" src="<%=basePathJs %>styles/before/webjs/jquery.masonry.min.js"></script>	
<script type="text/javascript">
		$(window).load(function(){
			$(".tour_list ul li:nth-child(4n)").addClass("cur");
			$('.tour_list ul').masonry({
				itemSelector: '.tour_list ul li',
				columnWidth: 20,
				isAnimated:true
			});	
		});	
		
        $(function () {
            var t = true;
            var page = 1;
            $(window).scroll(function () {
                if ($(document).height() - $(window).scrollTop() == $(window).height()) {
                    $.ajax({
                        url: "Tools/Waterfall.ashx?page=" + page,
                        success: function (data) {
                            page += 1;
                            $(".clearfix").append(data);
                            setTimeout(function () { t = true; }, 10000);
                        },
                        dataType: "json"
                    })
                }
            });
        })
    </script>
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
            <em style="display:none;">分享</em> <a href="<%=basePath %>login/login">登录</a>|<a href="<%=basePath %>login/register">注册</a> 
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
         <div class="ny_con tour_padding">
            <div class="tour_list">
                <ul class="clearfix">
                	<c:forEach items="${tourists.scenes}" var="se">
                    <li>
                        <%-- <img src="<%=basePathJs %>styles/before/UpLoadFiles/20161212/2016121210593890.jpg" class="zml_img" width="280" /> --%>
                        <c:forEach items="${tourists.senceImgs}" var="to">   
                        	<c:if test="${to.sceneId==se.sceneId }">                  	
                        	  <img src="<%=basePath%>${to.imgUrl}" class="zml_img" width="280" />             
                       		</c:if>   
                        </c:forEach>
                        <div class="list_con">
                            <p txttitle="诺坎普座无虚席"> <span style="font-size:14px;"><strong>${se.sceneName}</strong></span></p>
                            <em></em>
                            <span>
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a> </a></div>
                            <button style="margin-left: 73%;margin-top: -10%" onclick="cancel('${se.sceneId}')">取消收藏</button>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        
                        </div>
                        
                    </li>
                    </c:forEach>
               
                   <%--  <li>
                        <img src="<%=basePathJs %>styles/before/UpLoadFiles/20161212/2016121210592163.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="巴塞罗那vs皇家马德里"> <span style="font-size:14px;"><strong>巴塞罗那vs皇家马德里</strong></span></p>
                            <em>2016-12-12</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="<%=basePathJs %>styles/before/UpLoadFiles/20161212/2016121210590303.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="观战西班牙国家德比"> <span style="font-size:14px;"><strong>观战西班牙国家德比</strong></span></p>
                            <em>2016-12-12</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="<%=basePathJs %>styles/before/UpLoadFiles/20160308/2016030817374266.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="诺曼底美军墓地"> <span style="font-size:14px;"><strong>诺曼底美军墓地</strong></span></p>
                            <em>2016-03-08</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20160308/2016030817370089.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="诺曼底战士勋章"> <span style="font-size:14px;"><strong>诺曼底战士勋章</strong></span></p>
                            <em>2016-03-08</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150529/2015052911483779.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="西班牙自驾"> <span style="font-size:14px;"><strong>西班牙自驾</strong></span></p>
                            <em>2015-05-29</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816322560.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="美国沼泽"> <span style="font-size:14px;"><strong>迈阿密大沼泽</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816294622.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="美国奥兰多"> <span style="font-size:14px;font-family:SimSun;"><strong>环球影城</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816283282.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="美国酒吧"> <span style="font-size:14px;"><strong>邋遢酒吧——海明威的最爱</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816271989.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="迈阿密大沼泽"> <span style="font-size:14px;"><strong>迈阿密大沼泽</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816254953.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="奥兰多环球影城"> <span style="font-size:14px;"><strong>奥兰多环球影城</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816245949.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="美国西门河农场"> <span style="font-size:14px;"><strong>进击的牛仔</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816231851.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="美国太空舱"> <span style="font-size:14px;"><strong>土星5号</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816224625.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="观战NBA"> <span style="font-size:14px;"><strong>观战NBA</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816223599.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="观战NBA"> <span style="font-size:14px;"><strong>观战NBA</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816222262.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="观战NBA"> <span style="font-size:14px;"><strong>观战NBA</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816204814.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="美国航天局"> <span style="font-size:14px;"><strong>肯尼迪航天中心</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150528/2015052816201809.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="美国西海岸"> <span style="font-size:14px;"><strong>美国西海岸</strong></span></p>
                            <em>2015-05-28</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li>
                
                    <li>
                        <img src="UpLoadFiles/20150520/2015052013014064.jpg" class="zml_img" width="280" />
                        <div class="list_con">
                            <p txttitle="【叁色全球·私人订制】"> </p>
                            <em>2015-05-20</em>
                            <span>
                            
                            <div class="bdsharebuttonbox"><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></div>
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "1", "bdMiniList": false, "bdPic": "", "bdStyle": "2", "bdSize": "16" }, "share": {}, "image": { "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                            </span>
                        </div>
                    </li> --%>
                
                </ul>
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
                2013-2015©叁色旅行-高端品质旅行专家™ All rights reserved. 叁色旅行有限公司 版权所有<span><a href="#" target="_blank">技术支持：</a>
                <a href="http://www.smallseashell.com" target="_blank">网站模板</a></span><em>E-MAIL : info@sansetrip.com</em></p>
        </div>
    </div>
   
  
</body>
<script type="text/javascript">
	//取消收藏
	function cancel(sceneId){
		location.href="<%=basePath%>index/cancel?sceneId="+sceneId;
	}
</script>
</html>