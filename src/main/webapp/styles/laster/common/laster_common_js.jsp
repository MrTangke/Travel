<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePathJs = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--后台登陆js-->
<script src="<%=basePathJs%>styles/js/jquery-1.8.2.min.js"></script>
<script src="<%=basePathJs%>styles/laster/js/bootstrap.min.js"></script>
<script src="<%=basePathJs%>styles/laster/js/ace-extra.min.js"></script>

