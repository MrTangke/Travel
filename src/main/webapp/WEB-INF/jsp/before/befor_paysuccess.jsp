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
<title>支付详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="10;url=http:" />  
<meta name="keywords" content="Smart Error Page Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=basePath%>styles/before/css/styles.css" rel="stylesheet" type="text/css" media="all">
<link href="//fonts.googleapis.com/css?family=Ropa+Sans:400,400i&amp;subset=latin-ext" rel="stylesheet">
</head>
<body style="background: url(<%=basePath%>styles/before/images/dahai.jpg">
	<div class="header">
	<h1>支          付            成           功</h1>
</div>
<div class="w3-main">
	<div class="agile-info">
		<center>
			<div class="container">  
				  <img alt="success" style="width: 200px;height: 200px;float: left;margin-left: 30px " src="<%=basePath%>upload/imgs/success.png">
		          <!-- BEGIN MAIN CONTENT -->  
		          <section class="error-wrapper">  
		              <h4 style="color:#00CD00; font-size: 20px">提示内容</h4>  
		              <h5 style="margin-top: 8px"><font color="#00CD00" style="font-size: 16px">${message}</font></h5> 
		              <p class="page-404">  
		                  <span style="color:#00CD00; ">页面自动</span>  
		                  <a href="<%=basePath%>index/orderfrom"  style="color:#7B68EE;background: none;width: 50px;">跳转</a>  
		                  <span style="color:#00CD00; ">等待时间：</span>  
		                  <span class="second" style="color:#7B68EE; ">10</span>  
		              </p>  
		          </section>  
		          <!-- END MAIN CONTENT -->  
		     </div> 
		</center>
	</div>
</div>
<div class="footer-w3l">
	<p style="color:#9400D3;">&copy; 2018   走呗    订单      支付  . 成功    用心    去旅行       |   享受生活      每一天 <a style="color:#9932CC;font-weight: bold;" href="http://w3layouts.com">由  Y x m 设计制作</a></p>
</div>
</body>
<script type="text/javascript" src="<%=basePath%>styles/before/Js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {  
    var wait = $(".second").html();  
    timeOut();  
    /**  
     * 实现倒计时  
     */  
    function timeOut() {  
        if(wait != 0) {  
            setTimeout(function() {  
                $('.second').text(--wait);  
                timeOut();  
            }, 1000);  
        }else{
        	location.href="<%=basePath%>index/orderfrom";
        }  
    }  
});
</script>
</html>