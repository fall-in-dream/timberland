<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang_css.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang-yifu_css.css">
	<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="top.jsp"%>


	<script type="text/javascript">
		$(function() {
			$(".color").change(function () {
				var url = "ClothesServlet";
				var idVal = $(".color").val();
				var args = {"method": "updateCloth", "id": idVal};
				console.log("sdsfdsdf");
				$.post(url, args, function (data) {
					var styleNum = data.styleNum;
					var picPath = data.picPath;
					console.log(styleNum);
					console.log(picPath);
					$(".num").html(styleNum);
					$("#cloth-pic").attr('src',picPath);
				}, "JSON")
			});

			$(".add-cart").click(function () {
				console.log("sdfsfsd");
				$(location).attr('href', 'ClothesServlet?method=addToCart&id=${param.id}&userId=${sessionScope.user.u_id}&styleId=' + $(".color").val());
			})
		});
	</script>
	<%@ include file="queryCondition.jsp" %>
	<div id="daohang">
		<p><img src="image/nanshifuzhuang-yifu/icon.png" style="margin-bottom: 15px"><a href="ClothesServlet?method=getClothes&pageNo=${param.pageNo}">返回</a>|<a href="">主页</a>><a href="">男装</a>>
			<a href="">男士服装</a>><a href="">${cloth.c_name}</a></p>
		<hr>
	</div>
	<c:if test="${isSuccess eq 1}">
		<div class="container tips">
			<div class="alert alert-success tip-success" style="text-align: center">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong>成功！</strong>您已经将 <b>${cloth.c_name}</b>加入到购物车中!
				<b><a href="computerServlet?method=forwardPage&page=cart&pageNo=${computerpage.pageNo }">立即查看购物车</a></b>
			</div>
		</div>

		<%
			request.removeAttribute("isSuccess");
		%>
	</c:if>

	<div id="main-yifu">
		<div id="left">
			<img id="cloth-pic" src="${cloth.c_pic}">
		</div>

		<div id="right">
            <h1>${cloth.c_name}</h1>
			<hr>
			<p>
				颜色：
				<select class="color">
                    <c:forEach items="${styleList}" var="style">
						<option value="${style.st_id}">${style.st_color}</option>
					</c:forEach>
				</select>
				<br>
				款号：<span class="num">${styleList[0].st_style}</span>
			</p>
			<hr>
			<h2>CNY${cloth.c_price}</h2>
			<h5>此网站的价格为建议零售价，可能与您所在区域的实际零售价格有不同</h5>
			<div id="buy" class="add-cart">
				<span>添加购物车</span>
			</div>
			<img src="image/nanshifuzhuang-yifu/longicon.png">
			<%--<h1>GUNSTOCK RIVER 两面穿夹克</h1>
			<hr>
			<p>颜色：黑色 色织<br>款色：A1UOZB68</p>
			<img src="image/nanshifuzhuang-yifu/cloth.png"><br><br>
			<hr>
			<h2>CNY1,590.00</h2>
			<h5>此网站的价格为建议零售价，可能与您所在区域的实际零售价格有不同。</h5>

			<div id="buy">
				<span>添加购物车</span>
			</div>
			<img src="image/nanshifuzhuang-yifu/longicon.png" >--%>
		</div>
		<div class="clear"></div>

		<div id="chanpinmiaoshu">
			<h2>产品描述：</h2>
			<p>面料说明: 棉 帆布外层/尼龙内层<br>面料成分: 100% 棉 格帆布 色织, 磨毛和 100% 尼龙 素色平纹织物内层<br>衣领: 非扣结领剪裁: 新款修身罩衫<br>两面穿款</p>
		</div>
		<br><br>
		<h3 style="text-align: center;">产品推荐</h3>
		<br><br>
		<div>
			<div class="chanpintuijian">
				<img src="image/nanshifuzhuang-yifu/tuijian1.png">
				<a href="">PLEASANT RIVER 牛津纺长袖衬衫</a>
				<p>CNY550.00</p>
			</div>
			<div class="chanpintuijian">
				<img src="image/nanshifuzhuang-yifu/tuijian2.png">
				<a href="">PLEASANT RIVER 牛津纺长袖衬衫</a>
				<p>CNY550.00</p>
			</div>
			<div class="chanpintuijian">
				<img src="image/nanshifuzhuang-yifu/tuijian3.png">
				<a href="">PLEASANT RIVER 牛津纺长袖衬衫</a>
				<p>CNY550.00</p>
			</div>
			<div class="chanpintuijian">
				<img src="image/nanshifuzhuang-yifu/tuijian4.png">
				<a href="">PLEASANT RIVER 牛津纺长袖衬衫</a>
				<p>CNY550.00</p>
			</div>
			<div class="chanpintuijian">
				<img src="image/nanshifuzhuang-yifu/tuijian5.png">
				<a href="">PLEASANT RIVER 牛津纺长袖衬衫</a>
				<p>CNY550.00</p>
			</div>
			<div class="chanpintuijian">
				<img src="image/nanshifuzhuang-yifu/tuijian6.png">
				<a href="">PLEASANT RIVER 牛津纺长袖衬衫</a>
				<p>CNY550.00</p>
			</div>
		</div>
	</div>
<div id="foot"><img src="image/logo2.png"></div>	
</body>
</html>