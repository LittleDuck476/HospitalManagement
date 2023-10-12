<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="nav.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css" />
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>挂号</title>
</head>
<style>
.button {
	background-color: #4CAF50;
}
</style>
<body>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
		<div style="margin-top: 70px;">
			<form action="search" method="post" align="left">
				<input type="text" name="mykey" placeholder="请输入病患姓名或电话"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
		</div>
		<table class="bordered" cellspacing="0" border="0" style="margin-top: 10px;">
			<thead>
				<tr>
					<th>姓名</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>

			<c:forEach items="${patientList}" var="patient">
				<tr>
					<td>${patient.username}</td>
					<td>${patient.tel}</td>
					<td><a href="checkpatient?id=${patient.id}" class="button">挂号</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>