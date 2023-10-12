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
<title>医生管理</title>
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
			<a href="a_toaddd"
				style="float: left; margin-left: 20px; width: 60px; height: 25px; padding-top: 5px;"
				class="button">添加</a>
			<form action="search" method="post"
				style="float: right; margin-right: 400px;">
				<input type="text" name="mykey" placeholder="请输入医生姓名或科室"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
		</div>

		<table class="bordered" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>医生员工代号</th>
					<th>医生姓名</th>
					<th>医生密码</th>
					<th>科室</th>
					<th>门诊类型</th>
					<th>挂号费</th>
					<th>状态</th>
					<th colspan="2">操作</th>
				</tr>
			</thead>

			<c:forEach items="${doctorList}" var="doctor">
				<tr>
					<td>${doctor.username}</td>
					<td>${doctor.name}</td>
					<td>${doctor.password}</td>
					<td>${doctor.room}</td>
					<td><c:if test="${doctor.type==1}">普通门诊</c:if> <c:if
							test="${doctor.type==2}">专家门诊</c:if></td>
					<td>${doctor.price}</td>
					<td><c:if test="${doctor.active==1}">正常</c:if> <c:if
							test="${doctor.active==-1}">被删除</c:if></td>
					<td><a href="a_upddById?id=${doctor.id}" class="button">修改</a></td>
					<td><a href="a_deldById?id=${doctor.id}" class="button"
						style="background-color: #ff4d4d" onclick="return del();">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>