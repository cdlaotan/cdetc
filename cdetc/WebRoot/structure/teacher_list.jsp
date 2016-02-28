<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>老师列表</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#newuser").click(function(){
			location.href="${base}/teacher/add.do";
		});
	});
</script>
</head>

<body>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;老师列表
			</legend>
			<div id="datalist">
				<table width="90%">
					<thead>
						<tr id="tableheader">
							<th><input type="checkbox" />选择</th>
							<th>序号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>职位</th>
							<th>技术类型</th>							
							<th>绑定帐号</th>
							<th>出生年月</th>
							<th>入职时间</th>
							<th>离职时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${teachers}" var="teacher" varStatus="s">
							<tr>
								<td class="center"><input name="checkbox4" type="checkbox"
									value="checkbox" /></td>
								<td>${s.count}</td>
								<td>${teacher.name}</td>
								<td>${teacher.gender}</td>
								<td>${teacher.jobs}</td>
								<td>${teacher.subjectName}</td>
								<td></td>
								<td>${teacher.birthdate}</td>
								<td>${teacher.entryTime}</td>
								<td>${teacher.quitTime}</td>
								<td>${teacher.status}</td>
								<td class="center"><img src="images/037.gif" width="9"
									height="9" />[<a href="#">编辑</a>]
									<img src="images/010.gif" width="9"
									height="9" /> [<a href="#">删除</a>]</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="opr">
				<input type="button" value=" 新  增 " class="oprbtn" id="newuser" /> <input
					type="button" value=" 删  除 " class="oprbtn" />
			</div>
		</fieldset>
	</div>
</body>
</html>

