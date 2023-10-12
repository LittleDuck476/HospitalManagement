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
<title>修改病患信息</title>
<script type="text/javascript">
	var msg = "${msg}";
	if (msg != '') {
		alert(msg);
	}
	function isNull{
		
	}
</script>
<style type="text/css">
	input,select{
		width:85px;
	}
	.button {
		background-color: #4CAF50;
	}
</style>
</head>
<body>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
		<form action="a_upddoctor" method="post">
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
				<tr>
					<input type="hidden" name="id" value="${doctor.id}">
					<td><input type="text" name="username"
						value="${doctor.username}"></td>
					<td><input type="text" name="name" value="${doctor.name}"></td>
					<td><input type="text" name="password"
						value="${doctor.password}"></td>
					<td><input type="text" name="room" value="${doctor.room}"></td>
					<td><select name="type">
							<option value="${doctor.type}"><c:if
									test="${doctor.type==1}">普通门诊</c:if>
								<c:if test="${doctor.type==2}">专家门诊</c:if></option>
							<option value="1">普通门诊</option>
							<option value="2">专家门诊</option>
					</select></td>
					<td><input type="text" name="price" value="${doctor.price}"></td>
					<td><select name="active">
							<option value="${doctor.active}"><c:if
									test="${doctor.active==1}">正常</c:if>
								<c:if test="${doctor.active==-1}">被删除</c:if></option>
							<option value="1">正常</option>
							<option value="-1">删除</option>
					</select></td>
					<td><input type="submit" value="修改" class="button"
						onclick="isNull()"/></td>
					<td><input type="button" value="返回" class="button" style="background-color: #5191e1"
						onclick="window.history.go(-1)" /></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>