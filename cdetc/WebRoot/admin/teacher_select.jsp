<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>选择老师</title>
<base href="${base}/"></base>
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
    var selectedTeacher=[];
	$(function(){
		$(":radio[name=teacherId]").click(function(){
			selectedTeacher[0]=$(this).val();
			selectedTeacher[1]=$(this).parent().next().next().text();
		});
	});
	
</script>
</head>

<body>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;教师列表
			</legend>
			
			<div id="datalist">
				<table>
					<thead>
						<tr id="tableheader">
							<th width="60">选择</th>
							<th width="60">序号</th>
							<th width="80">姓名</th>
							<th width="80">岗位</th>
							<th width="100">分配用户名</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${teachers}" var="teacher" varStatus="s">
							<tr>
								<td class="center"><input name="teacherId" type="radio"
									value="${teacher.id}" /></td>
								<td class="center">${s.count}</td>
								<td class="center">${teacher.name}</td>
								<td class="center">${teacher.jobs}</td>
								<td class="center"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>
</body>
</html>

