<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>推荐行程</title>
    
    <%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
    
  </head>
  
  <body>
  	
    <div class="index_body_tour">
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
            <li id="cur_2" class="fir_li cur"><a href="<%=basePath %>index/tuijian">旅游景点</a></li>
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

        <div class="ny_con tour_padding">
            
            <div class="tour_bt">
                <p>'走呗'旅游为游客提供最舒适的旅行体验<br />
		                               我们明白,旅行应该带给旅行者惊喜的发现,激动人心的体验,令人深思的情景和值得记忆的瞬间
                </p>
               <h3> 国内推荐旅行<span></span></h3>
            </div>
            
            <div class="list_line">
            	<c:forEach items="${listArea }" var="a">
            		<dl class="clearfix">
	                    <dt class="cur2" style="background: #857b77 url(<%=basePath %>styles/before/webimages/se5.png) no-repeat 60px top;">
	                    	<a href="javascript:void(0);" class="fc_diqu">${a.areaName }</a>
	                    </dt>
	                    <dd>
	                        <em>更多</em>
	                        <div class="country_list clearfix">
	                            <c:forEach items="${a.areas }" var="aa">
	                            	<a href="javascript:void(0);" name="${aa.areaId }" onclick="showScene('${aa.areaId }')" imgid="2">${aa.areaName }</a>
	                            </c:forEach>
	                        </div>
	                    </dd>
	                </dl>
            	</c:forEach>
            </div>
            
            <div class="tour_con clearfix">
            	<div class="tour_left" id="assignshow" >
                
            	</div>
                <div class="tour_left" id="defaultshow" >
				                如果你厌倦了凡尘俗世，庸常碎序，叨叨扰扰，那么找一处陶渊明似的世外桃源吧！他能过滤你所有的负能量，还你一个年少时童话的遐想。<br>
				                又或天子脚下，皇城一览，又或云游山水，闲情雅致，又或...<br>
				                总之，给自己放个假吧。<br><br><br>
                    
                
                	<c:forEach items="${listScene }" var="s">
                		<dl class="clearfix">
                        <dt><a href="javascript:void(0);">
                            <img src="<%=basePath%>${s.listSceneImg[1].imgUrl}" width="268" height="179" alt="" /></a>
                        </dt>
                        <dd>
                            <h3>
                                <em><a href="<%=basePath%>tourist/particulars?sceneId=${s.sceneId }">了解更多>></a></em><a href="javascript:void(0)">
                                	<font color="#fff" size="5">【${s.sceneName }】</font>
                                	<span style="padding:10px"></span>
	                            	${s.sceneAddress }
                                </a></h3>
                            <p>${s.sceneContent }…</p>
                            <span><a href="javascript:;" class="cur1"></a><a href="javascript:;" class="cur2"></a><a
                                href="javascript:;" class="cur3"></a></span>
                        </dd>
                    </dl>
                	</c:forEach>
                </div>
                <div class="tour_right">
                    <ul>
                    	
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
            <p>深圳办公地址：深圳市福田中心区福华五路卓越世纪中心3号楼B座818  <span>咨询电话：0755-82029695；0755-82934944</span> <span style="display:none;">商务合作咨询电话：0755-12345678</span>
                <span></span></p>
            <p>重庆办公地址：重庆市渝北区金开大道355号万科万悦汇2幢14-16号<span> 咨询电话：023-63424884；13618331099 </span></p>
            <p>电子邮件：info@sansetrip.com 出境旅游经营许可证：L-CQ-CJ00035</p>
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
                2013-2015©走吧旅行-高端品质旅行专家™ All rights reserved. 走吧旅行有限公司 版权所有<span><a href="#" target="_blank"></a>
        </div>
    </div>
    
    <div class="scroll_top">
        <span></span>
    </div>
</body>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
	
	$(function(){
		/* 默认隐藏指定的div  -- 会进行显示相应地区下面的景点的集合 */
		$("#assignshow").hide();
	});
	
	// 根据地区的id  进行动态显示图片详细界面
	function showScene(areaId){
		$("#defaultshow").hide();
		
		// 将a标签中的边框取消
		$("a").css("border","none");
		
		$.post(
			"<%=basePath %>index/selectSceneByAreaId",
			{"areaId":areaId},
			function(obj){
				
				if(obj == ""){
					$("#assignshow").show();
					$("#assignshow").html("<h2>小主，你点击的地区暂时还没开放景点，敬请等候...</h2><br><br>");
				}else{
					$("#assignshow").show();
					$("#assignshow").html("如果你厌倦了凡尘俗世，庸常碎序，叨叨扰扰，那么找一处陶渊明似的世外桃源吧！他能过滤你所有的负能量，还你一个年少时童话的遐想。<br> 又或天子脚下，皇城一览，又或云游山水，闲情雅致，又或...<br>总之，给自己放个假吧。<br><br><br>");
					
					var curWwwPath = window.document.location.href;
				    //获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
				    var pathName = window.document.location.pathname;
				    var pos = curWwwPath.indexOf(pathName);
				    //获取主机地址，如： http://localhost:8080
				    var localhostPath = curWwwPath.substring(0, pos);
				    //获取带"/"的项目名，如：/ems
				    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
				    //获取项目的basePath   http://localhost:8080/ems/
				    var basePathscript=localhostPath+projectName+"/";
					
				    
					//进行循环更新前台的显示的景点列表
					for(var i=0; i<obj.length; i++){
						$("#assignshow").append("<dl class='clearfix'><dt><a href='javascript:void(0);'><img src="+basePathscript+""+obj[i].listSceneImg[0].imgUrl+" width='268' height='179' /></a></dt><dd><h3><em><a href="+basePathscript+"tourist/particulars?sceneId="+obj[i].sceneId +">了解更多>></a></em><a href='javascript:void(0)'><font color='#fff' size='5'>【"+obj[i].sceneName +"】</font><span style='padding:10px'></span>"+obj[i].sceneAddress +"</a></h3><p>"+obj[i].sceneContent +"…</p><span><a href='javascript:;' class='cur1'></a><a href='javascript:;' class='cur2'></a><a href='javascript:;' class='cur3'></a></span></dd></dl>");
					}
				}
				// 将选中的区域设置醒目表示
				$("[name='"+areaId+"']").css("border-bottom","2px solid #a23bce");	
			},
			"json"
		)
	};
	
</script>
</html>

