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
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开病情诊断/医嘱</title>
<script type="text/javascript">
	var msg = "${msg}";
	if(msg!=''){
    alert(msg);
	}
	
	function test(pid) {
    var disease = document.getElementById("disease").value;
    var advice = document.getElementById("advice").value;
    window.location.href="d_insertdistable?pid="+pid+"&disease="+disease+"&advice="+advice;
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
			<form action="search" method="post" align="center">
				<input type="text" name="mykey" placeholder="请输入病患姓名或电话"> <input
					type="submit" value="搜索" class="button"
					style="background-color: #5191e1" />
			</form>
		</div>
		<table class="bordered" cellspacing="0" border="0"
			style="margin-top: 5px;">
			<thead>
				<tr>
					<th>病情诊断</th>
					<th>医嘱</th>
				</tr>
			</thead>
			<tr>
				<td><textarea id="disease"></textarea></td>
				<td><textarea id="advice"></textarea></td>
			</tr>
		</table>
		<table class="bordered" cellspacing="0" border="0"
			style="margin-top: 5px;">
			<thead>
				<tr>
					<th>姓名</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<c:forEach items="${registrationList}" var="patient"
				varStatus="status">
				<tr>
					<td>${patient.pname}</td>
					<td>${patient.ptel}</td>
					<td><input type="submit" value="确定" class="button"
						onclick="test(${patient.pid})" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>