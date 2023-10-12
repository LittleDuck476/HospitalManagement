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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>

</head>
<body>
	<div class="bg">
			<div class="wrap">
				<ul class="links">
					<li class="l1">
						<p class="p">患者版</p>
						<span class="link">点击进入</span>
						<a class="a" href="p_toLogin"></a>
					</li>
					<li class="l2">
						<p class="p">医生版</p>
						<span class="link">点击进入</span>
						<a class="a" href="d_toLogin"></a>
					</li>
					<li class="l3">
						<p class="p">药房版</p>
						<span class="link">点击进入</span>
						<a class="a" href="m_toLogin"></a>
					</li>
					<li class="l4">
						<p class="p">挂号收费版</p>
						<span class="link">点击进入</span>
						<a class="a" href="r_toLogin"></a>
					</li>
					<li class="l5">
						<p class="p">检查化验版</p>
						<span class="link">点击进入</span>
						<a class="a" href="c_toLogin"></a>
					</li>
					<li class="l6">
						<p class="p">管理员版</p>
						<span class="link">点击进入</span>
						<a class="a" href="a_toLogin"></a>
					</li>
				</ul>
			</div>
		</div>
</body>
</html>