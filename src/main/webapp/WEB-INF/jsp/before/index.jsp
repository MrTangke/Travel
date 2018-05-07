<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页</title>
    <%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
  </head>
  

  	<body>
    <div class="index_body">
        <div class="index_top">
    <div class="top_logo">
        <h3>
          	  定制您的人生体验</h3>
        <a href="javascript:void(0)">
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
        <div class="index_banenr">
            <div class="looking_line">
                <div class="line_bt">
                    <span class="cur1">精品线路推荐<em></em></span> 
                    
                </div>
               
                <div class="line_con">
                    <div class="zml_hotel">
                        <dl class="clearfix">
                            <dt>目的地</dt>
                            <dd>
                                <input name="" type="text" class="hotel_txt" /></dd>
                        </dl>
                        <dl class="clearfix">
                            <dt>出游日期</dt>
                            
                            <dd class="cur">
                                <span><input id="startTime" name="startTime" onfocus="WdatePicker()" type="text"  /></span>
                            </dd>
                            <dd class="cur">
                                <span><input id="ednTime" name="endTime" onfocus="WdatePicker()" type="text"  /></span>
                            </dd>
                        </dl>
                        <dl class="clearfix">
                            <dt>关键词</dt>
                            <dd>
                                <input name="" type="text" class="hotel_txt" value="（选填）酒店名/景点/美食" /></dd>
                        </dl>
                        <dl class="clearfix">
                            <dt>&nbsp;</dt>
                            <dd style="border:none;">
                            	<a href="#" style="color:#d7bce4; padding-right:40px; padding-left:10px">北京</a>
                            	<a href="#" style="color:#d7bce4; padding-right:40px">天津</a>
                            	<a href="#" style="color:#d7bce4; padding-right:40px">上海</a>
                            </dd>
                        </dl>
                        <dl class="clearfix">
                            <dt>&nbsp;</dt>
                            <dd class="dd_cur">
                                <input name="" type="button" class="hotel_btn" value="搜索" /></dd>
                        </dl>
                    </div>
                </div>
           
                <div class="line_con">
                </div>
            </div>
            <div class="banner_scroll">
                <div class="ban">
                    <ul>
                        <li><a href="#">
                            <img src="<%=basePath %>styles/before/webimages/banner_03.jpg" width="520" height="400" alt="" /></a></li>
                    
                        <li><a href="#">
                            <img src="<%=basePath %>styles/before/UpLoadFiles/20150421/2015042113240909.jpg" width="520" height="400" alt="" /></a></li>
                    
                        <li><a href="#">
                            <img src="<%=basePath %>styles/before/UpLoadFiles/20150421/2015042113292578.jpg" width="520" height="400" alt="" /></a></li>
                    </ul>
                </div>
                <div class="ban_btn">
                    <a href="javascript:;"></a><a href="javascript:;"></a><a href="javascript:;"></a>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="index_grobal">
            <em></em>
        </div>
        <div class="index_con">
            <div class="tarval_bt">
               <em><a href="javascript:;" class="cur">精彩旅途</a></em>
                <span>热门景点 </span>
                <h3><i>精品推荐</i></h3>
            </div>
            <div class="traval_con clearfix">
                <div class="traval_left">
                    <dl class="clearfix">
                        <dt>
                            <h3>
                               	 热门景点</h3>
                            <ul>
                                <h4>
                                   	 特别景区<span></span></h4>
                                    
                                    <li >经典特色</li>
                                    
                            </ul>
                        </dt>
                        <dd>
                            <ul class="clearfix">
                            
                                <li><a href="<%=basePath %>tourist/particulars?sceneId=1">
                                    <img src="<%=basePath %>styles/before/UpLoadFiles/20170219/2017021918232891.jpg" alt=""  /></a>
                                    <div class="li_txt">
                                        <h3>
											<em>Special Feature</em>2018帝都 · 穿越千年时光 · 一览皇城
										</h3>
										<p>
											中国 & 北京
										</p>
                                    </div>
                                </li>
                            
                                <li><a href="<%=basePath %>tourist/particulars?sceneId=34">
                                    <img src="<%=basePath %>styles/before/UpLoadFiles/20160217/2016021711130742.jpg" alt=""  /></a>
                                    <div class="li_txt">
                                        <h3>
											<em>Special Feature</em>祈年殿
										</h3>
										<p>
											祈求国泰民丰 · 为国为己
										</p>
                                    </div>
                                </li>
                            
                                <li><a href="<%=basePath %>tourist/particulars?sceneId=12">
                                    <img src="<%=basePath %>styles/before/UpLoadFiles/20160217/2016021711411267.jpg" alt=""  /></a>
                                    <div class="li_txt">
                                        <h3>
											<em>Special Feature</em>长城
										</h3>
										<p>
											这一卧 · 伤痕累累 · 守家国平安
										</p>
                                    </div>
                                </li>
                            
                            </ul>
                        </dd>
                        <dd>
                            <ul>
                            
                                
                            </ul>
                        </dd>
                        <dd>
                            <ul>
                                
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div class="traval_right">
					<ul class="clearfix">
						<c:forEach items="${listScene}" var="scence">
							<li><a href="<%=basePath %>tourist/particulars?sceneId=${scence.sceneId }"> <img src="<%=basePath%>${scence.listSceneImg[0].imgUrl}" alt=""
									style="width: 247px;height: 214px"/>
								</a>
								<div class="tra_good">
                                <h3>
                                    <em style="display:none;">500</em>【${scence.sceneName }】</h3>
                                <p>
                                    2018年，热门推荐最火景区排行</p>
                            </div>
								</li>
						</c:forEach>
					</ul>
                </div>
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
                2013-2015©&nbsp;&nbsp;&nbsp;'走呗'&nbsp;&nbsp;&nbsp;旅行-高端品质旅行专家™ <span><a href="#" target="_blank"></a>
                <a href="http://www.smallseashell.com" target="_blank"></a></span><em></em></p>
        </div>
    </div>

