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
<title>挂号</title>
</head>
<script type="text/javascript">
    var msg = "${msg}";
    if(msg!=''){
        alert(msg);
    }
</script>
<style>
.button {
	background-color: #4CAF50;
}
</style>
<body>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
		<div style="margin-top: 70px;">
			<form action="showtype" method="post"
				style="float: right; margin-right: 400px;">
				<select name="type">
					<option value="0">--门诊类型--</option>
					<option value="1">普通门诊</option>
					<option value="2">专家门诊</option>
				</select> <input type="submit" class="button" value="查询"
					style="background-color: #5191e1" />
			</form>
			<form action="search" method="post" style="float: left;">
				<input type="text" name="mykey" placeholder="请输入医生姓名或科室"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
		</div>

		<table class="bordered" cellspacing="0" border="0"
			style="margin-top: 100px;">
			<thead>
				<tr>
					<th>员工编号</th>
					<th>科室</th>
					<th>门诊类型</th>
					<th>姓名</th>
					<th>挂号费</th>
					<th>操作</th>
				</tr>
			</thead>

			<c:forEach items="${doctorList}" var="doctor">
				<tr>
					<td>${doctor.username}</td>
					<td>${doctor.room}</td>
					<td><c:if test="${doctor.type==1}">普通门诊</c:if> <c:if
							test="${doctor.type==2}">专家门诊</c:if></td>
					<td>${doctor.name}</td>
					<td>${doctor.price}</td>
					<td><a href="checkdoctor?id=${doctor.id}" class="button">确定</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>