<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>班级列表</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#newclass").click(function(){
			location.href="class/add";
		});
	});
</script>
</head>

<body>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;班级列表
			</legend>
			
			<div id="datalist">
				<table width="80%">
					<thead>
						<tr id="tableheader">
							<th><input type="checkbox" />选择</th>
							<th>序号</th>
							<th>班级名称</th>
							<th>技术类别</th>
							<th>班级人数</th>
							<th>开班时间</th>
							<th>结训时间</th>
							<th>班级状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${classes}" var="clazz" varStatus="s">
							<tr>
								<td class="center"><input name="checkbox4" type="checkbox"
									value="checkbox" /></td>
								<td>${s.count}</td>
								<td>${clazz.name}</td>
								<td>${clazz.subjectName}</td>
								<td>${clazz.stuNums}</td>
								<td>${clazz.startTime}</td>
								<td>${clazz.endTime}</td>
								<td>${clazz.status}</td>
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
				<input type="button" value=" 新  增 " class="oprbtn" id="newclass" /> <input
					type="button" value=" 删  除 " class="oprbtn" />
			</div>
		</fieldset>
	</div>
</body>
</html>

