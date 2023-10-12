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
<jsp:include page="nav.jsp"></jsp:include>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
		<table class="bordered" cellspacing="0" border="0"
			style="margin-top: 65px;">
			<thead>
				<tr>
					<th>病患姓名</th>
					<th>病患电话</th>
					<th>医生姓名</th>
					<th>科室</th>
					<th>病情诊断</th>
					<th>医嘱</th>
				</tr>
			</thead>

			<c:forEach items="${diseaseList}" var="danda">
				<tr>
					<td>${danda.pname}</td>
					<td>${danda.ptel}</td>
					<td>${danda.dname}</td>
					<td>${danda.droom}</td>
					<td>${danda.disease}</td>
					<td>${danda.advice}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>