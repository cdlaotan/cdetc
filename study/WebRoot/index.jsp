<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<base href="${base}/" />
<title>首页-中软国际卓越培训中心(成都)</title>
<link rel="shortcut icon" href="favicon.ico" />
<link href="css/default/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/slides.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#slides').slides({
			preload : true,
			generateNextPrev : false,
			play : 5000,
			container : 'slides_container'
		});
	});
</script>
</head>
<body>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<!--左边分类开始-->
		<div class="left">
			<!--问题分类开始-->
			<div class="wtfl">
				<div class="wtfl_t"></div>
				<div class="wtfl_m">
					<div class="wtfl_m_t">
						<div class="wt_l">&nbsp;问题分类</div>
						<div class="clr"></div>
						<div id="rmc"></div>
					</div>
					<div id="siderbar">
						<div id="secNav">
							<ul id="secNavList">

								<li>
									<div class="iconBg">
										<a href="viewquestion.jsp" title="Java">Java</a><span
											class="categorynum">3</span>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="wtfl_b"></div>
			</div>
			<!--问题分类结束-->
			<div class="topscore">
				<div class="l_b_t"></div>
				<div class="l_b_m">
					<div class="l_b_m_t">
						<div class="mc">
							<div class="ivote"></div>
							积分排行榜
						</div>
						<div class="phb">
							<ul>
								<li onclick="showtop('week')" id="weektab" class="on">本周排行</li>
								<li onclick="showtop('all')" id="alltab" class="">总排行</li>
							</ul>
							<div class="clr"></div>
						</div>
					</div>
					<div class="clr"></div>
					<div class="l_b_m_m">
						<div id="weektop" class="yshy" style="display: block;">
							<ul>
								<li><span class="hyname"><img align="absmiddle"
										src="css/default/num1.gif"> <a target="_blank" href="">tanlan</a>
								</span> <img align="absmiddle" src="css/default/up.gif">27 
								</li>
								<li><span class="hyname"><img align="absmiddle"
										src="css/default/num2.gif"> <a target="_blank" href="">admin</a>
								</span> <img align="absmiddle" src="css/default/up.gif">9 
								</li>
							</ul>
						</div>
						<div id="alltop" class="yshy" style="display:none;">
							<ul>
								<li><span class="hyname"><img align="absmiddle"
										src="css/default/num1.gif"> <a target="_blank" href="">admin</a>
								</span> <img align="absmiddle" src="">109 
								</li>
								<li><span class="hyname"><img align="absmiddle"
										src=""> <a target="_blank" href="">tanlan</a> </span> <img
									align="absmiddle" src="">27 
								</li>

							</ul>
						</div>
						<div class="listcon"></div>
						<div class="more">
							<a ttarget="_top" title="查看更多排行榜" href="">查看更多排行榜&gt;&gt;</a>
						</div>
						<div class="clr"></div>

					</div>
				</div>
				<div class="l_b_b"></div>
			</div>

			<!--知道小贴士开始-->
			<div class="cjjb">
				<div class="l_b_t"></div>
				<div class="l_b_m">
					<div class="l_b_m_t1">
						<div class="mc">
							<div class="irelate"></div>
							学员管理规章制度
						</div>
					</div>
					<div class="clr"></div>
					<div class="l_b_m_m">
						<div class="xts">
							<ul>
								<li><a target="_blank" title="" href=""></a>
								</li>
								<li><a target="_blank" title="" href=""></a>
								</li>
								<li><a target="_blank" title="" href=""></a>
								</li>
								<li><a target="_blank" title="" href=""></a>
								</li>
							</ul>
						</div>
						<div class="tsyjy">
							如要投诉或提出意见，请点击<br><a title="投诉与建议"
								href="mailto:webmaster@domain.com"><input type="button"
									class="button1" value="建议反馈" /> </a>
						</div>
					</div>
				</div>
				<div class="l_b_b"></div>
			</div>
			<!--知道小贴士结束-->

		</div>
		<div class="b_right">
			<div class="middle">
				<div class="rdtj">
					<div class="rdtj_t"></div>
					<div class="rdtj_m">
						<div id="slides">
							<div class="slides_container">

								<div>
									<div class="hdp">
										<img src="" width="270px" height="222px" />
									</div>
									<div class="hdpr">
										<strong style="color:#9C9A9A">推荐专题</strong>
										<h1>
											<a href="">Java基础</a>
										</h1>
										<p>Java基础语法，技术点</p>
										<ul>

											<li><a class="hotTitscontlia" title="这事一个小问题"
												target="_blank" href="">这事一个小问题</a></li>

										</ul>
									</div>
								</div>

								<div>
									<div class="hdp">
										<img
											src="http://localhost/tipask//data/attach/topic/topiczaktNP.jpg"
											width="270px" height="222px" />
									</div>
									<div class="hdpr">
										<strong style="color:#9C9A9A">推荐专题</strong>
										<h1>
											<a href="http://localhost/tipask/?category/recommend.html#2">Oracle</a>
										</h1>
										<p>数据库</p>
										<ul>

											<li><a class="hotTitscontlia" title="这事一个小问题"
												target="_blank" href="http://localhost/tipask/?q-1.html">这事一个小问题</a>
											</li>

										</ul>
									</div>
								</div>

							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="rdtj_b"></div>
				</div>
				<!--精彩推荐开始-->
				<div class="m_wt">
					<div class="m_wtt">
						<ul>
							<li class="a1"></li>
							<li class="a2">
								<div class="a2t">精彩推荐</div>
								<div class="more">
									<a target="_top" title="更多问题" href="">更多文章</a>
								</div></li>
							<li class="a3"></li>
						</ul>
						<div class="clr"></div>
					</div>
					<div class="m_wtm">
						<div id="weijieList">
							<ul>
								<c:forEach begin="1" end="5">
									<li><a target="_blank" href="" title=""></a>&nbsp;<span
										class="lei">[<a target="_blank" href="" title="">XXX</a>]
									</span><span class="qanswers">2评论/3查看</span>
									</li>
								</c:forEach>
							</ul>

						</div>
					</div>
					<div class="m_wtb"></div>
				</div>
				<!--精彩推荐结束-->

				<!--待解决问题开始-->
				<div class="m_wt">
					<div class="m_wtt">
						<ul>
							<li class="a1"></li>
							<li class="a2">
								<div class="a2t">经典面试题</div>
								<div class="more">
									<a target="_top" title="更多问题" href="questionlist.jsp">更多问题</a>
								</div></li>
							<li class="a3"></li>
						</ul>
						<div class="clr"></div>
					</div>

					<div class="m_wtm">
						<div id="weijieList">
							<ul>
								<c:forEach begin="1" end="5">
									<li><a target="_blank" href="" title=""></a>&nbsp;<span
										class="lei">[<a target="_blank" href="" title="">XXX</a>]
									</span><span class="qanswers">2回答</span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="m_wtb"></div>
				</div>
				<!--待解决问题结束-->
			</div>
			<div class="right">
				<div class="ty">
					<div class="tyt"></div>
					<div class="tym">
						<div class="tym_t">
							<div class="mc">
								<img src="css/default/note.gif"
									class="noteicon" /> 中心公告
							</div>
						</div>
						<div class="tym_m">
							<ul>

								<li><a href=""
									title="好的">好的</a>
								</li>

								<li><a href=""
									title="Hello22">Hello22</a>
								</li>

								<li><a href=""
									title="Hello">Hello</a>
								</li>

								
							</ul>
							<div class="more1">
								<a href=""
									target="_blank" title="查看全部公告">查看全部公告</a>
							</div>
						</div>
					</div>
					<div class="tyb"></div>
				</div>
				<div class="rb_zj">
					<div class="rb_zj_t"></div>
					<div class="rb_zj_m">
						<div class="rb_zj_mt">
							<div class="istar"></div>
							推荐之星
						</div>
						<div class="rb_zj_mm">

							<div class="rb_zj_mmc">
								<div class='zjimg'>
									<a href="http://localhost/tipask/?u-2.html" target='_blank'><img
										src="http://localhost/tipask/data/avatar/000/00/00/small_000000002.jpg"
										width='50px' height='50px' /> </a>
								</div>
								<div class='jbzl'>
									<a href="http://localhost/tipask/?u-2.html" target='_blank'>tanlan</a><br />
									回答数:0<br /> 提问数:1
								</div>
								<div class='clr'></div>
							</div>
							<div class="clr"></div>

							<div class="more2">
								<a href="http://localhost/tipask/?user/famouslist.html"
									target="_blank" title="历届知道之星">历届知道之星>> </a>
							</div>
						</div>
					</div>
					<div class="rb_zj_b"></div>
				</div>
				<div class="rb_zj">
					<div class="rb_zj_t"></div>
					<div class="rb_zj_m">
						<div class="rb_zj_mt1">
							<img src="http://localhost/tipask/css/default/user.png"
								class="noteicon" alt="知道专家" />知道专家
						</div>
						<div class="rb_zj_mm">

							<div class="more2">
								<a href="http://localhost/tipask/?expert/default.html"
									target="_blank" title="查看更多">查看更多专家</a>
							</div>
						</div>
					</div>
					<div class="rb_zj_b"></div>
				</div>
			</div>
			<div class="clr"></div>
		</div>
	</div>
	<div class="clr"></div>
	<!--友情链接-->
	<div class="jklm">
		<div class="jklmm">
			<h3>友情链接</h3>
			<div class="lm">

				<a target="_blank" href="" title="中软">
					中软 </a> <a target="_blank" href="http://www.baidu.com"
					title="百度一下，你就知道"> 百度 </a>

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