</body>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script>
    index_js();
    $('.ban>ul').slide({
        listButton: '.ban_btn a',
        speed: 600, 			//速度
        effects: 'fade', 		//动画效果  left,up,fade
        animateType: 'swing'
    });
    $('.ser_scroll>ul').slide({
        listButton: '.ser_btn a',
        speed: 600, 			//速度
        effects: 'fade', 		//动画效果  left,up,fade
        animateType: 'swing'
    });
</script>

<script type="text/javascript">
    $(function () {
        $(".zml_line dl a").click(function () {
            location.href = "Itinerary/Search.html?keyword=" + escape($(this).attr("href")) + "&n=" + escape($(this).attr("imgid"));
            return false;
        });
        IndexJsImgMax();
    })
</script>

<script type="text/javascript">
    $(function () {
        $(".traval_left dd").each(function () {
            $(this).find("img").eq(0).attr("width", 500);
            $(this).find("img").eq(0).attr("height", 300);
            $(this).find("img").eq(1).attr("width", 245);
            $(this).find("img").eq(1).attr("height", 210);
            $(this).find("img").eq(2).attr("width", 245);
            $(this).find("img").eq(2).attr("height", 210);
        })
		
		$(".footer_list ul li").hover(function () {
			var img = $(this).find("img");
			var rel = img.attr("rel");
			var src = img.attr("src");
		
			img.attr("src", rel)
			img.attr("rel", src)
		}, function () {
			var img = $(this).find("img");
			var rel = img.attr("rel");
			var src = img.attr("src");
		
			img.attr("src", rel)
			img.attr("rel", src)
		})	
    })
</script>
<script type="text/javascript">
    $(function () {
        $("#cur_1").addClass("cur");
    });
    
</script>
</html>

