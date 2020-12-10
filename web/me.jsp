<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/mycss.css">
    <link rel="stylesheet" type="text/css" href="css/nanshifuzhuang_css.css">
    <link rel="stylesheet" type="text/css" href="css/nanshifuzhuang-yifu_css.css">
    <script type="text/javascript" src="js/zhuce_js.js"></script>
    <script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="css/mF_fancy.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
    <title>Title</title>
    <style type="text/css">
        html {
            height: 100%;
        }
        * {
            padding: 0;
            margin: 0;
        }
        #main-zhuce{
            width: 72%;
            margin: 0 auto;
            height: 500px;

        }

        span{
            font-size: 18px;
            font-family: 微软雅黑;
            font-weight:bold;
        }


        h2{
            font-weight: bold;
            font-family: 微软雅黑;
            letter-spacing: 5px;
            padding-top: 15px;
        }

        .line-space {
            padding-bottom: 50px;
        }
        .me {
            width: 700px;
            margin: 0 auto;
        }
        .exit {
            position: absolute;
            right: 1px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@include file="top.jsp"%>
<script type="text/javascript">
    function show(f) {
        var reader = new FileReader();//创建文件读取对象
        var files = f.files[0];//获取file组件中的文件
        reader.readAsDataURL(files);//文件读取装换为base64类型
        reader.onloadend = function(e) {
            //加载完毕之后获取结果赋值给img
            document.getElementById("showimg").src = this.result;

        };
    }


    function submit() {
        $("#submit-pic").trigger("click")
    }

    function promName()
    {
        if ($("#alter").html().trim() === "") {
            alert("昵称不能为空");
        } else {
            var name = prompt("请输入修改后的昵称", "");//将输入的内容赋给变量 name ，
            //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "UserServlet?method=alertUserName&name=" + name,//url
                contentType: "application/json;charset=utf-8",
                success: function (result) {
                    console.log(result);
                    alert(result.info);
                    $("#name").text("昵称：" + name);
                },
                error: function () {
                    alert("异常！");
                }
            });
        }
    }


    function recharge() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "UserServlet?method=recharge" ,//url
            data: $('#recharge-form').serialize(),
            success: function (result) {
                console.log(result);
                var info = result.info;
                alert(info);
                if (info === "充值成功") {
                    closeWindow();
                    $("#balance").html("余额：CNY" + result.money);
                }
            },
            error : function() {
                alert("异常！");
            }
        });
    }
</script>
<script type="text/javascript">
    // 弹窗
    function showWindow() {
        $('#showdiv').show();  //显示弹窗
        $('#cover').css('display','block'); //显示遮罩层
        $('#cover').css('height',document.body.clientHeight+'px'); //设置遮罩层的高度为当前页面高度
    }
    // 关闭弹窗
    function closeWindow() {
        $('#showdiv').hide();  //隐藏弹窗
        $('#cover').css('display','none');   //显示遮罩层
    }
</script>
<div id="main-zhuce">
    <h2>个人中心</h2>
    <div class="container me">
        <div class="row text-center">
            <form method="post" action="<%=request.getContextPath()%>/UploadServlet" enctype="multipart/form-data">
                <input type="file" class="form-control" id="upload_file" name="upload_file"
                       style="display: none;" onchange="show(this)">
                <div>
                    <img class="userinfo-head" src="${sessionScope.user.u_head}" alt='头像' width="100" height="100" id="showimg"
                     style="border-radius: 50%">
                </div>
                <button type="button" class="btn btn-info" id="select_file"
                        onclick="upload_file.click();">浏览
                </button>
                <button type="button" class="btn btn-info" onclick="submit()">
                    修改
                </button>
                <input type="submit" id="submit-pic" style="display: none">

            </form>
        </div>
        <table class="table table-striped">
            <tr>
                <td class="col-md-4" id="balance">余额：CNY${sessionScope.user.u_balance}</td>
                <td class="col-md-1 text-right" href="#"><a href="javascript:void(0);" class="btn btn-info" onclick="showWindow()">充值</a></td>
            </tr>
            <tr>
                <td class="col-md-4" id="name">昵称：${sessionScope.user.u_account}</td>
                <td class="col-md-1 text-right" href="#"><a href="javascript:void(0);" class="btn btn-info" onclick="promName()" id="alter">修改</a></td>
            </tr>
        </table>
    </div>
</div>
<!-- 遮罩层 -->
<div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%;filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">

</div>
<!-- 弹窗 -->
<div id="showdiv" style="width: 20%; margin: 0 auto; height: 40%; border: 1px solid #999; display: none; position: absolute; top: 30%; left: 40%; z-index: 3; background: #fff">
    <!-- 标题 -->
    <div style="background: #F8F7F7; width: 100%; height: 2rem; font-size: 1rem; line-height: 2rem; border: 1px solid #999; text-align: center;" >
        充值
        <span class="exit" onclick="closeWindow()">x</span>
    </div>
    <!-- 内容 -->

    <!-- 按钮 -->
    <form id="recharge-form">
        <table style="border-collapse:separate; border-spacing:10px;">
            <tr>
                <td>
                    <label>银行卡号:</label>
                </td>
                <td>
                    <input type="text" name="card" width="50px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>密码:</label>
                </td>
                <td>
                    <input type="password" name="password" width="50px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>充值金额:</label>
                </td>
                <td>
                    <input type="text" name="money" width="50px"/>
                </td>
            </tr>
        </table>

        <input type="button" value="确定充值" class="btn btn-info" style="display: block; margin: 0 auto; width: 100px" onclick="recharge()">
        </input>
    </form>
</div>
<div id="foot"><img src="image/logo2.png"></div>
</body>
<c:if test="${message ne null}">
    <script type="text/javascript" defer>
        alert("${message}")
    </script>
</c:if>

</html>