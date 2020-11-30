<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang_css.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang-yifu_css.css">
	<script type="text/javascript" src="js/zhuce_js.js"></script>
	<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>

	<link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

	<style type="text/css">
		#main-zhuce{
			width: 72%;
			margin: 0 auto;
			height: 500px;

		}
		#login{
		width: 300px;
		height: 400px;
		position: relative;
		top:30px;

		margin: 0 auto;
		}
		span{
			font-size: 18px;
			font-family: 微软雅黑;
			font-weight:bold;
		}
		#login div{
			position: relative;
			top:80px;
			left:30px;
			padding-bottom: 10px;
		}
		#login #button {
			position: relative;
			
			top: 100px;
			left:60px;
		}
		h2{
			font-weight: bold;
			font-family: 微软雅黑;
			letter-spacing: 5px;
			padding-top: 15px;
		}
	</style>
</head>

<body>
	<div id="header">
		<div id="small-menu">
			<ul class="small-menu">
				<li ><a href="Timberland.jsp">首页</a></li>
				<li ><a href="xiaiqingdan.jsp">清单/</a><a href="gouwuche.jsp">购物车</a></li>
				<li ><a href="zhuce.jsp">注册/</a><a href="login.jsp">登陆</a></li>
			</ul>
		</div>
	</div>
	<div id="primary-menu">
		<div id="logo" ><img src="image/logo.png"></div>
		<div id="big-menu">
			<ul >
				
				<li ><a href="nanzhuang.jsp">男装</a>
					<ul >
						<li><a href="">男士服装</a></li>
						<li><a href="">T恤衫</a></li>
						<li><a href="">卫衣</a></li>
						<li><a href="">POLO衫</a></li>
						<li><a href="">外套</a></li>
						<li><a href="">毛衣</a></li>
						<li><a href="">衬衫</a></li>
						<li><a href="">长裤/短裤</a></li>
					</ul>
				</li>
				<li ><a href="nvzhuang.jsp">女装</a>
					<ul >
						<li><a href="">女士服装</a></li>
						<li><a href="">T恤衫</a></li>
						<li><a href="">卫衣</a></li>
						<li><a href="">连衣裙</a></li>
						<li><a href="">外套</a></li>
						<li><a href="">衬衫</a></li>
						<li><a href="">长裤/短裤</a></li>
					</ul>
				</li>
				<li ><a href="">官方旗舰店</a></li>
			</ul>
		</div>
		<div id="search" ><input type="text" name="" placeholder="开始搜索" style="height: 30px;background-color:transparent;color: white;top: 5px;"></div>
	</div>

	<div id="main-zhuce">
		<h2>用户注册</h2>
		<div id="login">
			<form action="" name="regForm" method="get">
				<div id="username">
					<span>用户名：  <input type="text" name="username" placeholder="请输入用户名"></span>
				</div>

				<div id="password1">
					<span>密    码：    <input type="password" name="password1" placeholder="请输入密码"></span>
				</div>

				<div id="password2">
					<span>确认密码：<input type="password" name="password2" placeholder="请再次输入密码" ></span>
				</div>

				<div id="mail">
					<span>邮件地址：<input type="text" name="mail" placeholder="请填写正确的邮箱地址"></span>
				</div>

				<div id="sex">
					<span>性别：</span><input type="radio" name="sex" value="男"><span>男</span>
					<input type="radio" name="sex" value="女"><span>女</span>
				</div>

				<div id="age">
					<span>年龄：</span>
					<select name="age">
						<option value="1" selected="select"></option>
						<option value="2" > 1~20</option>
						<option value="3" > 21~40</option>
						<option value="4" > 20以上</option>
					</select>
				</div>

				<div id="button">
					<input type="reset" name="reset" value="重置" style="height: 40px;width: 80px ; font-family: 微软雅黑;font-weight:bold;font-size: 16px; ">
					<input type="submit" name="ok" value="确认" style="height: 40px;width: 80px ; font-family: 微软雅黑;font-weight:bold;font-size: 16px; " onclick="handsubmit();">
				</div>
			</form>
		</div>
	</div>
	<div id="foot"><img src="image/logo2.png"></div>	


</body>
</html>