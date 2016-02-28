<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>列表</title>
<link href="${pageContext.request.contextPath}/css/default/ask.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="top">
		<c:import url="top.jsp"></c:import>
	</div>
	<div class="header">
		<c:import url="header.jsp" />
	</div>

	<div class="content">
		<div class="dh">
			<a href="">互动问答网</a>
		</div>
		<div class="cleftbox">
			<p class="blank10"></p>
			<div class="title">
				<ul>
					<li class="on">全部问题</li>
					<li class="current_none"><a href=""><font color="#ff6600">？</font>待解决</a>
					</li>
					<li class="current_none"><a href=""><font color="#1bbf00">√
						</font>已解决</a></li>
				</ul>
				<div class="blank0"></div>
			</div>

			<div class="clist">
				<ul>
					<li class="li1"><span id="loading"></span>标题(共3条)</li>
					<li class="li2">回答/查看</li>
					<li class="li3">状态</li>
					<li class="li4">提问时间</li>
				</ul>
				<ul>
					<li class="li1"><a
						href="" target="_blank"
						title="Struts2标签的介绍">Struts2标签的介绍</a> &nbsp;<span class="lei">[<a
							target="_blank" href="" title="基础" class="lei">基础</a>] 
					</li>
					<li class="li2">1/15</li>
					<li class="li3"><img src="css/common/icn_6.gif" /></li>
					<li class="li4">2012/03/28 00:07</li>
				</ul>
				<ul>
					<li class="li1"><a href="" target="_blank" title="我来测试一下">我来测试一下</a>
						&nbsp;<span class="lei">[<a target="_blank" href=""
							title="Spring" class="lei">Spring</a>] 
					</li>
					<li class="li2">1/9</li>
					<li class="li3"><img src="css/common/icn_1.gif" /></li>
					<li class="li4">2012/03/28 00:04</li>
				</ul>
				<ul>
					<li class="li1"><a href="" target="_blank"
						title="我想请问Java简单吗？">我想请问Java简单吗？</a> &nbsp;<span class="lei">[<a
							target="_blank" href="" title="Java基础" class="lei">Java基础</a>] 
					</li>
					<li class="li2">1/12</li>
					<li class="li3"><img src="css/common/icn_2.gif" /></li>
					<li class="li4">2012/03/27 23:58</li>
				</ul>
			</div>
			<div class="blank20"></div>
			<div class="pages">
				<div class="scott"></div>
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<!--footer-->
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>
