<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>查看问题</title>
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/editor_config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/editor_all_min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ueditor/themes/default/ueditor.css" />
</head>

<body>
	<div class="top">
		<c:import url="top.jsp"></c:import>
	</div>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<!--问题分类导航开始-->
		<div class="dh">
			<a href="">互动问答网</a> &gt; <a href="">${question.cname}</a>
		</div>
		<!--问题分类导航结束-->
		<div class="leftbox">
			<!--问题开始-->
			<div class="wenti">
				<div class="wttitle">
					<ul>
						<li class="wta1"></li>
						<li class="wta2">
							<div class="qico">
								<div class="iwhy"></div>
							</div> <c:if test="${question.state eq 1}">未解决</c:if> <c:if
								test="${question.state eq 2}">已解决</c:if></li>
						<li class="wta3"></li>
						<li class="wta4"></li>
					</ul>
					<div class="clr"></div>
				</div>
				<div class="wtallcont">
					<div class="wtleft">
						<div class="readFace" id="userinfo-2"></div>
						<div class="touxiang">
							<a href="" target="top"> <img align="absmiddle" src="css/default/avatar.gif"
								alt="${question.uname}" onmouseout="closeuserinfo();"
								onmouseover="showuserinfo('2');" /> </a>
						</div>
						<div class="hyxinxi">
							<a href="" target="top">${question.uname}</a>
						</div>
					</div>
					<div class="wtright">
						<div class="wtt">
							<h1 class="wttit">${question.title}</h1>
							<div class="xs">
								<span class="twsj"> <img src="css/default/lefttime.gif" />
									离问题结束还有48天11小时&nbsp;&nbsp; 浏览次数:<span id="views">${question.viewNums}</span>
								</span>
							</div>
						</div>
						<div class="qfgx"></div>
						<div class="wtcont" id="mydescription">
							<p>&nbsp;</p>
						</div>
						<div class="clr"></div>
						<c:if test="${user.id eq question.uid}">
							<div class="wlhdb">
								<h1>处理问题：</h1>
								<p>如果已获得满意的回答，请及时采纳，感谢回答者。若还没有满意的回答，可以尝试以下操作：</p>
								<span class="questioncontrol"><input type="button"
									value="问题补充" name="supply_question" onclick="showsupply();"
									class="button1" title="补充提问细节，以得到更准确的答案" /> </span> <span
									class="questioncontrol"><input type="button"
									value="关闭问题" name="supply_question" onclick="" class="button1"
									title="无满意答案的回答，可以直接结束提问，关闭问题" /> </span>
								<form name="closeForm" action="" method="post">
									<input type="hidden" value="2" name="qid" />
								</form>
								<div id="mysupplydiv" style="display: none;">
									<h5>问题补充</h5>
									补充提问细节，以得到更准确的答案
									<form name="supplyForm" action="" method="post">
										<span class="innerrightspan"><input type="button"
											class="button4" value="提交" onclick="check_mysupply();" /> </span>
									</form>
								</div>
							</div>
						</c:if>
						<div class="clr"></div>
					</div>
					<div class="clr"></div>
				</div>
				<div class="wtbuttom">
					<ul>
						<li class="wtba1"></li>
						<li class="wtba2"></li>
						<li class="wtba3"></li>
						<li class="wtba4"></li>
					</ul>
					<div class="clr"></div>
				</div>
			</div>
			<!--问题结束-->
			<div class="qitawenda">
				<div class="ianswer"></div>
				网友的回答&nbsp;<span class="qtnum">(共${fn:length(answers)}个回答)</span>
			</div>

			<!--回答开始-->
			<c:forEach items="${answers}" var="answer">
				<div class="qita">
					<div class="qitat"></div>
					<div class="qtallcont">
						<div class="qtleft">
							<div class="readFace" id="userinfo-2"></div>
							<div class="touxiang">
								<a target="_blank" href=""><img align="absmiddle"
									src="css/default/avatar.gif" alt="${answer.uname}"
									onmouseout="closeuserinfo();" onmouseover="showuserinfo('2');" />
								</a>
							</div>
							<div class="hyxinxi">
								<span class="name"><a target="_blank" href="">${answer.uname}</a>
								</span>

							</div>
						</div>
						<div class="qtright">
							<div class="qtt">
								<img align="absmiddle" src="css/default/lefttime.gif" />
								回答于:5小时前
							</div>
							<div class="clr"></div>
							<div class="qfgx"></div>
							<div class="qtcont">
								<div class="wtcont" id="mc0">${answer.content}</div>
								<div class="blank10"></div>
								<div class="clr"></div>
								<!--如果是提问者并且不是匿名用户，则显示“采纳为答案”按钮-->
								<!--如果是回答者自己，则显示“修改答案”按钮-->
								<c:if test="${user.id eq answer.uid}">
								<input type="button" value="修改答案" name="button"
									onclick="showeditanswer('0')" class="button1" />&nbsp;
								<div class="clr"></div>
								<div id="editanswerdiv0" style="display: none;">
									<h5>修改回答内容</h5>
									<form name="editanswerForm0" id="editanswerForm0" action=""
										method="post">
										<input type="hidden" value="4" name="qid" /> <input
											type="hidden" value="2" name="aid" />
										<script type="text/plain" id="answercontet0" name="content"><p>DWR是一个Ajax框架，好东西啊，强烈推荐学习！</p><p><img src="http://localhost/ask/data/attach/1206/zI9fi3PL.jpg" style="float:none;" title="3bc6f750352e8c1c1038c2e1.jpg" border="0" hspace="0" vspace="0" /></p></script>
										<script type="text/javascript">
											var editoranswer0 = new baidu.editor.ui.Editor(
													editor_options);
											editoranswer0
													.render("answercontet0");
										</script>
										<span class="innerrightspan"><input type="button"
											class="button4" value="提交"
											onclick="check_editanswer(editoranswer0,'0');" /> </span>
									</form>
									<div class="blank10"></div>
								</div>
								</c:if>
								<c:if test="${user.id eq question.uid}">
									<input type="button" value="采纳为答案" name="button"
									onclick="showeditanswer('0')" class="button1" />&nbsp;
								</c:if>
								<div class="clr"></div>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="qtbuttom">
						<ul>
							<li class="qtba1"></li>
							<li class="qtba2"></li>
							<li class="qtba3"></li>
							<li class="qtba4"></li>
						</ul>
						<div class="clr"></div>
					</div>
				</div>
			</c:forEach>
			<div class="pages">
				<div class="scott"></div>
			</div>
			<!--回答结束-->
		</div>

		<!--回答问题开始-->
		<div class="blank10"></div>
		<c:if test="${user.id ne question.uid}">
			<div class="zjpl">
				<div class="zjpltitle">
					<ul>
						<li class="zjpla1"></li>
						<li class="zjpla2"><div class="juzhong">&nbsp;我帮TA解答：</div></li>
						<li class="zjpla3"></li>
					</ul>
					<div class="clr"></div>
				</div>
				<div class="zjplcon">
					<form name="answerForm" action="AnswerServlet" method="post">
						<input type="hidden" value="add" name="opr"> <input
							type="hidden" value="${question.id}" name="qid"> <script
									type="text/plain" id="mycontent" name="content"
									style="width:740px;margin-left: 4px;"></script> <script
									type="text/javascript">
										var mycontent = new baidu.editor.ui.Editor();
										mycontent.render("mycontent");
									</script>
								<p class="zjplbr">
									<input type="submit" value="" align="absmiddle"
										class="subanswer" name="mybutton" />
								</p>
					</form>

				</div>
				<div class="zjpjbuttom">
					<ul>
						<li class="zjplba1"></li>
						<li class="zjplba2"></li>
						<li class="zjplba3"></li>
					</ul>
					<div class="clr"></div>
				</div>
			</div>
		</c:if>
		<!--回答问题结束-->
	</div>
	</div>
	</div>
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>
