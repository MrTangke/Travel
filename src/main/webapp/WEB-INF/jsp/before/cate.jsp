<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>餐饮服务</title>
    <%@ include file="/styles/before/common/before_common_css.jsp" %>
    <style type="text/css">
    	a:hover{color:#652c89;}
    </style>
  </head>
 
<script type="text/javascript" src="<%=basePath %>styles/before/util/My97DatePicker/WdatePicker.js"></script> 
<body>
    <div class="index_body">
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
             <span><a href="javascript:void(0)">招聘信息</a></span>
        </div>
        <ul>
            <li class="fir_li" id="cur_1"><a href="<%=basePath %>index/index">首 页</a></li>
            <li id="cur_2"><a href="<%=basePath %>index/tuijian">旅游景点</a></li>
            <li id="cur_2"><a href="<%=basePath %>other/toHotel">酒店公寓</a></li>
            <li id="cur_4" class="fir_li cur" ><a href="<%=basePath %>other/toCate">经典美食</a></li>
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
        <div class="ny_con ny_person_con" style="padding-bottom: 10px;">
            <div class="person_con">
                <div class="person_top">
                </div>
                <div class="person_center">
                    <div class="person_win">
                        <div class="person_bt">
                            <span><em>只挑选最美味的特色餐饮</em><img src="<%=basePath %>styles/before/webimages/index_93.png" /></span>
                            <h3>餐饮服务</h3>
                        </div>
                      	<!-- begin poiDetail  图片轮播图片 -->
				        <div class="POIDETAIL--col2-row2 poiDetail" style="width:1100px; height:380px; margin-left:3px; padding-bottom:29px">
				               <div class="poiDetail__above clearfix" style="width:1100px; height:380px">
				                   <div id="slider" class="poiDetail__pic" style="width:1100px; height:380px">
				                     <ul class="pic__list slides" style="width:1100px; height:380px">
				                       <li><a href="javascript:void(0)"><img style="width:1100px; height:380px" src="<%=basePath%>upload/imgc/food/IVvxA7WmI94.jpg" alt=""></a></li>
				                       <li><a href="javascript:void(0)"><img style="width:1100px; height:380px" src="<%=basePath%>upload/imgc/food/11M62.jpg" alt=""></a></li>
				                       <li><a href="javascript:void(0)"><img style="width:1100px; height:380px" src="<%=basePath%>upload/imgc/food/111ZfME33.jpg" alt=""></a></li>
				                       <li><a href="javascript:void(0)"><img style="width:1100px; height:380px" src="<%=basePath%>upload/imgc/food/IVvxA7WmI93.jpg" alt=""></a></li>
				                       <li><a href="javascript:void(0)"><img style="width:1100px; height:380px" src="<%=basePath%>upload/imgc/food/103Ifno60.jpg" alt=""></a></li>
				                     </ul>
				                 </div>
                       		</div>
                       	</div>
                        <div>
                        	<div style="width:1100px; height:990px; margin:20px 0; margin-left:3px;"> 
                        		<!-- 左侧栏位 -->
                        		<div style="width:312px; height:884px; float:left;">
                       				<h2 style="padding-bottom:20px;  padding-left:8px; color:#652c89; ">商家店铺</h2>
                        			<div style="width:312px; height:520px; padding:8px;">
	                        			<!-- 隐藏滚动条 -->
	                        			<div  style="width:312px; height:490px; padding-right:90px; overflow-y:scroll; overflow-x:hidden; ">
	                        				<c:forEach items="${listCates }" var="c">
		                        				<a href="javascript:void(0)" onclick="foods('${c.cateId }')">
		                        					<img src="<%=basePath %>${c.cateLogo}" style="width:100px; height:52px; padding-right:9px" >
		                        					<b style="width:145px; display:inline-block;">${c.cateShopname }</b>
		                        				</a>
		                        				<br><br>
		                        			</c:forEach>
	                        			</div>
                        			</div>
                        			<div style="height:314px; padding:8px; padding-top:14px;">
                        				<h2 style=" color:#652c89;">景点推荐</h2>
                        				<div style="height:125px; padding:8px; padding-left:0px" >
                        					<a href="<%=basePath %>tourist/particulars?sceneId=1"><img style="width:135px" src="<%=basePath %>upload/imgh/hotel/gg.jpg"></a>
                        					<a href="<%=basePath %>tourist/particulars?sceneId=5"><img style="width:135px; padding-left:5px" src="<%=basePath %>upload/imgh/hotel/ymy.jpg"></a>
                        					<br>
                        					<p style="padding:10px;">
                        						<a href="<%=basePath %>tourist/particulars?sceneId=1" style="padding-left:20px">故宫博物馆</a> 
                        						<a href="<%=basePath %>tourist/particulars?sceneId=5" style="padding-left:70px">圆明园</a>
                        					</p>
                        				</div>
                        				<h2 style=" color:#652c89;">酒店推荐</h2>
                        				<div style="height:120px; padding:8px; padding-left:0px" >
                        					<img style="width:135px" src="<%=basePath %>upload/imgh/hotel/jd.jpg">
                        					<img style="width:135px; padding-left:5px" src="<%=basePath %>upload/imgh/hotel/hy.jpg">
                        					<p style="padding:10px;">
                        						<a href="javascript:void(0)" style="padding-left:20px">紫地客栈</a> 
                        						<a href="javascript:void(0)" style="padding-left:60px">阅微庄四合院宾馆</a>
                        					</p>
                        				</div>
                        			</div>
                        		</div>
                        		<!-- 右侧栏位 -->
                        		<div style="width:765px; height:965px; float:right; background:#fff; ">
                        			<center><h2 style="color:#652c89;">特色美食</h2></center>
                        			<div id="food" style="height:840px; padding-top:30px">
                        				<c:forEach items="${listFoods }" var="f">
                        					<div style="height:180px">
                        						<img style="width:200px; float:left; padding:10px; border:1px solid #ccc; margin-right:20px;" src="<%=basePath %>${f.foodImg }">
                        						<h2 style="padding:8px"><span style="color:#ba7ae3">${f.foodName }</span><span style="padding-left:20px">${f.foodPrice }元/份</span></h2>
                        						<p style="padding-top:20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${f.foodMessage }</p>
                        					</div>
                        				</c:forEach>
                        				<h2 style="padding-left:80px">...&nbsp;&nbsp;...</h2>
                        			</div>
                        		</div>
                        	</div>
                        	<hr color="#e3e3e3">
                        	
                        	<!-- 评论模块 -->
                        	<div style="width:1100px; height:1020px; margin:25px 0; margin-left:3px; ">
                        		<h2 style="padding:8px; color:#652c89;">游客评论</h2>
                        		<img style="width:1080px" src="<%=basePath %>upload/imgh/hotel/plplplplplplpWD.jpg">
                        	</div>
                     	</div>
                    </div>
                </div>
                <div class="person_btn">
                </div>
            </div>
        </div>
    </div>

   <div class="index_footer">
        <div class="footer_list">
            <em id="fenxiang_btn">
                <div class="bdsharebuttonbox"><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
				<script>window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "16" }, "share": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
				</em>
		            <p>深圳办公地址：深圳市福田中心区福华五路卓越世纪中心3号楼B座818  <span>咨询电话：0755-82029695；0755-82934944</span> <span style="display:none;">商务合作咨询电话：0755-12345678</span>
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
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
		function foods(cateId){
			$.post(
				"<%=basePath %>other/toCateFoodsByCid",
				{"cateId":cateId},
				function(obj){
					$("#food").empty();

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
				    
					for(var i=0; i<obj.length; i++){
						$("#food").append("<div style='height:180px'><img style='width:200px; float:left; padding:10px; border:1px solid #ccc; margin-right:20px;' src="+basePathscript+""+obj[i].foodImg+"><h2 style='padding:8px'><span style='color:#ba7ae3'>"+obj[i].foodName+"</span><span style='padding-left:20px'>"+obj[i].foodPrice+"元/份</span></h2><p style='padding-top:20px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+obj[i].foodMessage+"</p></div>");
					}
					$("#food").append("<h2 style='padding-left:80px'>...&nbsp;&nbsp;...</h2>");
				},
				"json"
			)
		}
	</script>
	
<script type="text/javascript">
    $(function () {
        $("#cur_3").addClass("cur");
    });
</script>
</html>

