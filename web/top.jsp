<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Stay Hungry
  Date: 2020/11/30
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="header">

    <div id="small-menu">
        <ul class="small-menu">
            <li ><a href="Timberland.jsp">首页</a></li>
            <li >
                <a href="ClothesServlet?method=order.jsp">订单</a>
                &nbsp;&nbsp;&nbsp;

            </li>
            <c:choose>
                <c:when test="${sessionScope.user.u_account eq null}">
                    <li><a href="UserServlet?method=forwardPage&page=zhuce">注册/</a><a href="UserServlet?method=forwardPage&page=login">登陆</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="ClothesServlet?method=getShoppingCart">购物车<span class="badge">${sessionScope.itemNum}</span></a></li>
                    <li><a href="UserServlet?method=forwardPage&page=me">用户名：${sessionScope.user.u_account}</a></li>
                    <li><a href="UserServlet?method=exit">退出</a></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
</div>
<div id="primary-menu">
    <div id="logo" ><img src="image/logo.png"></div>
    <div id="big-menu">
        <ul >

            <li ><a href="nanzhuang.html">男装</a>
                <ul >
                    <li><a href="ClothesServlet?method=getClothes">男士服装</a></li>
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
