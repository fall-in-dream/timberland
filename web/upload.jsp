<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传实例 - 菜鸟教程</title>
</head>
<body>
<script type="text/javascript">
    function show(f) {
        var reader = new FileReader();//创建文件读取对象
        var files = f.files[0];//获取file组件中的文件
        reader.readAsDataURL(files);//文件读取装换为base64类型
        reader.onloadend = function(e) {
            //加载完毕之后获取结果赋值给img
            document.getElementById("showimg").src = this.result;
        }
    }
</script>
<h1>文件上传实例 - 菜鸟教程</h1>
<form method="post" action="<%=request.getContextPath()%>/TomcatTest/UploadServlet" enctype="multipart/form-data">
    选择一个文件:
    <input type="file" name="uploadFile" onchange="show(this)"/>
    <br/><br/>
    <input type="submit" value="上传" />
    <img class="userinfo-head" src="#" alt='头像' width="100" height="100" id="showimg">
</form>
</body>
</html>