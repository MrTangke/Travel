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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 后台登陆css -->
<link rel="stylesheet" href="<%=basePath %>styles/lasterTwo/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath %>styles/lasterTwo/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath %>styles/lasterTwo/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath %>styles/lasterTwo/assets/css/ace-ie.min.css" />
<link rel="stylesheet" href="<%=basePath %>styles/lasterTwo/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath %>styles/lasterTwo/css/style.css"/>
<link rel="stylesheet" href="<%=basePath %>styles/lasterTwo/css/codemirror.css"/>


