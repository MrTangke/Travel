<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 类库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta charset="utf-8">

<!-- 公共资源CSS  -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/webcss/global.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/webcss/layout.css" />

<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/before/css/animate.min.css" />

<!-- 余晓明的前台css -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="mobile-agent" content="format=html5;url=//m.mxtrip.cn/poi/kWZ4gFXUgUg/">

<link href="<%=basePath %>styles/before/css/vendor.min.css" type="text/css" rel="stylesheet">
<link href="<%=basePath %>styles/before/css/poi.min.css" type="text/css" rel="stylesheet">




