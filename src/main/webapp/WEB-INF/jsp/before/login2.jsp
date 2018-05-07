<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/webcss/global.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/webcss/layout.css" />

<script type="text/javascript" src="<%=basePath %>styles/before/webjs/jquery-1.8.3.min.js"></script> 

</head>
<body>
 <div class="index_body_login">
        <div class="index_top">
    <div class="top_logo">
        <h3>
            定制您的人生体验</h3>
        <a href="index.html">
            <img src="<%=basePath %>styles/before/webimages/index_02.png" width="117" height="121" alt="" /></a>
    </div>
    <div class="top_menu">
        <div class="login">
            <em style="display:none;">分享</em> <a href="<%=basePath %>login/login">登录</a>|<a href="<%=basePath %>login/register">注册</a> <span><a href="job.html">招聘信息</a></span>
        </div>
        <ul>
            <li id="cur_1"><a href="<%=basePath %>index/index">首 页</a></li>
            <li id="cur_2"><a href="<%=basePath %>index/tuijian">旅游景点</a></li>
            <li id="cur_3"><a href="dingzhi.html">酒店公寓</a></li>
            <li id="cur_4"><a href="yanxue.html">经典美食</a></li>
            <li id="cur_5"><a href="<%=basePath %>before/about">关于我们</a></li>
            <li id="cur_6"><a href="<%=basePath %>index/mycenter">个人中心 </a></li>
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

        <div class="ny_con login_paddding">
      	 <div class="login_con ">
         	<dl class="clearfix">
            <form id="fmSubmit" action="<%=basePath%>login/tologin" method="post" >
            	<dt>
                	<h3>走吧旅行</h3>
                    <span>To provide the most comfortable travel experience</span>
                    <h4>为　客　户　提　供　最　舒　适　的　旅　行　体　验</h4>
                </dt>
                <dd>
                	<ul>
                    
                    	<li>
                        	<span>用户名：</span><input name="touristNickname" id="txtName" type="text" class="login_txt" />
                        </li>
                        <li>
                        	<span>登录密码：</span><input name="touristPassword" id="txtPwd" type="password" class="login_txt" />
                        </li>
                        <li>
                        	<span>验证码 ：</span><input name="txtCode" id="txtCode" type="text" class="login_txt login_txt2" /><em><img src="<%=basePath %>styles/before/images/image.jsp" alt="点击获取验证码" title="点击获取验证码" height="33" id="huanyizhang" onclick="changeImage()"  /></em>
                            
                            <p><i id="huanyizhang" onclick="changeImage()"> <a href="javascript:changeImage();">换一张</a></i><a href="Retrieve.html">忘记密码？</a></p>
                        </li>
                        <li>
                        	<span>&nbsp;</span><input id="btn_Login" type="submit" class="login_btn" value="登 录" />&nbsp;&nbsp;&nbsp;<span style="color: red;font-size: 8px">${msg }</span>
                        </li>
                    </ul>
                    <div class="login_type"><em><a href="<%=basePath %>login/register">免费注册> </a></div>
                </dd>
                
                </form>
            </dl>
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
   </div> 
    <!-- #EndLibraryItem -->
    <script type="text/javascript" src="<%=basePath %>styles/before/webjs/zml.js"></script>
</body>
<script src="%=basePath %>styles/before/Js/Login.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
//验证码
function changeImage() {
	document.getElementById("huanyizhang").src="<%=basePath%>styles/before/images/image.jsp?t="+new Date();
}
</script>
</html>