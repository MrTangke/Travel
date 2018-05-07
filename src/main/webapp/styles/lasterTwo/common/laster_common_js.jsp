<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePathJs = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--后台登陆js-->
<script src="<%=basePathJs%>styles/lasterTwo/js/jquery-1.9.1.min.js"></script>  
<script src="<%=basePathJs%>styles/lasterTwo/assets/js/ace-extra.min.js"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/js/bootstrap.min.js"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/js/ace-elements.min.js"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/js/ace.min.js"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/laydate/laydate.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/js/jquery.nicescroll.js" type="text/javascript"></script>

<script type="text/javascript">
	window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>
<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='<%=basePathJs%>lasterTwo/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
</script>

<script src="<%=basePathJs%>styles/lasterTwo/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/js/echarts.js" type="text/javascript"></script> 

<script src="<%=basePathJs%>styles/lasterTwo/assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/assets/js/jquery.dataTables.bootstrap.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/js/H-ui.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/js/H-ui.admin.js" type="text/javascript"></script>
<script src="<%=basePathJs%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>



