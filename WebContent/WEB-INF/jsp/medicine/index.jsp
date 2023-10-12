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
<title>处方药发放</title>
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
			<span class="user">这里是：<br>药房处
			</span>
		</div>
	</div>
		<div style="margin-top: 70px;">
			<form action="search" method="post" align="center">
				<input type="text" name="mykey" placeholder="请输入病患姓名或电话"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
		</div>
		<table class="bordered" cellspacing="0" border="0"
			style="margin-top: 5px;">
			<thead>
				<tr>
					<th>病患姓名</th>
					<th>病患电话</th>
					<th>医生姓名</th>
					<th>科室</th>
					<th>药品名</th>
					<th>发放数量</th>
					<th>库存</th>
					<th>发放结果</th>
					<th>操作</th>
				</tr>
			</thead>

			<c:forEach items="${paidpreList}" var="paidpre">
				<tr>
					<td>${paidpre.pname}</td>
					<td>${paidpre.ptel}</td>
					<td>${paidpre.dname}</td>
					<td>${paidpre.droom}</td>
					<td>${paidpre.medname}</td>
					<td>${paidpre.amount}</td>
					<td>${paidpre.store}</td>
					<td><c:if test="${paidpre.outcome==-1}">未发放</c:if> <c:if
							test="${paidpre.outcome==1}">已发放</c:if></td>
					<td><c:if test="${paidpre.outcome==-1}">
							<a
								href="m_giveout?id=${paidpre.id}&medid=${paidpre.medid}&amount=${paidpre.amount}"
								class="button">发放</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>