<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang_css.css">
	<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">

		$(function(){

			$("#pageNo").change(function(){
				console.log("111");
				var val = $(this).val();
				val = $.trim(val);

				//1. 校验 val 是否为数字 1, 2, 而不是 a12, b
				var flag = false;
				var reg = /^\d+$/g;
				var pageNo = 0;

				if(reg.test(val)){
					//2. 校验 val 在一个合法的范围内： 1-totalPageNumber
					pageNo = parseInt(val);
					if(pageNo >= 1 && pageNo <= parseInt("${clothpage.totalPageNumber }")){
						flag = true;
					}
				}


				if(!flag){

					$(".alert").alert();
					$(this).val("");
					return;
				}

				//3. 页面跳转
				var href = "ClothesServlet?method=getClothes&pageNo=" + pageNo + "&" + $(":hidden").serialize();
				window.location.href = href;
			});
		})

	</script>
	<%@ include file="queryCondition.jsp" %>
</head>
<body>
<div id="header">
	<div id="small-menu">
		<ul class="small-menu">
			<li ><a href="Timberland.html">首页</a></li>
			<li ><a href="xiaiqingdan.html">清单/</a><a href="gouwuche.html">购物车</a></li>
			<li ><a href="zhuce.html">注册/</a><a href="login.html">登陆</a></li>
		</ul>
	</div>
</div>
<div id="primary-menu">
	<div id="logo" ><img src="image/logo.png"></div>
	<div id="big-menu">
		<ul >

			<li ><a href="nanzhuang.html">男装</a>
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
			<li ><a href="nvzhuang.html">女装</a>
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

<div id="daohang">
	<p><a href="">主页</a>><a href="">男装</a>><a href="">男士服装</a></p>
	<hr>
</div>

<div id="row">
	<p>男士服装</p>
	<div class="search">
		<form action="ClothesServlet?method=getClothes" method="post">
			<span>从</span>
			<input type="text" name="minPrice" placeholder="最低价格">
			<span>到</span>
			<input type="text" name="maxPrice" placeholder="最高价格">
			<button type="submit">查询</button>
		</form>
	</div>
	<select>
		<option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相关性</option>
		<option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最新上市</option>
		<option>价格从低到高</option>
		<option>价格从高到低</option>
	</select>
</div>

<div id="main">
	<div id="yifulan">
		<dl>
			<dt>类别</dt>
			<dd><a href="">T恤衫</a></dd>
			<dd><a href="">卫衣</a></dd>
			<dd><a href="">POLO衫</a></dd>
			<dd><a href="">外套</a></dd>
			<dd><a href="">毛衣</a></dd>
			<dd><a href="">衬衫</a></dd>
			<dd><a href="">长裤/短裤</a></dd>
		</dl>
		<dl>
			<dt>特点</dt>
			<dd><a href="">DryVent™</a></dd>
			<dd><a href="">百变多层次组合</a></dd>
			<dd><a href="">POLO衫</a></dd>
			<dd><a href="">Best</a></dd>
			<dd><a href="">Better</a></dd>
			<dd><a href="">Good</a></dd>
		</dl>
	</div>
	<div class="picgroup">
		<for:forEach items="${clothpage.list}" var="cloth">
			<a href="ClothesServlet?method=getCloth&pageNo=${computerpage.pageNo }&id=${computer.id}">
			<div class="cloth3">
				<img src="${cloth.c_pic}">
				<br>
				<a href="">${cloth.c_name}</a>
				<br>
				<span class="price">CNY${cloth.c_price}</span>
			</div>
			</a>
		</for:forEach>
		<%--<div class="cloth3"><img src="image/zuixinnanzhuang/1-1.png"><br><a href="">SQUAM LAKE 衬里直筒长裤</a><br><span id="price" >CNY1,590.00</span></div>
		<div class="cloth3"><img src="image/zuixinnanzhuang/1-2.png"><br><a href="">SQUAM LAKE 衬里直筒长裤</a><br><span id="price">CNY890.00</span></div>
		<div class="cloth3"><img src="image/zuixinnanzhuang/1-3.png"><br><a href="nanshifuzhuang-yifu.html">GUNSTOCK RIVER 两面穿夹克</a><br><span id="price">CNY890.00</span></div>
		<div class="cloth3"><img src="image/zuixinnanzhuang/2-3.png"><br><a href="">MASCOMA RIVER 抓绒衬里长<br>袖衬衣</a><br><span id="price" >CNY990.00</span></div>
--%>
	</div>


</div>
<div class="bottom">
	共 <span class="badge">${clothpage.totalPageNumber}</span> 页
	&nbsp;&nbsp;
	当前第 <span class="badge">${clothpage.pageNo}</span> 页
	&nbsp;&nbsp;

	<c:if test="${clothpage.hasPrev}">
		<a href="ClothesServlet?method=getClothes&pageNo=1">首页</a>
		&nbsp;&nbsp;
		<a href="ClothesServlet?method=getClothes&pageNo=${clothpage.prevPage }">上一页</a>
	</c:if>

	&nbsp;&nbsp;

    <c:if test="${clothpage.hasNext}">
		<a href="ClothesServlet?method=getClothes&pageNo=${clothpage.nextPage}">下一页</a>
		&nbsp;&nbsp;
		<a href="ClothesServlet?method=getClothes&pageNo=${clothpage.totalPageNumber }">末页</a>
	</c:if>

	&nbsp;&nbsp;

	转到 <input  type="text" size="1" id="pageNo"  data-dismiss="alert" aria-label="Close"/> 页
</div>
<br>
<div id="foot"><img src="image/logo2.png"></div>
</body>
</html>