<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang_css.css">
	<link rel="stylesheet" type="text/css" href="css/gouwuche_css.css">

	<script type="text/javascript" src="js/gouwuche_js.js"></script>
	<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
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

	<div id="main-gouwuche">
		<h2>购物车</h2>
		<table >
			<thead>
				<tr>
					<th width="500px;">商品名称</th>
					<th>颜色</th>
					<th>单价</th>
					<th>数量</th>
					<th>金额小计</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src="image/gouwuche/tuijian1.png"><P>PLEASANT RIVER 牛津纺长袖衬衫</P></td>
					<td>白色</td>
					<td>550</td>
					<td><input type="button" name="jianyi" value="-" class="btn" onclick="_1jianyi();"><input type="text" id="num1" value="1" class="num"><input type="button" name="jiayi" value="+" class="btn" onclick="_1jiayi();"></td>
					<td>CNY:<input type="text" id="price1" value="550" class="price" ></td>
				</tr>
				<tr>
					<td><img src="image/gouwuche/tuijian2.png"><P>PLEASANT RIVER 牛津纺长袖衬衫</P></td>
					<td>白色</td>
					<td>250</td>
					<td><input type="button" name="jianyi" value="-" class="btn" onclick="_2jianyi();"><input type="text" id="num2" value="1" class="num"><input type="button" name="jiayi" value="+" class="btn" onclick="_2jiayi();"></td>
					<td>CNY:<input type="text" id="price2" value="250" class="price" ></td>
				</tr>
			</tbody>
			<tfoot style="width: 300px;">
				<tr style="width: 200px;">
					<td colspan="5" style="width: 200px;">商品总金额：CNY:<input type="text" name="total" id="total" value="800" class="price" style="font-size: 23px;"></td>
				</tr>
			</tfoot>
		</table>
		<input type="button" name="" value="马上结算" id="pay" onclick="pay();">
	</div>
	
	<div id="foot"><img src="image/logo2.png"></div>	
</body>
</html>