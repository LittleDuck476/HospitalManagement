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
<title>医务人员管理</title>
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
			<a href="a_toaddw"
				style="float: left; margin-left: 20px; width: 60px; height: 25px; padding-top: 5px;"
				class="button">添加</a>
			<form action="search" method="post" style="float: right;">
				<input type="text" name="mykey" placeholder="请输入员工代号"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
			<form action="a_seerole" method="post"
				style="margin-left: 300px;">
				<select name="role" id="role">
					<option value="0">--请选择--</option>
					<option value="1">管理员</option>
					<option value="4">挂号处</option>
					<option value="5">检查化验处</option>
					<option value="6">药房处</option>
				</select> <input type="submit" value="确定" class="button"
					style="background-color: #5191e1;" />
			</form>
		</div>

		<table class="bordered" cellspacing="0" border="0" style="margin-top: 0;">
			<thead>
				<tr>
					<th>员工代号</th>
					<th>密码</th>
					<th>部门</th>
					<th colspan="2">操作</th>
				</tr>
			</thead>

			<c:forEach items="${workerList}" var="worker">
				<tr>
					<td>${worker.username}</td>
					<td>${worker.password}</td>
					<td><c:if test="${worker.role==1}">管理员</c:if> <c:if
							test="${worker.role==4}">挂号处</c:if> <c:if
							test="${worker.role==5}">检查化验处</c:if> <c:if
							test="${worker.role==6}">药房处</c:if></td>
					<td><a href="a_updwById?id=${worker.id}" class="button">修改</a></td>
					<td><a href="a_delwById?id=${worker.id}" class="button"
						style="background-color: #ff4d4d" onclick="return del();">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>