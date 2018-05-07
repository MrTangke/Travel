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
			<!-----------------我的头像---------------->
			<div id="set_box">
				<div class="title"><h2>我的头像</h2></div>
				<form action="" method="post" id="formSceneAdd"  style="margin-left:20%" enctype="multipart/form-data" >
		    	<input type="hidden" name="touristId" id="touristId" value="${sessionScope.tourist.touristId}">
				<div id="my_head">
					<%-- <div class="pic">
						<img src="<%=basePath%>${sessionScope.tourist.touristImage}"/>
						
					</div> --%>
				<div class="row cl">
					<div class="formControls col-xs-8 col-sm-9">
							<div class="row clearfix">
								<div class="col-md-12 column" >
								    <label class="form-label"><span class="c-red">*</span>原图片：</label>
									<img id="hotelLogo" src="<%=basePath%>${sessionScope.tourist.touristImage}"  class="round" style="width: 100px; height: 80px; margin-right: 20px" />
									<!-- 图片预览 -->
									<font style="margin-top: 20px">
										<label class="form-label"><span class="c-red">*</span>预览：</label>
										<img id="xmTanImg"  class="round" style="width: 100px; height: 80px;" />
									</font>
								</div>
								<div class="form-group" style="margin-top: 20px">
									<div class="formControls ">
										<input type="file" id="imgfile" name="imgfile" onchange="xmTanUploadImg(this)" accept="image/*" style="margin-left:80px;"/>
									</div>
									<div class="col-4"> <span class="Validform_checktip"></span></div>
								</div>
							</div>
						<div id="xmTanDiv"></div>
					</div>
				</div>
				</div>
				<div class="operation"><input type="button" id="submitId" class="save" value="修改头像" /></div>
				</form>
			</div>
		</div>	
	</div>
	<div class="clear"></div>
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
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">


 //选择图片，马上预览
function xmTanUploadImg(obj) {
	var file = obj.files[0];

	console.log(obj);
	console.log(file);
	console.log("file.size = " + file.size); //file.size 单位为byte

	var reader = new FileReader();
	//读取文件过程方法
			reader.onloadstart = function(e) {
				console.log("开始读取....");
			}
			
			reader.onprogress = function(e) {
				console.log("正在读取中....");
			}
			reader.onabort = function(e) {
				console.log("中断读取....");
			}
			reader.onerror = function(e) {
				console.log("读取异常....");
			}
	reader.onload = function(e) {
		console.log("成功读取....");

		var img = document.getElementById("xmTanImg");
		img.src = e.target.result;
		//或者 img.src = this.result;  //e.target == this
	}

	reader.readAsDataURL(file)
}
 
 //头像上传
$("#submitId").on("click",function () { 
	var touristId = $("#touristId").val();
    $.ajaxFileUpload({  
        url:'<%=basePath%>tourist/updateUplodTouristImg?touristId='+touristId, //你处理上传文件的服务端  
        secureuri:false,//是否启用安全机制  
        fileElementId:'imgfile',//file的id  
        dataType: 'application/json',//返回的类型  
        success: function (data) {//调用成功时怎么处理  
          if(data != 0){
        	  layer.msg('头像上传成功!',{icon:1,time:1000});
        	  location.href = "<%=basePath%>index/photo" ;
          } else{
        	  layer.msg('头像上传失败!',{icon:1,time:1000});
          }
        }  
    });  
});  
</script>


</html>