<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>走呗后台登陆页面</title>
<%@ include file="/styles/laster/common/laster_common_css.jsp" %>
</head>
<body class="login-layout blur-login" style="background:#262e3b">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1 style="padding-top:40%">
								<span class="white">'走呗'&nbsp;-&nbsp;旅游系统后台管理</span>
							</h1>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i>
											请选择登录身份
										</h4>

										<div class="space-6"></div>
											
										<form>
											<div class="clearfix">
												<label class="inline">
													<input type="checkbox" name="statusId" value="2"/>
													<span class="lbl">景点管理者</span>
												</label>
												&nbsp;
												<label class="inline">
													<input type="checkbox" name="statusId" value="3"/>
													<span class="lbl">酒店管理者</span>
												</label>
												&nbsp;
												<label class="inline">
													<input type="checkbox" name="statusId" value="4"/>
													<span class="lbl">美食管理者</span>
												</label>
											</div>
											
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" class="form-control" name="username" id="username"  placeholder="用户名" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" name="password" id="password" placeholder="密码" />
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline">
														<input type="checkbox" id="remember" />
														<span class="lbl"> 记住我！</span>
													</label>

													<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="lastlogin()">
														<i class="ace-icon fa fa-key"></i>
														<span class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div><!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box" class="forgot-password-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												超级管理员登录
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box" class="user-signup-link">
												商家注册
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.login-box -->

							<!-- 超管登录 -->
							<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												超级管理员登录
											</h4>

											<div class="space-6"></div>
											<p>
												请您输入正确的信息
											</p>

											<form>
												<div class="clearfix">
													<label class="inline">
														<input type="hidden" class="ace" checked="checked" name="statusmId" value="1"/>
														<span class="lbl"></span>
													</label>
												</div>
													<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" name="smusername"  placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
	
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" name="smpassword" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
	
													<div class="space"></div>
	
													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" disabled="disabled" />
															<span class="lbl">不让记住！</span>
														</label>
	
														<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="lastsmlogin()">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">登录</span>
														</button>
													</div>
	
													<div class="space-4"></div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												返回登录
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i>
											新商家注册
										</h4>

										<div class="space-6"></div>
										<p> 输入详细信息: </p>

										<form>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" class="form-control" placeholder="用户名" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" placeholder="密码" />
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" placeholder="确认密码" />
														<i class="ace-icon fa fa-retweet"></i>
													</span>
												</label>

												<label class="block">
													<input type="checkbox" class="ace" />
													<span class="lbl">
														我接受
														<a href="#">用户协议</a>
													</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i>
														<span class="bigger-110">重置</span>
													</button>

													<button type="button" class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">注册</span>

														<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box" class="back-to-login-link">
											<i class="ace-icon fa fa-arrow-left"></i>
											返回登录
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.signup-box -->
						</div><!-- /.position-relative -->

					</div>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.main-content -->
	</div>
	
</body>
<jsp:include page="/styles/laster/common/laster_common_js.jsp"></jsp:include>

<script type="text/javascript">
	jQuery(function($) {
	 $(document).on('click', '.toolbar a[data-target]', function(e) {
		e.preventDefault();
		var target = $(this).data('target');
		$('.widget-box.visible').removeClass('visible');//hide others
		$(target).addClass('visible');//show target
	 });
	});
	
	
	<!-- cookie记住账号密码 -->
		//得到Cookie
		// name：username、password
		function getCookie(name) {
			// 浏览器username=admin; password=admin
		    var strCookie=document.cookie;
		    // 数组
		    // [0]  username=admin
		    // [1]  password=admin
		    var arrCookie=strCookie.split("; ");
		    
		    for(var i=0;i<arrCookie.length;i++) {
		    	// username=admin
		        var arr=arrCookie[i].split("=");
		    	// arr[0]=username
		        if(arr[0]==name)
		        	// arr[1]=admin
		            return arr[1];
		    }
		    return "";
		}

		// 设置Cookie
		// name:username,value:admin
		// name:password,value:admin
		function setCookie(name,value) {
		    var Days = 30;
		    var exp = new Date();
		    // 时间戳  exp.getTime()    ：           1970-1-1  至今的时间  毫秒数
		    // 设置有效时间
		    exp.setTime(exp.getTime() + Days*24*60*60*1000);
		    // username=admin;
		    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
		}

		// 加载页面  
		$(function() {
			var usernameStr = "username";
		    var passwordStr = "password";
		    
			// 判断cookie是否存在用户名密码
		    if((getCookie(usernameStr)!=null&&getCookie(usernameStr)!="")&&getCookie(passwordStr)!=null&&getCookie(passwordStr)!=""){
		    	$("#remember").attr("checked","checked");
		        $("#username").val(getCookie(usernameStr));
		        $("#password").val(getCookie(passwordStr));
		    }
			
			 // 加载页面，给复选框一个点击事件
		    $("#remember").click(function(){
		        var ischeck=$(this).is(":checked"); 
		        var loginVal = "";
		        var passwordVal = "";
		        // 判断是否选中
		        if(ischeck){
		            loginVal = $("#username").val();
		            passwordVal = $("#password").val();
		        }
		        // 设置cookie
		        setCookie(usernameStr,loginVal);
		        setCookie(passwordStr,passwordVal);
		    });
		});
		
		
	// 公共登录样式
	function loginStyle(nickname, password, statusId){
		//alert(nickname+"----"+password+"----"+statusId);
		$.post(
			"<%=basePath %>lastlogin/login",
			{
				"nickname":nickname,
				"password":password,
				"statusId":statusId
			},
			function(obj){
				// '1'代表登录成功   否则失败 
				if('1' == obj){
					alert("登陆成功！");
					if(statusId == '1'){
						location.href = "<%=basePath %>lastlogin/toSmLastIndex";
					}else{
						location.href = "<%=basePath %>lastlogin/toSmLastIndex";
					}
					}else{
					alert("登陆失败！请核查登录身份！");
				}
			},
			"text"
		);
	}
		
	
	// 超管登录
	function lastsmlogin(){
		var statusId = "1";
		var nickname = $("[name='smusername']").val();
		var password = $("[name='smpassword']").val();
		loginStyle(nickname, password, statusId);
		
	}
	
	//商家后台登录模块
	function lastlogin(){
		//获取相应的管理权限id
		var statusId = $("[name='statusId']:checked").map(
							function(){
								return this.value;
							}
						).get().join();
		if(statusId.length == 1){
			var nickname = $("[name='username']").val();
			var password = $("[name='password']").val();
			loginStyle(nickname, password, statusId);
		}else{
			alert("请核查登录身份！");
		}
	}	
	
	
	

</script>	
</html>