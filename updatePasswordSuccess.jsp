<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<head>
	<title>美丽化工-问答管理</title>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="author" content="">
    <link href="../admin/style/css/qa.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
    </style>

</head>

<body>

<div class="ASKwindow" style="min-width:1170px;">
  <div class="ask_banner">
    <span class="chem-logo"><a href="/column/INDEX"><img src="../admin/style/css/logo3-dark.png" alt="Logo"></a></span>
    <div style=" clear:both;"></div>
  </div>
</div>
<div align="center" style="font-size:x-large;margin-top: 100px;">
密码修改成功！
	<div><span id="sp" style="color: red;">3</span>秒后返回登录页面...</div>
</div>
<div class="copyright" style="min-width:1170px;">Copyright &copy; 2016 清华大学</div>
</body>
<script type="text/javascript"> 
onload=function(){ 
setInterval(go, 1000); 
}; 
var x=3; //利用了全局变量来执行 
function go(){ 
x--; 
if(x>0){ 
document.getElementById("sp").innerHTML=x; //每次设置的x的值都不一样了。 
}else{ 
location.href='${pageContext.request.contextPath}/admin/login.do'; 
} 
} 
</script> 
</html>
