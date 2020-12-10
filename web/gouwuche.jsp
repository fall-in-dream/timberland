<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/cartValidate.js"></script>
</head>
<body>
	<%@include file="top.jsp"%>
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
				<c:forEach items="${requestScope.shoppingCartItems}" var="shoppingCartItem">
					<tr>
						<td><img src="${shoppingCartItem.style.st_image}"><P>${shoppingCartItem.style.clothing.c_name}</P></td>
						<td>${shoppingCartItem.style.st_color}</td>
						<td>${shoppingCartItem.style.clothing.c_price}</td>
						<td><input type="text" id="num1" name="${shoppingCartItem.sc_id}" value="${shoppingCartItem.sc_num}" class="num"></td>
						<td>CNY<span>${shoppingCartItem.style.clothing.c_price * shoppingCartItem.sc_num}</span></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot style="width: 300px;">
				<tr style="width: 200px;">
					<td colspan="5" id="totalMoney" style="width: 200px;">商品总金额：CNY${money}</td>
				</tr>
			</tfoot>
		</table>
		<input type="button" name="" value="马上结算" id="pay" onclick="pay();">
	</div>
	<br><br><br><br><br>
	<div id="foot"><img src="image/logo2.png"></div>	
</body>
</html>