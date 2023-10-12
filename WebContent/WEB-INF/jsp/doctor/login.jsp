<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
<div class="bg">
	<div class="login_box">
		<h2>登录</h2>
		<form action="d_login" method="post">
			<div class="input_box">
				<input type="text" name="username"  placeholder="请输入员工代号">
			</div>
			<div class="input_box">
				<input type="password" name="password"  placeholder="请输入密码">
			</div>
			<button>登录</button><br><br>
			<span style="color:red; font-size:15px">${msg}</span>
		</form>
	</div>
</div>
</body>
</html>