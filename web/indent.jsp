<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" type="text/css" href="css/xiaiqingdan_css.css">
	<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		.pic {
			width: 100px;
			height: 100px;
		}
		.describe {
			width: 200px;
			height: 100px;
		}
		.table>tbody>tr:nth-child(2) {
            background: #f9f9f9;

		}
        .table>tbody>tr:nth-child(1)>td{
			border: 0;
		}
		.table>tbody>tr:nth-child(2)>td{
			border: 0;
		}
		.table>tbody>tr:nth-child(1)>td{
			height: 10px;
		}
        thead {
			background: #f9f9f9;
		}
		#table>thead>tr>th{
			border:0;
		}
		.center {
			vertical-align: middle;
			text-align: center;
		}

	</style>
    <script type="text/javascript">
		$(document).ready(function () {
			$(".center").css({"vertical-align": "middle", "text-align": "center"});
		});
	</script>
</head>
<body>
	<%@include file="top.jsp"%>
	<div id="main-xiaiqingdan">
		<h2>我的订单</h2>
		<div style="width: 80%;margin: 0 auto" >
		<table style="border-collapse: collapse;border: 0" class="table table-bordered" id="table">
			<thead>
				<tr >
					<th colspan="3" style="text-align: center">订单详情</th>
					<th style="text-align: center">收货人</th>
					<th>单价</th>
                    <th>小计</th>
					<th style="text-align: center">总金额</th>
				</tr>
			</thead>
			<c:forEach items="${requestScope.indentListMap}" var="indentItem">
				<tbody>
				<tr><td colspan="5"></td></tr>
				<tr>
					<td>${indentItem.key.i_time}</td>
					<td>${indentItem.key.i_num}</td>
					<td>Timberland</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach items="${indentItem.value}" var="indentInfo">

					<tr>
						<td><img class="pic" src="${indentInfo.style.st_image}"></td>
						<td><div class="describe">${indentInfo.style.clothing.c_name}</div></td>
						<td>x${indentInfo.f_quantity}</td>
                        <td>${sessionScope.user.u_account}</td>
						<td>${indentInfo.style.clothing.c_price}</td>
						<td>${indentInfo.style.clothing.c_price * indentInfo.f_quantity}</td>
						<c:if test="${indentInfo.f_id eq indentItem.value[0].f_id}">
							<td rowspan="${indentItem.value.size()}" class="center">CNY${indentItem.key.i_money}</td>
						</c:if>
					</tr>
				</c:forEach>
				<%--<tr>
					<td><img class="pic" src="http://s.timberland.com.cn/wp-content/uploads/product/f20/A2BJHP56-HERO.jpg"></td>
					<td><div class="describe">PROFILE LAKE灯芯绒宽松锥形 长裤</div></td>
					<td>x1</td>
					<td>黄海涛</td>
					<th>10000000</th>
				</tr>

				<tr>
					<td><img class="pic" src="http://s.timberland.com.cn/wp-content/uploads/product/f20/A2BJHP56-HERO.jpg"></td>
					<td><div class="describe">PROFILE LAKE灯芯绒宽松锥形 长裤</div></td>
					<td>x1</td>
					<td>黄海涛</td>
					<th>10000000</th>
				</tr>--%>
				</tbody>
			</c:forEach>
		</table>
		</div>

	</div>

	<div id="foot"><img src="image/logo2.png"></div>	
</body>
</html>