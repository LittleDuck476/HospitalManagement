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
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$('li').click(function() {
			$(this).toggleClass('light').siblings().removeClass('light');
		});
	});
</script>
</head>
<body>
	<div class="page-topbar">
		<div class="logo-area">
			<span class="logo">社区医院管理系统</span>
		</div>
		<div class="pull-right">
			<span class="user">欢迎您：<br>${duser.name}医生
			</span>
		</div>
	</div>
		<ul style="margin-top: 60px;">
			<li><a>诊断管理</a>
				<ul style="margin-top: 63px;">
					<li><a href="d_checklist">开检查单</a></li>
					<li><a href="d_disease">病情诊断/医嘱</a></li>
					<li><a href="d_prescription">开处方</a></li>
				</ul></li>
			<li><a href="d_checklistm">检查化验单管理</a></li>
			<li><a href="d_prescriptionm">处方管理</a></li>
		</ul>
</body>
</html>