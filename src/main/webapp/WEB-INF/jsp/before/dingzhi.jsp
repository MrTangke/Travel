<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>定制服务</title>
    <%@ include file="/styles/before/common/before_common_css.jsp" %>
  </head>
  
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
             <span><a
                href="javascript:void(0)">招聘信息</a></span>
        </div>
        <ul>
            <li class="fir_li" id="cur_1"><a href="<%=basePath %>index/index">首 页</a></li>
            <li id="cur_2"><a href="<%=basePath %>index/tuijian">旅游景点</a></li>
            <li id="cur_2"><a href="">酒店公寓</a></li>
            <li id="cur_4"><a href="">经典美食</a></li>
            
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
                            <span><em>只为打造最适合您的旅程</em><img src="<%=basePath %>styles/before/webimages/index_93.png" /></span>
                            <h3>定制服务</h3>
                        </div>
                        
                        <form id="f" action="<%=basePath %>other/insertOrder" method="post">
	                        <div class="person_list">
	                        	
		                        <div class="clearfix" style="padding:5px 20px 5px 5px; border:1px solid #ccc">
		                        	<img alt="" src="<%=basePath %>${listSceneImg[0].imgUrl }" style="width:501px; height:263px">
		                        	<div style="float:right; width:560px; height:266px"> 
		                        		<span style="color:#8957a1; font-size:40px; font-weight:bold; padding:20px 0 30px 0">${sceneBysid.sceneName }</span>
			                        	<br>
			                        	<span style="color:#e3e3e3">
			                        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                        		${sceneBysid.sceneContent }
			                        		<input type="hidden" name="sceneId" value="${sceneBysid.sceneId }" > 
			                        	</span>
		                        	</div>
		                        </div>
		                        <div style="height:10px"></div>
	                        	<dl class="clearfix">
	                                <dt>联系人信息</dt>
	                                <dd>
	                                    <h3>联系人</h3>
	                                    <p>
	                                        <input id="dzname" name="touristRealname" type="text" class="per_txt2" value="${sessionScope.tourist.touristRealname }" />
	                                        <span style="color:red">*&nbsp;&nbsp;请确认真实姓名与手机号。</span>
	                                    </p>
	                                    <h3>手机号码</h3>
	                                    <p>
	                                        <input id="dzphone" name="touristPhone" type="text" class="per_txt2" value="${sessionScope.tourist.touristPhone }"  /></p>
	                                       
	                                        <input name="touristId" type="hidden" value="${sessionScope.tourist.touristId }" /></p>
	                                </dd>
	                            </dl>
		                        <div style="height:28px"></div>
	                            <ul class="clearfix">
	                            	<li><span>前往目的地</span><input  type="text" name="orderGoaddress" class="per_txt" placeholder="填写城市" /></li>
	                                <li><span>出发日期</span><input name="goTime" onfocus="WdatePicker()" type="text" class="per_txt" /></li>
	                                <li><span>旅游天数</span><input name="orderdays" type="text" class="per_txt" placeholder="天" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}"></li>
	                                <li><span>出行人数</span><input name="orderNum" type="text" class="per_txt" placeholder="成人+儿童" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}">
	                            </ul>
	                            <dl class="clearfix">
	                                <dt>车 票 </dt>
	                                <dd>
	                                	 <label><input type="radio" name="ticket" value="灰机票" />&nbsp;灰机票</label>
	                                      <label> <input type="radio" name="ticket" value="火车票" />&nbsp;火车票</label>
	                                      <label> <input type="radio" name="ticket" value="汽车票" />&nbsp;汽车票</label>
	                                      <label> <input type="radio" name="ticket" value="自驾游" />&nbsp;自驾游</label>
	                                      <label> <input type="radio" name="ticket" value="11路" />&nbsp;11路</label>
	                                </dd>
	                            </dl> 
	                            <dl class="clearfix">
	                              <dt>住 宿</dt>
	                                <dd>
	                                    <h3>推荐酒店</h3>
	                                    <p>
	                                    	<select class="per_txt2" name="hotelId" style="border:none" >
	                                    		<option>-请选择酒店-</option>
	                                    		<c:forEach items="${listHotel }" var="h">
	                                    			<option value="${h.hotelId }">${h.hotelHotelname }</option>
	                                    		</c:forEach>
	                                    	</select>
	                                        <!-- <input name="zhusu1" type="text" class="per_txt2" /></p> -->
	                                    <h3>预定房间数</h3>
	                                    <p>
	                                        <input name="thrNum" type="text" class="per_txt2" /></p>
	                                    <h3>住宿其他要求</h3>
	                                    <p class="cur">
	                                        <textarea id="qita" name="thrOther" cols="" rows="" class="per_area"></textarea></p>
	                                </dd>
	                            </dl>
	                            <dl class="clearfix" >
	                                <dt>用餐要求</dt>
	                                <dd>
	                                    <p>
	                                        <input id="canyin" name="canyin" type="text" class="per_txt2" placeholder="用餐请到景点周边解决，有很多特色美味哟。" disabled="disabled" /></p>
	                                </dd>
	                            </dl>
	                            <dl class="clearfix">
	                                <dt>其 它</dt>
	                                <dd>
	                                    <p class="cur">
	                                        <textarea id="qita" name="orderOther" cols="" rows="" class="per_area"></textarea></p>
	                                </dd>
	                            </dl>
	                            <dl class="cur">
	                                <dt>&nbsp;</dt>
	                                <dd>
	                                    <!-- <input name="" type="submit" class="per_btn" value="定制" /> -->
	                                    <input name="" onclick="dingzhi()" type="button" class="per_btn" value="定制" />
	                                </dd>
	                            </dl>
	                        </div>
                        </form>
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

	// 定制服务
	function dingzhi(){
	
		$.ajax({
		    type:'post',
		    url:'<%=basePath %>other/insertOrder',
		    data:$("#f").serialize(),
		    success:function(obj) {
		    	if('1' == obj){
		    		layer.msg('定制成功，请前往我的订单请确认信息!',{icon:1,time:1000});
		    		location.href ="<%=basePath %>index/tuijian";
		    		<%-- location.href ="<%=basePath %>个人中心/我的订单"; --%>
		    	}else{
		    		layer.msg('定制失败!',{icon:1,time:1000});
		    	}
		    },
		    dataType:"json"
		});
	}

</script>
<script type="text/javascript">
    $(function () {
        $("#cur_3").addClass("cur");
    });
 
    
    
</script>
</html>

