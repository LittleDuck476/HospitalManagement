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
<title>开处方</title>
<script type="text/javascript">
	var msg = "${msg}";
	if(msg!=''){
    alert(msg);
	}
	
	function test(pid,b) {
    var medicine = document.getElementById("med"+b).value;
    var a = document.getElementById("in"+b).value;
    window.location.href="d_insertpretable?pid="+pid+"&medicine="+medicine+"&amount="+a;
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
					<th>姓名</th>
					<th>电话</th>
					<th>药品名称</th>
					<th>数量</th>
					<th>操作</th>
				</tr>
			</thead>

			<c:forEach items="${registrationList}" var="patient"
				varStatus="status">
				<tr>
					<td>${patient.pname}</td>
					<td>${patient.ptel}</td>
					<td><select id="med${status.index}">
							<option value="0">--请选择--</option>
							<c:forEach items="${medicineList}" var="medicine">
								<option value="${medicine.id}">${medicine.name}</option>
							</c:forEach>
					</select></td>
					<td><input type="text" id="in${status.index}"
						onkeyup="value=(parseInt((value=value.replace(/\D/g,''))==''||parseInt((value=value.replace(/\D/g,''))==0)?'1':value,10))" /></td>
					<td><input type="submit" value="开处方单" class="button"
						style="width: 70px; font-size: 10px"
						onclick="test(${patient.pid},${status.index})" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>