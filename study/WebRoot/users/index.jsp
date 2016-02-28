<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<base href="${base}/">
<title>个人中心</title>
<link href="css/default/global.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="header">
		<jsp:include page="../header.jsp" />
	</div>
	<div class="content">
		<c:import url="left.jsp"></c:import>
		<div class="uright">
			<div class="grzl">
				<h2>用户资料</h2>
				<div class="grxqt"></div>
				<div class="grxqc">
					<h1>${sessionScope.user.name}</h1>
					<ul>
						<li>当前等级:书童</li>
						<li>上次登录：9秒前</li>
						<li title="升级进度:升级到一等级[书生]还需25经验值">升级进度:
							<div class="process-bar">
								<div class="pb-wrapper">
									<div class="pb-highlight"></div>
									<div class="pb-container">
										<div class="pb-text">55/80</div>
										<div style="height:100%;width:69%;background:#3F92F8;"></div>
									</div>
								</div>
							</div>
						</li>
						<li>下一等级:[书生]</li>
						<li>总经验值：55</li>
						<li>总财富值：20</li>
						<li>采纳率：0%</li>
						<li>提问数：5</li>
						<li>回答数:1</li>
						<li>QQ：12345678</li>
					</ul>
					<div class="clr"></div>
				</div>
				<div class="grxqb"></div>
			</div>
			<div class="glgrzl">
				<div class="ggao"></div>
				<div class="glzlt"></div>
				<div class="glzlc">
					<h1>管理个人资料</h1>
					<div class="clr"></div>
					<div class="jiben">
						<img width="16px" height="16px" src="css/default/myquestion.gif" />
						<a title="我的问题" href="users/">我的提问</a>&nbsp;&nbsp; <img
							width="16px" height="16px" src="css/default/myanswer.gif" /> <a
							title="我的回答" target="_top" href="">我的回答</a>
					</div>
					<div class="jiben">
						<img width="16px" height="16px" align="absmiddle"
							src="css/default/mymsg.gif" /> <a title="我的消息" target="_top"
							href="">我的消息</a>&nbsp;&nbsp; <img width="16px" height="16px"
							src="css/default/myquestion.gif" /> <a title="修改密码"
							target="_top" href="">修改密码</a>
					</div>
					<div class="jiben">
						<img width="16px" height="16px" align="absmiddle"
							src="css/default/myinfo.gif"> <a title="个人信息" target="_top"
							href="">个人信息</a>&nbsp;&nbsp; <img width="16px" height="16px"
							align="absmiddle" src="css/default/myavatar.gif" /> <a
							title="查看或修改头像" target="_top" href="users/editimg.jsp">修改头像</a>
					</div>
					<div class="clr"></div>
				</div>
				<div class="glzlb"></div>
				<div class="clr"></div>
			</div>
			<div class="jianjie">
				<img width="18" height="16" align="absmiddle"
					src="css/default/userinfo.gif">&nbsp;个人简介
			</div>
			<div class="fg">
				<img width="780px;" height="6px" src="css/default/userline.gif">
			</div>
			<div class="jf"></div>
			<div class="jianjie">
				<img width="18" height="16" align="absmiddle"
					src="css/default/userinfo.gif">&nbsp;我的积分
			</div>
			<div class="fg">
				<img width="780px;" height="6px" src="css/default/userline.gif">
			</div>
			<div class="jf">
				<h3>经验值</h3>
				<div class="jfmx">
					<ul>
						<li>总分<br>&nbsp;55</li>
						<li>日常操作<br>&nbsp;55</li>
						<li>奖励得分<br>&nbsp;0</li>
						<li>违规处罚<br>&nbsp;0</li>
					</ul>
					<div class="clr"></div>
				</div>
				<h3>财富值</h3>
				<div class="jfmx">
					<ul>
						<li>总分<br>&nbsp;20</li>
						<li>奖励得分<br>&nbsp;0</li>
						<li>违规处罚<br>&nbsp;0</li>
						<li>悬赏付出<br>&nbsp;0</li>
						<li>回答被采纳<br>&nbsp;0</li>
					</ul>
					<div class="clr"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<!--footer-->
	<div class="footer">
		<c:import url="../footer.jsp"></c:import>
	</div>
</body>
</html>