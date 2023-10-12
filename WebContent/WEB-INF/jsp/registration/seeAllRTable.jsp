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
<title>挂号单查询</title>
</head>
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
					<th>患者姓名</th>
					<th>患者电话</th>
					<th>医生姓名</th>
					<th>科室</th>
					<th>门诊类型</th>
				</tr>
			</thead>

			<c:forEach items="${RTableList}" var="RTable">
				<tr>
					<td>${RTable.pname}</td>
					<td>${RTable.ptel}</td>
					<td>${RTable.dname}</td>
					<td>${RTable.droom}</td>
					<td><c:if test="${RTable.dtype==1}">普通门诊</c:if> <c:if
							test="${RTable.dtype==2}">专家门诊</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>