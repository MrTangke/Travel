<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>
    <title></title>
  </head>
  <body>
  	 <jsp:include page="/styles/lasterTwo/common/laster_common_js.jsp"></jsp:include>
  	<script type="text/javascript">
	  	$(function(){
	  		// 父页面跳转
	  		window.parent.location.href = "<%=basePath%>${redirectUrl }";
	  		// 关闭
	  		closeLayer();
		});
	 	// 关闭窗口
		function closeLayer(){
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        parent.layer.close(index);
	        return true;
		}
	</script>
  </body>
</html>
