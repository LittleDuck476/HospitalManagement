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
<title>检查化验处</title>
</head>
<body>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
	<table class="bordered" cellspacing="0" border="0">
		<thead>
			<tr>
				<th>病患姓名</th>
				<th>病患电话</th>
				<th>医生姓名</th>
				<th>科室</th>
				<th>项目名</th>
				<th>检查化验结果</th>
			</tr>
		</thead>

		<c:forEach items="${doneproList}" var="donepro">
			<tr>
				<td>${donepro.pname}</td>
				<td>${donepro.ptel}</td>
				<td>${donepro.dname}</td>
				<td>${donepro.droom}</td>
				<td>${donepro.proname}</td>
				<td><c:if test="${donepro.outcome==-1}">未出结果</c:if> <c:if
						test="${donepro.outcome==1}">请前往自助终端机打印</c:if></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>