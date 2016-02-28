<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<base href="${base}/">
<title>用户登录</title>
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
</head>

<body>
	<div class="dlc">
		<div class="shur">
			<h2>用户名：</h2>
			<input type="text" name="name" id="username" class="input3">
		</div>
		<div class="clr"></div>
		<div class="shur">
			<h2>密&nbsp;&nbsp;码：</h2>
			<input type="password" name="password" id="password" class="input3" />
		</div>
		<div class="clr"></div>
		<div class="shur1">
			&nbsp;忘记密码了？请点击 “<a class="red" href="getpwd.jsp" target="_blank">找回密码</a>”。
		</div>
	</div>
</body>
</html>