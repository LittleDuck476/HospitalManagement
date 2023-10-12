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
	href="${pageContext.request.contextPath}/css/table.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改项目信息</title>
<script type="text/javascript">
	var msg = "${msg}";
	if (msg != '') {
		alert(msg);
	}
</script>
</head>
<style>
.button {
		background-color: #4CAF50;
	}
</style>
<body>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
	<form action="a_updproject" method="post">
		<table class="bordered" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>项目名称</th>
					<th>项目价格</th>
					<th colspan="2">操作</th>
				</tr>
			</thead>
			<tr>
					<input type="hidden" name="id" value="${project.id}">
				<td><input type="text" name="name"
					value="${project.name}"></td>
				<td><input type="text" name="price"
					value="${project.price}"></td>
				<td><input type="submit" value="修改" class="button"/></td>
				<td><input type="button" value="返回" class="button" style="background-color: #5191e1" onclick="window.history.go(-1)" /></td>
			</tr>
		</table>
	</form>
	</div>
	
</body>
</html>