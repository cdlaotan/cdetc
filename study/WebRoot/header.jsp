<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="h_top">
	<div class="logo">
		<a href="" title="问答平台" target="_top"> <img
			src="css/default/logo.png" /> </a>
	</div>
	<div class="userbar">
		<c:if test="${not empty sessionScope.user}">
			<div class='gdfw'>
				<img src="${sessionScope.user.avatar}"
					alt="${sessionScope.user.name}" />
			</div>
		</c:if>
		<div class='hyn'>
			<c:if test="${not empty sessionScope.user}">
				<p>
					您好,<a href=""><b>${user.name}</b> </a> <span class="separe">|</span><a
						id="TopLink_MessageBox" href="">消息(<span id="MessagesCount"
						style="color: red;font-weight:bold ;">5</span>) </a> <span
						class="separe">&nbsp;|&nbsp;</span><a href="users/usercenter.jsp">个人中心</a><span
						class="separe">|</span>
					<c:if test="${sessionScope.user.role eq 'a'}">
						<a href="admin/main.jsp" target="_blank">后台管理<span
							class="separe">|</span> </a>
					</c:if>
					<a href="user/logout">退出</a>
				</p>
				<p>提问:3 | 回答:5</p>
			</c:if>
			<c:if test="${empty sessionScope.user}">
				<p>
					您好，欢迎！[<a href="login.jsp">请登录</a>]
				</p>
			</c:if>
		</div>
	</div>
	<div class="clr"></div>
</div>
<div class="h_mid">
	<div class="h_mid_l"></div>
	<div id="tdh" class="h_mid_m">
		<ul>
			<li class="on"><a title="首页" href="">首页</a>
			</li>
			<li><a title="在线教程" href="">在线教程</a>
			</li>
			<li><a title="知识专题" href="">知识专题</a>
			</li>
			<li><a title="问答专家" href="">技术文章</a>
			</li>
			<li><a title="问答专家" href="">在线测试</a>
			</li>
			<li><a title="问答专家" href="">电子资料</a>
			</li>
			<li><a title="问答专家" href="">常用软件</a>
			</li>
			<li><a title="问答专家" href="">站内搜索</a>
			</li>
			<li><a title="问答专家" href="">规章制度</a>
			</li>
		</ul>
	</div>
	<div class="h_mid_r"></div>
</div>
<div class="clr"></div>