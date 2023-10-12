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
<style>
.li {
	line-height: 13px;
	font-size:13px;
	height:90px;
}
</style>
<body>
	<div class="page-topbar">
		<div class="logo-area">
			<span class="logo">社区医院管理系统</span>
		</div>
		<div class="pull-right">
			<span class="user">这里是：<br>管理员处
			</span>
		</div>
	</div>
	<ul style="margin-top: 60px;">
		<li><a>人员管理</a>
			<ul style="margin-top: 63px;">
				<div class="li">
					<li><a href="a_patientm">病患管理</a></li>
					<li><a href="a_doctorm">医生管理</a></li>
					<li><a href="a_other">其他医务人员管理</a></li>
				</div>
			</ul></li>
		<li><a href="a_projectm">检查化验项目管理</a></li>
		<li><a href="a_medicinem">药品管理</a></li>
	</ul>
</body>
</html>