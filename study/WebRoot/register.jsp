<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<base href="${base}/">
<title>用户注册</title>
<link href="css/default/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript">
     var userexist=false; 
	function check_username() {
		var username1 = $.trim($('#username').val());
		var length = username1.length;
		if (length > 15 || length < 2) {
			$('#usernametip').html("用户名请使用2到15个字符");
			$('#usernametip').attr('class', 'input_error');
			return false;
		} else {
			$.ajax({
				type:"get",
				url:"user/isnameexist/"+username1,
				async:false,
				success:function(r){
					if(r){
						$('#usernametip').html("用户名已经存在");
						$('#usernametip').attr('class', 'input_error');
					}else{
						$('#usernametip').html("&nbsp;");
						$('#usernametip').attr('class', 'input_ok');
					}
					userexist=r;
				},
				statusCode:{
					404:function(){
						
					},
					500:function(){
						alert("系统异常");
					}
				}
			});
			return !userexist;
		}
	}
	function check_passwd() {
		var passwd = $('#password').val();
		var length = passwd.length;
		if (length<6|| length>16) {
			$('#passwordtip').html("密码最少6个字符，最长不得超过16个字符");
			$('#passwordtip').attr('class', 'input_error');
			return false;
		} else {
			$('#passwordtip').html("&nbsp;");
			$('#passwordtip').attr('class', 'input_ok');
			return true;
		}
	}

	function check_repasswd() {
		repasswdok = 1;
		var repassword = $('#repassword').val();
		var length = repassword.length;
		if (length<6 || length>16) {
			$('#repasswordtip').html("密码最少6个字符，最长不得超过16个字符");
			$('#repasswordtip').attr('class', 'input_error');
			return false;
		} else {
			if ($('#password').val() == $('#repassword').val()) {
				$('#repasswordtip').html("&nbsp;");
				$('#repasswordtip').attr('class', 'input_ok');
				return true;
			} else {
				$('#repasswordtip').html("两次密码输入不一致");
				$('#repasswordtip').attr('class', 'input_error');
				return false;
			}
		}
	}
	function check_email() {
		var email = $.trim($('#email').val());
		if (!email.match(/^[\w\.\-]+@([\w\-]+\.)+[a-z]{2,4}$/ig)) {
			$('#emailtip').html("邮件格式不正确");
			$('#emailtip').attr('class', 'input_error');
			return false;
		} else {
			$('#emailtip').html("&nbsp;");
			$('#emailtip').attr('class', 'input_ok');
			return true;
		}
	}
	
	function docheck(){
		return check_username()&&check_passwd()&&check_repasswd()&&check_email();
	}
</script>
</head>
<body>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<div class="dh">注册新用户</div>
		<div class="loginleft">
			<div class="zhuce">
				<div class="zhucet"></div>
				<div class="zhucec">
					<h1>
						<a href="login.jsp">已有账号？马上登录！</a>
					</h1>
					<h1>友情贴士：</h1>
					<ul>
						<li>·我们提醒您注意，您需要注册并登陆，才能享受我们的完整服务进行各项操作。</li>
						<li>·密码过于简单有被盗的风险，一旦密码被盗你的个人信息有泄漏的危险。</li>
						<li>·我们拒绝垃圾邮件，请使用有效的邮件地址</li>
					</ul>
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
					<form name="reg" name="registform" action="user/register"
						method="post" onsubmit="return docheck()">
						<input type="hidden" name="opr" value="reg"/>
						<div class="dlc">
							<div class="shur">
								<h2>&nbsp;用户名：</h2>
								<input type="text" id="username" name="name"
									onblur="check_username()" class="input3" value="" /> <span
									id="usernametip" class="input_desc">不超过14个字节(中文，数字，字母和下划线)</span>
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>登录密码：</h2>
								<input type="password" name="password" id="password"
									class="input3" onblur="check_passwd()" /> <span
									id="passwordtip" class="input_desc" onblur="check_passwd()">长度6-14位，字母区分大小写</span>
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>密码确认：</h2>
								<input type="password" name="repassword" id="repassword"
									class="input3" onblur="check_repasswd()" /> <span
									id="repasswordtip" class="input_desc">与登录密码输入一致</span>
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>电子邮件：</h2>
								<input type="text" id="email" name="email" class="input3"
									onblur="check_email()" /> <span id="emailtip"
									class="input_desc">请输入正确的电子邮箱地址</span>
							</div>
							<div class="clr"></div>
							<div class="shur3">
								<input type="submit" name="submit" class="button4" value="提交注册" />
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