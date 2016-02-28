<%@ page language="java" pageEncoding="UTF-8"%>
<div class="uleft">
	<div class="tximg">
		<img width="100px" height="100px" src="${sessionScope.user.avatar}" alt="${sessionScope.user.name}" title="${sessionScope.user.name}">
	</div>
	<div class="txname">
		${sessionScope.user.name} <img src="css/default/online.gif" align="absmiddle" title="当前在线"
			alt="当前在线" />
	</div>
	<div class="clr"></div>
	<div class="list">
		<h1 class="on">
			<a title="我的主页" href="users/usercenter.jsp"><img width="16" height="16"
				align="absmiddle" src="css/default/myhome.gif" /> &nbsp;我的主页</a>
		</h1>
		<h1>
			<a title="我的问答" href="users/myanswers.jsp"><img width="16px"
				height="15px" align="absmiddle" src="css/default/myanswer.gif" />
				&nbsp;我的问答</a>
		</h1>
		<h1 class="">
			<a title="我的消息" href="users/mymsges.jsp"><img width="16px"
				height="16px" align="absmiddle" src="css/default/mymsg.gif" />
				&nbsp;我的消息</a>
		</h1>
		<h1 class="">
			<a title="我收藏的问题" href="users/mycollects.jsp"><img width="14"
				height="15" align="absmiddle" src="css/default/mycollect.gif" />
				&nbsp;我的收藏</a>
		</h1>
	</div>
</div>
