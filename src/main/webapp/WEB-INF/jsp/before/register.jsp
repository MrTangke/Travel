<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
   <%@ include file="/styles/before/common/before_common_css.jsp" %>
	<%@ include file="/styles/before/common/before_common_js.jsp" %>
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
            <li id="cur_6"><a href="lvji.html">精彩旅迹 </a></li>
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
            <div class="reg_con clearfix">
                <div class="reg_left">
                    <div class="reg_bt">
                        <span>用户注册</span><span style="display:none;">手机注册</span></div>
                    <!-- <div class="reg_list">
                        <ul>
                            <li><span>账  号：</span><input id="txtName" name="txtName" type="text"  class="login_txt addr" value="请输入您账号" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}">
                            </li>
                            <li><span>设置密码：</span><input id="txtpwd" name="txtpwd" type="password"  class="login_txt pwd" />
                            </li>
                            <li><span>确认密码：</span><input id="txtpwd2" name="txtpwd2" type="password" class="login_txt pwd2" />
                            </li>
                            <li><span>验证码 ：</span><input id="txtcode" name="txtcode" type="text" class="login_txt login_txt2 code" /><em><a href="javascript:;" class="send_email" yanzheng="0">发送验证码到邮箱</a><font style="display:none" id="fasongzhong">正在发送中</font></em>
                                <p>
                                    <label>
                                        <input type="checkbox" name="CheckboxGroup1" value="复选框" id="CheckboxGroup1"  checked="checked" />我已阅读<a
                                            href="#">《网站条款及隐私条款》</a></label>
                                </p>
                            </li>
                            <li><span>&nbsp;</span><input name="" type="button" id="btnEmail" class="login_btn" value="注 册" />
                            </li>
                        </ul>
                    </div> -->
                    <form method="post">
                    <div class="reg_list" style="display:none;">
                        <ul>
                            <li><span>用户账号 ：</span><input id="txtphone" name="touristNickname" class="addr login_txt" type="text" class="login_txt" value="输入用户名" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}">
                            </li>
                            <li><span>设置密码：</span><input id="txtppwd" name="touristPassword" class="pwd login_txt" name="" type="password" class="login_txt" />
                            </li>
                            <li><span>确认密码：</span><input id="txtppwd2" name="touristPassword2" class="pwd2 login_txt" name="" type="password" class="login_txt" />
                            </li>
                           <!--  <li><span>验证码 ：</span><input id="txtpcode" name="txtpcode" type="text" class="login_txt login_txt2 code" /><em><a href="javascript:;" class="send_tel">发送验证码到手机</a></em> -->
                                <p>
                                    <label>
                                        <input type="checkbox" name="CheckboxGroup1" value="复选框" id="CheckboxGroup0" checked="checked" />我已阅读<a
                                            href="#">《网站条款及隐私条款》</a></label>
                                </p>
                            </li>
                            <br>
                            <li><span>&nbsp;</span><input name="" type="button" id="btn" class="login_btn" value="注 册" />
                            </li>
                        </ul>
                    </div>
                    </form>
                </div>
                <div class="reg_right">
                    <h3>
                        已有账号，立即登录</h3>
                    <a href="<%=basePath %>login/login" class="reg_login">登 录</a>
                    <p>
                        如果您已经是叁色会员，即可通过注册用户名与密码进行登录，并请完善相关个人信息。</p>
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
    <script type="text/javascript" src="webjs/zml.js"></script>

    <div class="reg_tanchu">
    	<div class="tanchu_con">
        	<h3>《网站条款及隐私条款》<em></em></h3>
            
           <div class="tanchu_p">
          <p> 尊敬的用户，欢迎阅读本协议：</p>

<P>&nbsp;&nbsp;&nbsp;&nbsp;深圳走吧国际旅行社有限公司依据本协议的规定提供服务，本协议具有合同效力。您必须完全同意以下所有条款并完成个人资料的填写，才能保证享受到更好的走吧旅行客服服务。您使用服务的行为将视为对本协议的接受，并同意接受本协议各项条款的约束。

用户必须合法使用网络服务，不作非法用途，自觉维护本网站的声誉，遵守所有使用网络服务的网络协议、规定、程序和惯例。

为更好的为用户服务，用户应向本网站提供真实、准确的个人资料，个人资料如有变更，应立即修正。如因用户提供的个人资料不实或不准确，给用户自身造成任何性质的损失，均由用户自行承担。

尊重个人隐私是走吧旅行的责任，走吧旅行在未经用户授权时不得向第三方（走吧旅行控股或关联、运营合作单位除外）公开、编辑或透露用户个人资料的内容，但由于政府要求、法律政策需要等原因除外。在用户发送信息的过程中和本网站收到信息后，本网站将遵守行业通用的标准来保护用户的私人信息。但是任何通过因特网发送的信息或电子版本的存储方式都无法确保100%的安全性。因此，本网站会尽力使用商业上可接受的方式来保护用户的个人信息，但不对用户信息的安全作任何担保。

本网站有权在必要时修改服务条例，本网站的服务条例一旦发生变动，将会在本网站的重要页面上提示修改内容，用户如不同意新的修改内容，须立即停止使用本协议约定的服务，否则视为用户完全同意并接受新的修改内容。根据客观情况及经营方针的变化，本网站有中断或停止服务的权利，用户对此表示理解并完全认同。

本保密协议的解释权归走吧旅行所有。</P>

<p>深圳走吧国际旅行社有限公司 </p>

<p>2015年1月</p>
           </div>
        </div>
    </div>
</body>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
	$("#btn").click(function(){
		var id = $("#txtppwd").val();
		var id2 = $("#txtppwd2").val();
		var touristNickname = $("#txtphone").val();
		var touristPassword = $("#txtppwd").val();
		if(id != id2){
			layer.msg('密码输入不一致!',{icon:1,time:1000});
			return;
		}else{
			$.post("<%=basePath %>login/toRegister",{"touristNickname":touristNickname,"touristPassword":touristPassword},function(msg){
				if(msg ==1){
					location.href= "<%=basePath %>index/index";
				}
				
			},"json")
			
		}
	})
</script>

</html>