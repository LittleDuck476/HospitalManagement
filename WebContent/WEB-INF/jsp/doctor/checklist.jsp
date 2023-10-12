<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<title>开检查单</title>
<script type="text/javascript">
	var msg = "${msg}";
	if(msg!=''){
    alert(msg);
	}
	function test(x) {
    var select = document.getElementById("project");
    var value = select.value;
    window.location.href="d_insertchtable?pid="+x+"&project="+value;
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
			<select id="project" style="float: right;margin-right: 400px;" >
			<option value="0">--请选择--</option>
			<c:forEach items="${projecttypeList}" var="type">
				<option value="${type.id}">${type.name}</option>
			</c:forEach>
		</select>
			<form action="search" method="post" style="float: left;">
				<input type="text" name="mykey" placeholder="请输入患者姓名或电话"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
		</div>
		
		<table class="bordered" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>姓名</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>

			<c:forEach items="${registrationList}" var="patient">
				<tr>
					<td>${patient.pname}</td>
					<td>${patient.ptel}</td>
					<td><input type="submit" value="开检查化验单"
						onclick="test(${patient.pid})" class="button" style="width: 80px;font-size: 8px;"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>