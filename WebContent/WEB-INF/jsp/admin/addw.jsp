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
<title>添加医务人员</title>
<script type="text/javascript">
    var msg = "${msg}";
    if(msg!=''){
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
		<form action="addworker" method="post">
		<table class="bordered" cellspacing="0" border="0">
			<thead>
				<tr>
					<th>员工代号</th>
					<th>密码</th>
					<th>部门</th>
					<th>操作</th>
				</tr>
			</thead>
				<tr>
					<td><input type="text" name="username"></td>
					<td><input type="text" name="password"></td>
					<td><select name="role">
							<option value="1">管理员</option>
							<option value="4">挂号处</option>
							<option value="5">检查化验处</option>
							<option value="6">药房处</option>
						</select></td>
					<td><input type="submit" value="添加" class="button"/></td>
				</tr>
		</table>
	</form>
	</div>
</body>
</html>