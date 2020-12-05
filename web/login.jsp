<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang_css.css">
	<link rel="stylesheet" type="text/css" href="css/login_css.css">
	<script type="text/javascript" src="js/login_js.js"></script>

	<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<c:if test="${isSuccess eq 1}">
		<script type="text/javascript" defer="defer">
			window.onload = function() {
				alert('注册成功');
			}
		</script>
		<%
			request.setAttribute("isSuccess", 0);
		%>
	</c:if>
	<c:if test="${isSuccess eq 2}">
		<script type="text/javascript" defer="defer">
			window.onload = function () {
				alert("密码错误，登录失败");
			}
		</script>
		<%
			request.setAttribute("isSuccess", 0);
		%>
	</c:if>
	<div id="main-login">
		<h2>用户登陆</h2>
		<div id="login">
			<form action="<%=request.getContextPath()%>/UserServlet" name="regForm" method="get">
				<div id="username">
					<span>用户名：  <input type="text" name="username" placeholder="请输入用户名"></span>
				</div>

				<div id="password1">
					<span>密&nbsp;&nbsp;&nbsp;&nbsp;码：    <input type="password" name="password" placeholder="请输入密码"></span>
				</div>

				

				<div id="button">
					<input type="hidden" name="method" value="checkUser">
					<input type="reset" name="reset" value="重置" style="height: 40px;width: 80px ; font-family: 微软雅黑;font-weight:bold;font-size: 16px; ">
					<input type="submit" name="ok" value="登陆" style="height: 40px;width: 80px ; font-family: 微软雅黑;font-weight:bold;font-size: 16px; ">
				</div>
				<div id="forget"><p>忘记密码？</p></div>
				
			</form>
		</div>
	</div>
	<div id="foot"><img src="image/logo2.png"></div>	
</body>
</html>