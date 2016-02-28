<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<base href="${base}/">
<title>用户登录</title>
<link href="css/default/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script type="text/javascript">
	$(function(){
		<c:if test="${not empty msg}">
			$.dialog.alert("${msg}");
		</c:if>
	});
</script>
</head>

<body>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<div class="dh">用户登录</div>
		<div class="loginleft">
			<div class="zhuce">
				<div class="zhucet"></div>
				<div class="zhucec">
					<h1>
						<a href="register.jsp">还没有帐号？立即注册</a>！
					</h1>
				</div>
				<div class="zhuceb"></div>
			</div>
		</div>
		<div class="loginright">
			<div class="lgbdright">
				<ul>
					<li class="a1"></li>
					<li class="a2"></li>
					<li class="a3"></li>
				</ul>
			</div>
			<div class="clr"></div>
			<div class="lgrightc">
				<div class="dl">
					<form name="loginform" action="user/login" method="post">
						<div class="dlc">
							<div class="shur">
								<h2>用户名：</h2>
								<input type="text" name="name" id="name" class="input3">
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>&nbsp;密码：</h2>
								<input type="password" name="password" id="password"
									class="input3" />
							</div>
							<div class="clr"></div>
							<div class="shur1">
								<input type="checkbox" value="2592000" name="cookietime"
									id="cookietime" />下次自动登录
							</div>
							<div class="shur1">
								<input type="submit" name="submit" class="button4"
									value="登&nbsp;录" />&nbsp;忘记密码了？请点击 “<a class="red"
									href="getpwd.jsp">找回密码</a>”。
							</div>
						</div>
					</form>
					<div class="clr"></div>
				</div>
			</div>
			<div class="lgbdright2">
				<ul>
					<li class="a1"></li>
					<li class="a2"></li>
					<li class="a3"></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>