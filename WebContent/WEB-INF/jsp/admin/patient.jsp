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
<title>病患管理</title>
<script type="text/javascript">
	var msg = "${msg}";
	if (msg != '') {
		alert(msg);
	}
	function del() {
		var msg = "您真的确定要删除吗？";
		if (confirm(msg) == true)
			return true;
		else
			return false;
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
		<div style="margin-top: 70px;">
			<a href="a_toaddp"
				style="float: left; margin-left: 20px; width: 60px; height: 25px; padding-top: 5px;"
				class="button">添加</a>
			<form action="search" method="post"
				style="float: right; margin-right: 400px;">
				<input type="text" name="mykey" placeholder="请输入患者姓名或电话"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
		</div>

		<table class="bordered" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>病患姓名</th>
					<th>病患密码</th>
					<th>病患电话</th>
					<th>状态</th>
					<th colspan="2">操作</th>
				</tr>
			</thead>

			<c:forEach items="${patientList}" var="patient">
				<tr>
					<td>${patient.username}</td>
					<td>${patient.password}</td>
					<td>${patient.tel}</td>
					<td><c:if test="${patient.active==1}">正常</c:if> <c:if
							test="${patient.active==-1}">被删除</c:if></td>
					<td><a href="a_updpById?id=${patient.id}" class="button">修改</a></td>
					<td><a href="a_delpById?id=${patient.id}" class="button" style="background-color: #ff4d4d"
						onclick="return del();">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>