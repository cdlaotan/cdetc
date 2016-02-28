<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<base href="${base}/">
<title>提出问题</title>
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="ueditor/themes/default/css/ueditor.css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script type="text/javascript">
	function getCategory(parentId) {
		$.getJSON("category/get", function(categories) {

		});
	}
	$(function() {
		var option = {
			toolbars : [ [ 'fullscreen', 'source', '|', 'undo', 'redo', '|',
					'bold', 'italic', 'superscript', 'subscript',
					'removeformat', 'pasteplain', 'selectall', 'cleardoc', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'justifyjustify', '|', 'imagenone', 'imageleft',
					'imageright', 'imagecenter', '|', 'insertimage', 'emotion',
					'map', 'insertcode', 'preview', 'searchreplace', 'help' ] ],
			initialFrameWidth : 550,
			initialFrameHeight : 300
		};
		var editor = new baidu.editor.ui.Editor(option);
		editor.render("mydescription");

		$.getJSON("category/get/0", function(categories) {
			for ( var i in categories) {
				$("#categoryId").append(
						"<option value='"+categories[i].id+"'>"
								+ categories[i].name + "</option>");
			}
		});
		$(document)
				.on(
						"change",
						".catselect2",
						function() {
							//将后边所有的select移除掉
							var newSelect = "<select size='8' class='catselect2' ></select>";
							$
									.getJSON(
											"category/get/" + $(this).val(),
											function(categories) {
												//判断是否有数据查询回来

												//$(newSelect).attr("name"."cateid")

												for ( var i = 0; i < categories.length; i++) {

													$(newSelect)
															.append(
																	"<option value='"+categories[i].id+"'>"
																			+ categories[i].name
																			+ "</option>");
													//$("#catesSelect").find("select :last").append("<option value='"+cates[i].id+"'>"+cates[i].name+"</option>");
													//alert($(newSelect).html());
													//$(newSelect).append(s);
												}
												$("#catesSelect").append(
														newSelect);

											});
						});

		$("#addquestion")
				.on(
						"click",
						function() {
							var userId = "${sessionScope.user.id}";
							//用户没有登录，弹出登录框要求用户登录
							if (userId == "") {
								$
										.dialog({
											id : "loginDialog",
											content : "url:login_dialog.jsp",
											height : '160px',
											width : '400px',
											lock : true,
											max : false,
											min : false,
											title : '用户登录',
											ok : function() {
												var result = false;
												var username = $.dialog.list["loginDialog"].content
														.$("#username").val();
												var password = $.dialog.list["loginDialog"].content
														.$("#password").val();
												$.ajax({
													type : "get",
													url : "user/ajaxlogin",
													data : {
														"name" : username,
														"password" : password
													},
													dataType : "json",
													success : function(r) {
														result = r;
														if (r) {

														}
													},
													async : false
												});
												return result;
											},
											okVal : '登录',
											cancel : true
										});
							} else {
								//直接提交问题
							}
						});
	});
</script>
</head>

<body>
	<div class="top">
		<c:import url="top.jsp"></c:import>
	</div>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<div class="dh" id="pos">
			<a href="">问答平台首页</a>&gt; 提问问题
		</div>
		<div class="left1">
			<div class="leftt">
				<ul>
					<li class="a1"></li>
					<li class="a2"><div class="juzhong">提问问题</div></li>
					<li class="a3"></li>
				</ul>
			</div>
			<div class="clr"></div>
			<div class="leftc">
				<div class="tw_t">请将您的问题告诉我们:</div>
				<div class="askfgx"></div>
				<form name="askform" action="question/add" method="post">
					<div class="tiwen">
						<div class="shur1">
							<h2>您的问题:</h2>
							<input type="text" maxlength="100" size="65" name="title"
								value="" id="mytitle" class="input1" />
						</div>
						<div class="clr"></div>
						<div class="shur1">
							<h2>问题描述:</h2>
							<script type="text/plain" id="mydescription" name="content"
								style="width:550px;margin-left:75px;display:block;"></script>
						</div>
						<div class="clr"></div>
						<div class="shur1">
							<h2>标签(TAG):</h2>
							<c:forEach begin="1" end="5">
								<input type="text" maxlength="8" name="tagNames" class="input4"
									value="" />
							</c:forEach>
						</div>
						<div class="clr"></div>
						<div class="shur shur3">
							<h2>问题分类</h2>
							<div id="classnav" name="classnav">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr valign="top">
										<td width="15%" id="catesSelect"><select id="categoryId"
											class="catselect2" size="8" name="cateId">
										</select>
										</td>
									</tr>
									<tr valign="top">
										<td class="tiw_biaozhu" align="left" valign="middle">请您选择正确的分类，以使您的问题尽快得到解答。</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="clr"></div>
						<div class="shur shur2">
							<h2>问题设置</h2>
							<div class="shezhi">
								<h3>悬赏分:</h3>
								<select name="scorelist" id="scorelist" class="select1"
									onchange="otherscore();">
									<option selected="selected" value="0">0</option>
									<option value="1">1</option>
									<option value="3">3</option>
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="30">30</option>
									<option value="50">50</option>
									<option value="80">80</option>
									<option value="100">100</option>
									<option value="other">其他</option>
								</select>&nbsp;<span class="zhusi" style="display:none;" id="showscore"><input
									type="text" maxlength="8" name="givescore" id="givescore"
									class="input4" value="0" /> </span>&nbsp;分 &nbsp;<span class="zhusi">您目前的财富值:20
									悬赏分越高，您的问题会越受关注。</span>
								<div class="clr"></div>
								<h3>匿名设定:</h3>
								<input type="checkbox" name="hidanswer" value="1"
									class="checkbox1" />&nbsp;<span class="zhusi">您需要付出财富值10分</span>
								<div class="clr"></div>
								<input type="hidden" value="0" name="cid" /> <input
									type="hidden" value="0" name="askfromuid" />
							</div>
						</div>
						<div class="asksubmit">
							<button name="submit" type="submit" class="btn_addques"
								id="addquestion"></button>
						</div>
						<div class="clr"></div>
					</div>
				</form>
			</div>
			<div class="clr"></div>
			<div class="leftb"></div>
		</div>
		<div class="right1">
			<div class="gg">
				<div class="ggtitle">
					<ul>
						<li class="gga1"></li>
						<li class="gga2">
							<div class="juzhong">
								<div class="qico">
									<div class="irelate"></div>
								</div>
								别人都在问什么
							</div>
						</li>
						<li class="gga3"></li>
					</ul>
				</div>
				<div class="clr"></div>
				<div class="ggcon">
					<ul>
						<li><a title="招人！求推荐！" target="_blank" href="">招人！求推荐！</a></li>
						<li><a title="不晓得现在学习Oracle有前途吗？我有此打算，大家有兴趣吗？一起"
							target="_blank" href="">不晓得现在学习Oracle有前 ...</a></li>
						<li><a title="最近想学习一下php，请给个建议" target="_blank" href="">最近想学习一下php，请给...</a>
						</li>
						<li><a title="这个问题不好问" target="_blank" href="">这个问题不好问</a></li>
						<li><a title="以下代码有问题吗" target="_blank" href="">以下代码有问题吗</a>
						</li>
					</ul>
				</div>
				<div class="ggbuttom">
					<ul>
						<li class="ggba1"></li>
						<li class="ggba2"></li>
						<li class="ggba3"></li>
					</ul>
				</div>
				<div class="clr"></div>
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