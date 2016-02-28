<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>选择学员</title>
<base href="${base}/"></base>
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
    var selectedStudent=[];
	$(function(){
		$(":radio[name=studentId]").click(function(){
			selectedStudent[0]=$(this).val();
			selectedStudent[1]=$(this).parent().next().next().text();
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
				姓名：<input type="text" name="name" size="6"> 
				班级：<select name="classid">
					<option value="">不限</option>
				<c:forEach items="${classes}" var="clazz">
					<option value="${clazz.id}">${clazz.name}</option>
				</c:forEach>
				</select>
				是否已分配用户名：
				<input type="radio" value="" checked="checked" name="assign" id="all"><label for="all">不限</label>
				<input type="radio" value="" name="assign" id="assigned"><label for="assigned">已分配</label>
				<input type="radio" value="" name="assign" id="unassigned"><label for="unassigned">未分配</label>
				<input type="submit" value=" 查  询 " class="oprbtn">
			</fieldset>
		</div>
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;学员列表
			</legend>
			
			<div id="datalist">
				<table>
					<thead>
						<tr id="tableheader">
							<th width="60">选择</th>
							<th width="60">序号</th>
							<th width="80">姓名</th>
							<th width="80">性别</th>
							<th width="100">所在班级</th>
							<th width="100">分配用户名</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageBean.data}" var="student" varStatus="s">
							<tr>
								<td class="center"><input name="studentId" type="radio"
									value="${student.id}" /></td>
								<td class="center">${s.count}</td>
								<td class="center">${student.name}</td>
								<td class="center">${student.gender}</td>
								<td class="center">${student.className}</td>
								<td class="center">${student.account}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br />
			<div id="nav" >
				<table width="90%" align="center">
					<tr>
						<td align="left">共120条纪录，当前第1/10页，每页10条纪录</td>
						<td align="right"><img src="images/first.gif" /> <img src="images/back.gif" /> <img
						src="images/next.gif" /> <img src="images/last.gif">
						<select ><option>1</option><option>2</option></select>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</div>
</body>
</html>

