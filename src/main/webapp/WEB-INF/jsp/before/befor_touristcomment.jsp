<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付详情</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Smart Error Page Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<%=basePath%>styles/before/css/styles.css" rel="stylesheet" type="text/css" media="all">
<link href="//fonts.googleapis.com/css?family=Ropa+Sans:400,400i&amp;subset=latin-ext" rel="stylesheet">
</head>
<body style="background: url(<%=basePath%>styles/insurance/images/Tree.jpg">
	<div class="header" style="border:none">
	<h1>用           户            评           论</h1>
</div>
<div class="w3-main">
	<div class="agile-info">
		<center>
		 
				<div id="comment">
				<form action="" method="post">
				<table>
				<tr>
					<th>用户评论：</th>
					<td>
					<input type="hidden" name="touristId" id="touristId" value="${sessionScope.tourist.touristId}">
					<input type="hidden" name="orderId" id="orderId" value="${orderId}"/>
					<textarea cols="" rows="" id="appraiseContent" name="appraiseContent" class="textarea" placeholder="个人评论...300个字符以内" dragonfly="true" style="width:250px;border:1px solid #d5d5d5"></textarea></td>
				</tr>
				<tr >
					<th>评论等级：</th>
					<td>
						<select style="margin-top: 20px" class="select" id="levelId" name="levelId" style="width:250px;">
								<option>-请选择-</option>
								<c:forEach begin="1" end="5" var="s">
									<option value="${s}">${s}星</option>
								</c:forEach>
					    </select>
					</td>
				</tr>
				<tr >
					<td colspan="10">
						<input style="margin-top: 20px" type="button" onclick="tijiao()" class="btn btn-primary btn-lg btn-block" value="提交评论"/>
						<input style="margin-top: 20px" type="button" onclick="history.go(-1)" class="btn btn-primary btn-lg btn-block" value="返回上一级"/>
					</td>
				</tr>
				</table>
				</form>
		  
		</center>
	</div>
</div>
<div class="footer-w3l">
	<p style="color:#9400D3;">&copy; 2018   走呗    订单      评论  . 用户    用心    去旅行       |   享受生活      每一天 <a style="color:#9932CC;font-weight: bold;" href="http://w3layouts.com">由  Y x m 设计制作</a></p>
</div>
</body>
<script type="text/javascript" src="<%=basePath%>styles/before/Js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
	function tijiao(){
		var touristId = $("#touristId").val();
		var orderId = $("#orderId").val();
		var appraiseContent = $("#appraiseContent").val();
		var levelId = $("#levelId").val();
		$.post(
			"<%=basePath %>tourist/insertTouristAppraise",
			{"orderId":orderId,"appraiseContent":appraiseContent,"levelId":levelId},
			function(msg){
				if(msg>0){
			     	layer.msg('评论成功，感谢您的评论!',{icon:1,time:1000});
			     	location.href= "<%=basePath%>tourist/selectTouristAppraise?touristId="+touristId ;
				}else{
					layer.msg('error!',{icon:1,time:1000});
				}
			},
			"json"
		)
	}
</script>
</html>