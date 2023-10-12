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
<title>添加医生</title>
<script type="text/javascript">
    var msg = "${msg}";
    if(msg!=''){
        alert(msg);
    }
</script>
<style type="text/css">
	input,select{
		width:110px;
	}
	.button {
		background-color: #4CAF50;
	}
</style>
</head>
<body>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
		<form action="adddoctor" method="post">
		<table class="bordered" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>医生员工代号</th>
					<th>医生姓名</th>
					<th>医生密码</th>
					<th>科室</th>
					<th>门诊类型</th>
					<th>挂号费</th>
					<th>操作</th>
				</tr>
			</thead>
				<tr>
					<td><input type="text" name="username"></td>
					<td><input type="text" name="name"></td>
					<td><input type="text" name="password"></td>
					<td><input type="text" name="room"></td>
					<td><select name="type">
							<option value="1">普通门诊</option>
							<option value="2">专家门诊</option>
						</select></td>
					<td><input type="text" name="price"></td>
					<td><input type="submit" value="添加" class="button"/></td>
				</tr>
		</table>
	</form>
	</div>
</body>
</html>