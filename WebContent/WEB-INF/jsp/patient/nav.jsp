<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css" />
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
	<div class="page-topbar">
		<div class="logo-area">
			<span class="logo">社区医院管理系统</span>
		</div>
		<div class="pull-right">
			<span class="user">欢迎您：<br>${puser.username}
			</span>
		</div>
	</div>
		<ul style="margin-top: 60px;">
			<li><a href="p_reg">查看挂号单</a></li>
			<li><a href="p_check">查看检查化验打印结果</a></li>
			<li><a href="p_disease">查看诊断结果/医嘱</a></li>
		</ul>
</body>
</html>