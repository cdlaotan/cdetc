<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>知识点列表</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>

<link rel="stylesheet" href="styles/zTreeStyle.css" type="text/css">

<script type="text/javascript" src="js/jquery.ztree.all-3.4.js"></script>
<script type="text/javascript">
$(function() {
	$("#new").click(function() {
		location.href = "${base}/knowledge/add.do";
	});
});
</script>
<style type="text/css">

</style>
</head>

<body>

	<div id="main">
	<div id="serach">
			<fieldset>
				<legend>
					<img src="images/311.gif" />&nbsp;查询条件
				</legend>
				知识点：<input type="text"> 技术类别：<input type="text"> <input
					type="submit" value=" 查  询 " class="oprbtn">
			</fieldset>

		</div>
		<div id="knowledge">
			<fieldset>
				<legend>
					<img src="images/311.gif" />&nbsp;知识点列表
				</legend>
				
				<div id="datalist">
					<table width="90%">
						<thead>
							<tr id="tableheader">
								<th><input type="checkbox" />选择</th>
								<th>序号</th>
								<th>知识点</th>
								<th>技术类别</th>
								<th>题目数量</th>
								<th>状态</th>
								<th>编辑</th>
								<th>删除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${knowledges}" var="knowledge" varStatus="s">
								<tr>
									<td class="center"><input name="checkbox4" type="checkbox"
										value="checkbox" />
									</td>
									<td>${s.count}</td>
									<td>${knowledge.name}</td>
									<td><c:forEach items="${knowledge.techtypes}"
											var="techtype">${techtype.name}--></c:forEach>
									</td>
									<td>${knowledge.quesNums}</td>
									<td>${knowledge.status}</td>
									<td class="center"><img src="images/037.gif" width="9"
										height="9" />[<a href="#">编辑</a>]</td>
									<td class="center"><img src="images/010.gif" width="9"
										height="9" /> [<a href="#">删除</a>]</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="opr">
					<input type="button" value=" 新  增 " class="oprbtn" id="new" /> <input
						type="button" value=" 删  除 " class="oprbtn" />
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>

