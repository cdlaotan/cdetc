<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="etc" uri="/etc/utils" %>
<!DOCTYPE html>
<html>
<head>
<title>题目列表</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#new").click(function(){
			location.href="${base}/question/add.do";
		});
	});
</script>
</head>

<body>
	<div id="main">
		<div id="serach">
			<fieldset>
				<legend>
					<img src="images/311.gif" />&nbsp;查询条件
				</legend>
				题型：<input type="text"> 题干：<input type="text"> <input
					type="submit" value=" 查  询 " class="oprbtn">
			</fieldset>

		</div>
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;题目列表
			</legend>
			
			<div id="datalist">
				<table width="90%">
					<thead>
						<tr id="tableheader">
							<th width="60"><input type="checkbox" />选择</th>
							<th width="60">序号</th>
							<th>题干</th>
							<th width="60">题型</th>							
							<th width="60">难度</th>
							<th width="60">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${questions}" var="question" varStatus="s">
							<tr>
								<td class="center"><input name="checkbox4" type="checkbox"
									value="checkbox" /></td>
								<td>${s.count}</td>
								<td><etc:formate value=" ${question.content}" escapeHTML="true" remainLength="20"/> </td>
								<td>${question.questypeName}</td>
								<td>${question.difficulty}</td>
								<td>${question.status}</td>
								<td class="center"><img src="images/037.gif" width="9"
									height="9" />[<a href="#">编辑</a>]<img src="images/010.gif" width="9"
									height="9" /> [<a href="#">删除</a>]</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="nav" >
				<table width="80%" align="center">
					<tr>
						<td align="left">共120条纪录，当前第1/10页，每页10条纪录</td>
						<td align="right"><img src="images/first.gif" /> <img src="images/back.gif" /> <img
						src="images/next.gif" /> <img src="images/last.gif">
						<select ><option>1</option><option>2</option></select>
						</td>
					</tr>
				</table>
			</div>
			<div id="opr">
				<input type="button" value=" 新  增 " class="oprbtn" id="new" /> <input
					type="button" value=" 删  除 " class="oprbtn" />
			</div>
		</fieldset>
	</div>
</body>
</html>

