<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" type="text/css" href="css/nanshifuzhuang_css.css">
	<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div id="header">
		<div id="small-menu">
			<ul class="small-menu">
				<li ><a href="Timberland.jsp">首页</a></li>
				<li ><a href="indent.jsp">清单/</a><a href="gouwuche.jsp">购物车</a></li>
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

	<div id="daohang">
		<p><a href="">主页</a>><a href="">男装</a>><a href="">男士服装</a></p>
		<hr>
	</div>

	<div id="row">
		<p>男士服装</p>
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

		<%--<div class="container search">
			<form action="computerServlet?method=getComputers" method="post" class="form-inline">
				<div class="form-group">
					<div >
						<label class="sr-only">Amount (in dollars)</label>
						<div class="input-group">
							<div class="input-group-addon">从</div>
							<input type="text" class="form-control col-xs-1" name="minPrice" placeholder="最低价格"/>
							<div class="input-group-addon">到</div>
							<input type="text" class="form-control col-xs-1" name="maxPrice" placeholder="最高价格"/>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary searchBtn "><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询</button>
			</form>
		</div>
		<div class="container">
			<div class="container">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<div class="cloth3"><img src="image/zuixinnanzhuang/1-3.png"><br><a href="">GUNSTOCK RIVER 两面穿夹克</a><br><span id="price">CNY890.00</span></div>
					</div>
				</div>
			</div>
			&lt;%&ndash;<div id="picgroup">
				<div class="cloth3"><img src="image/zuixinnanzhuang/1-1.png"><br><a href="">SQUAM LAKE 衬里直筒长裤</a><br><span id="price" >CNY1,590.00</span></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/1-2.png"><br><a href="">SQUAM LAKE 衬里直筒长裤</a><br><span id="price">CNY890.00</span></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/1-3.png"><br><a href="">GUNSTOCK RIVER 两面穿夹克</a><br><span id="price">CNY890.00</span></div>
			</div>
			<div id="picgroup">
				<div class="cloth3"><img src="image/zuixinnanzhuang/2-3.png"><br><a href="">MASCOMA RIVER 抓绒衬里长<br>袖衬衣</a><br><span id="price" >CNY990.00</span></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/2-2.png"><br><a href="">MASCOMA RIVER 抓绒衬里长<br>袖衬衣</a><br><span id="price">CNY990.00</span></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/2-1.png"><br><a href="">MASCOMA RIVER 抓绒衬里长<br>袖衬衣</a><br><span id="price">CNY990.00</span></div>
			</div>
			<div id="picgroup">
				<div class="cloth3"><img src="image/zuixinnanzhuang/3-3.png"><br><a href="">SCAR RIDGE 派克羽绒外套，采<br>用 DRYVENT™ 科技</span><br><span id="price" >CNY2,590.00</a></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/3-2.png"><br><a href="">SCAR RIDGE 派克羽绒外套，采<br>用 DRYVENT™ 科技</a><br><span id="price">CNY2,590.00</span></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/3-1.png"><br><a href="">SIMMS RIVER 美利奴混纺条纹<br>圆领毛衣</a><br><span id="price">CNY1,090.00</span></div>
			</div>
			<div id="picgroup">
				<div class="cloth3"><img src="image/zuixinnanzhuang/4-3.png"><br><a href="">SCAR RIDGE 3合1 MA-1保暖外<br>套， 采用 DRYVENT™ 科技</a><br><span id="price" >CNY1,990.00</span></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/4-2.png"><br><a href="">SCAR RIDGE 3合1 MA-1保暖外<br>套， 采用 DRYVENT™ 科技</a><br><span id="price">CNY1,990.00</span></div>
				<div class="cloth3"><img src="image/zuixinnanzhuang/4-1.png"><br><a href="">SCAR RIDGE 连帽羽绒外套，采<br>用DRYVENT™ 科技</a><br><span id="price">CNY2,290.00</span></div>
			</div>&ndash;%&gt;
		</div>
	</div>--%>
	</div>
	<br>
<div id="foot"><img src="image/logo2.png"></div>	
</body>
</html>