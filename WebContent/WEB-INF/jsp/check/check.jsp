<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>检查化验处</title>
</head>
<style>
.button {
	background-color: #4CAF50;
}
</style>
<body>
	<div class="page-topbar">
		<div class="logo-area">
			<span class="logo">社区医院管理系统</span>
		</div>
		<div class="pull-right">
			<span class="user">这里是：<br>检查化验处
			</span>
		</div>
	</div>
	<div style="margin-top: 70px;">
		<form action="c_checkpro" method="post"
			style="float: right; margin-right: 500px;">
			<select name="project" id="project">
				<option value="0">--请选择--</option>
				<c:forEach items="${projecttypeList}" var="type">
					<option value="${type.id}">${type.name}</option>
				</c:forEach>
			</select> <input type="submit" value="确定" class="button"
				style="background-color: #5191e1;" />
		</form>
		<form action="search" method="post"
			style="float: left; margin-left: 50px;">
			<input type="text" name="mykey" placeholder="请输入病患姓名或电话"> <input
				type="submit" value="搜索" class="button"
				style="background-color: #5191e1" />
		</form>
	</div>

	<table class="bordered" cellspacing="0" border="0">
		<thead>
			<tr>
				<th>病患姓名</th>
				<th>病患电话</th>
				<th>医生姓名</th>
				<th>科室</th>
				<th>项目名</th>
				<th>检查化验结果</th>
				<th>操作</th>
			</tr>
		</thead>

		<c:forEach items="${paidproList}" var="paidpro">
			<tr>
				<td>${paidpro.pname}</td>
				<td>${paidpro.ptel}</td>
				<td>${paidpro.dname}</td>
				<td>${paidpro.droom}</td>
				<td>${paidpro.proname}</td>
				<td><c:if test="${paidpro.outcome==-1}">未出结果</c:if> <c:if
						test="${paidpro.outcome==1}">已出结果</c:if></td>
				<td><a href="c_printoutcome?id=${paidpro.id}" class="button"
					style="width: 60px; font-size: 13px">打印结果</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>