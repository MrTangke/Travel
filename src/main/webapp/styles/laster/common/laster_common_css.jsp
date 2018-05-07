<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 类库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 后台登陆meta -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="description" content="This is page-header (.page-header &gt; h1)" />
<meta name="description" content="Restyling jQuery UI Widgets and Elements" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- 后台登陆css -->
<link rel="stylesheet" href="<%=basePath%>styles/laster/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>styles/laster/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>styles/laster/css/ace-fonts.css" />
<link rel="stylesheet" href="<%=basePath%>styles/laster/css/ace.min.css" id="main-ace-style" />

