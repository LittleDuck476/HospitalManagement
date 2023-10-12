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
<title>开检查单</title>
<script type="text/javascript">
	var msg = "${msg}";
	if(msg!=''){
    alert(msg);
	}
	
	function test(x,pro) {
    var select = document.getElementById("pro"+pro).value;
    window.location.href="d_updcheck?id="+x+"&project="+select;
	}
	
	function del(){
		var msg = "您真的确定要删除吗？";
		if(confirm(msg)==true)
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
					<th>病患姓名</th>
					<th>病患电话</th>
					<th>项目名</th>
					<th colspan="2">操作</th>
				</tr>
			</thead>

			<c:forEach items="${unpaidproList}" var="unpaidpro"
				varStatus="status">
				<tr>
					<td>${unpaidpro.pname}</td>
					<td>${unpaidpro.ptel}</td>
					<td><select id="pro${status.index}">
							<option value="${unpaidpro.proid}">${unpaidpro.proname}</option>
							<c:forEach items="${projecttypeList}" var="type">
								<option value="${type.id}">${type.name}</option>
							</c:forEach>
					</select></td>
					<td><input type="button" value="修改" class="button"
						onclick="test(${unpaidpro.id},${status.index})" /></td>
					<td><a href="d_delcheck?id=${unpaidpro.id}" class="button"
						style="background-color: #ff4d4d" onclick="return del();">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>