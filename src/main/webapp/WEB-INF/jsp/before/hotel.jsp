<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>酒店服务</title>
    <%@ include file="/styles/before/common/before_common_css.jsp" %>
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
            <li id="cur_3" class="fir_li cur"><a href="<%=basePath %>other/toHotel">酒店公寓</a></li>
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
        <div class="ny_con ny_person_con">
            <div class="person_con">
                <div class="person_top">
                </div>
                <div class="person_center">
                    <div class="person_win">
                        <div class="person_bt">
                            <span><em>只挑选最舒适的休憩场所</em><img src="<%=basePath %>styles/before/webimages/index_93.png" /></span>
                            <h3>住宿服务</h3>
                        </div>
                        <div>
                        	<p style="padding-bottom:20px; padding-left:16px">在尽享所有舒适现代设施和范围广泛的服务的同时得到休息……而且这一切都发生在一个优雅、别致、非常巴黎风情的氛围之中。</p>
                        	<center><img alt="" src="<%=basePath %>upload/imgh/hotel/RHOJNKZOAB0561.png" style="width:96%; padding-right:10px; padding-bottom:30px"></center>
                        	<div style="width:1000px; height:1060px; border:2px solid #000; margin:10px 0; margin-left:53px;"> 
                        		<!-- 进行与后台测试，显现酒店详情 -->
                        		<center><h1 style="padding:20px; padding-top:30px; color:#652c89; font-weight:bold">请选择</h1></center>
                        		
                        		<form id="form" method="post" style="padding-left:30px">
			                        <div class="person_list">
			                        	
				                        <div style="height:10px"></div>
			                        	<dl class="clearfix">
			                                <dt style="padding:10px 0; font-weight:bold; color:#652c89;">联系人信息</dt>
			                                <dd style="width:920px;">
			                                    <h3>联系人</h3>
			                                    <p>
			                                        <input id="dzname" name="touristRealname" type="text" class="per_txt2" value="${sessionScope.tourist.touristRealname }" />
			                                        <span style="color:red">*&nbsp;&nbsp;请确认真实姓名与手机号。</span>
			                                    </p>
			                                    <h3>手机号码</h3>
			                                    <p>
			                                        <input id="dzphone" name="touristPhone" type="text" class="per_txt2" value="${sessionScope.tourist.touristPhone }"  /></p>
			                                       
			                                        <input name="touristId" type="hidden" value="${sessionScope.tourist.touristId }" />
			                                   </p>
			                                </dd>
			                            </dl>
				                        <div style="height:28px"></div>
			                            <dl class="clearfix">
			                              <dt style="padding:10px 0; font-weight:bold; color:#652c89;">请选择酒店</dt>
			                                <dd style="width:920px;">
			                                    <h3>选择所在城市</h3>
			                                    <p>
			                                    	<select class="per_txt2" name="areapid" id="shiName" onchange="changeShi()" style="border:none" >
			                                    		<option>-请选择城市-</option>
			                        					<c:forEach items="${listArea }" var="a">
				                        					<option value="${a.areaId }">${a.areaName }</option>
			                        					</c:forEach>
			                                    	</select>
			                                   	</p>
			                                    <h3>选择所在区</h3>
			                                    <p>
			                                    	<select class="per_txt2" name="areaId" onchange="changeQu()" style="border:none" >
			                                    		<option value="">-请选择区-</option>
			                                    	</select>
			                                   	</p>
			                                   	<h3>选择酒店类型</h3>
			                                    <p>
		                                    		<c:forEach items="${listType }" var="t">
		                                    			<label> <input onchange="changeQu()"  type="radio"<c:if test="${t.typeiId == '1'}">checked='checked'</c:if> name="ticket" value="${t.typeiId }" />&nbsp;${t.typeName }</label>
		                        					</c:forEach>
			                                   	</p>
			                                    <h3>选择预约酒店</h3>
			                                    <p>
			                                    	<select class="per_txt2" id="hotel" name="hotelId" style="border:none" >
			                                    		<option>-请选择酒店-</option>
			                                    	</select>
			                                   	</p>
			                                    <h3>选择预约时间</h3>
			                                    <p>
			                                    	<input name="thrDateStr" onfocus="WdatePicker()" type="text" class="per_txt2" />
			                                   	</p>
			                                    <h3>预定房间数</h3>
			                                    <p>
			                                        <input name="thrNum" type="text" class="per_txt2" />
			                                    </p>
			                                    <h3>住宿其他要求</h3>
			                                    <p class="cur">
			                                    	<textarea id="qita" name="thrOther" cols="" rows="" class="per_area"></textarea>
			                                    </p>
			                                </dd>
			                            </dl>
			                            <dl class="cur">
			                                <dt>&nbsp;</dt>
			                                <dd style="width:930px;" >
			                                    <input name="" onclick="dingzhi()" type="button" class="per_btn" style="margin-left:16%" value="定制" />
			                                </dd>
			                            </dl>
			                        </div>
		                        </form>
                        		
                        	</div>
                        	<center><img alt="" src="<%=basePath %>upload/imgh/hotel/RHOJNKZOAB0562.png" style="width:98%; padding-right:6px"></center>
                        	<center><img alt="" src="<%=basePath %>styles/before/webimages/sheshi.png" style="width:98%; padding-right:6px"></center>
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
<script type="text/javascript" src="<%=basePath %>styles/js/jquery-1.8.2.min.js"></script>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">

	// 根据市id选择区
	function changeShi(){
		var shiId = $("#shiName").val();
		$.post(
			"<%=basePath %>other/selectAreaByPid",
			{"pid":shiId},
			function(obj){
				if(obj != null){
					$("[name='areaId']").empty();
					$("[name='areaId']").append("<option>-请选择区-</option>");
					for(var i in obj){
						$("[name='areaId']").append("<option value="+obj[i].areaId+">"+obj[i].areaName+"</option>");
					}
				}
			},
			"json"
		)
	}
	// 根据区选择酒店
	function changeQu(){
		var quId = $("[name='areaId']").val();
		var typeId = $("[name='ticket']:checked").val();
		if(quId!=""){
			$.post(
					"<%=basePath %>other/selecthotelByAreaid",
					{"areaId":quId, "typeId":typeId},
					function(obj){
						if(obj != null){
							$("#hotel").empty();
							$("#hotel").append("<option>-请选择酒店-</option>");
							for(var i in obj){
								$("#hotel").append("<option value="+obj[i].hotelId+">"+obj[i].hotelHotelname+"</option>");
							}
						}
					},
					"json"
				)
		  }
	}
	
</script>

<script type="text/javascript">

	// 定制服务
	function dingzhi(){
		
		layer.msg('dingzhi!',{icon:1,time:1000});
		$.post(
			"<%=basePath %>other/insertTouristHotelOrder",
			$("#form").serialize(),
			function(obj) {
		    	if("1" == obj){
		    		layer.msg('定制成功，请前往我的订单请确认信息!',{icon:1,time:1000});
		    		location.href ="<%=basePath %>index/index";
		    		<%-- location.href ="<%=basePath %>个人中心/我的订单"; --%>
		    	}else{
		    		layer.msg('定制失败!',{icon:1,time:1000});
		    	}
		    },
		    "text"
		)
	}


    $(function () {
        $("#cur_3").addClass("cur");
    });
</script>
</html>

