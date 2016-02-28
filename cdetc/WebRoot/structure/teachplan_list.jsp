<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>授课安排列表</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#new").click(function(){
		});
	});
</script>
</head>

<body>
<div id="serach">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;查询条件
			</legend>
			班级:<select name="classId">
					<option value="">不限</option>
				<c:forEach items="${classes}" var="clazz">
					<option value="${clazz.id}">${clazz.name}</option>
				</c:forEach>
			</select>
			讲师:<select name="teacherId">
					<option value="">不限</option>
				<c:forEach items="${teachers}" var="teacher">
					<option value="${teacher.id}">${teacher.name}</option>
				</c:forEach>
			</select>
			<input type="submit" value=" 查  询 " class="oprbtn"> 
			<input type="reset" value=" 重  置 " class="oprbtn">
		</fieldset>

	</div>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;授课安排列表
			</legend>
			<div id="datalist">
				<table width="70%">
					<thead>
						<tr id="tableheader">
							<th><input type="checkbox" />选择</th>
							<th>序号</th>
							<th>班级</th>
							<th>讲师</th>
							<th>开始时间</th>							
							<th>结束时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${teachplans}" var="teachplan" varStatus="s">
							<tr>
								<td class="center"><input name="checkbox4" type="checkbox"
									value="checkbox" /></td>
								<td>${s.count}</td>
								<td>${teachplan.className}</td>
								<td>${teachplan.teacherName}</td>
								<td>${teachplan.startTime}</td>
								<td>${teachplan.endTime}</td>
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

