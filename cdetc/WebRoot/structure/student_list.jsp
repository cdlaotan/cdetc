<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>学员列表</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$("#new").click(function() {
			location.href = "student/add";
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
			姓名：<input type="text" name="name" size="5"> 
			性别： <select name="gender">
				<option value="">不限</option>
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
			所在班级:<select name="classId">
					<option value="">不限</option>
				<c:forEach items="${classes}" var="clazz">
					<option value="${clazz.id}">${clazz.name}</option>
				</c:forEach>
			</select>
			 毕业院校：<select name="collegeId">
			 	<option value="">不限</option>
								<c:forEach items="${colleges}" var="college">
									<option value="${college.id}">${college.name}</option>
								</c:forEach>
						</select>
			 专业：<select name="majorId">
			 	<option value="">不限</option>
								<c:forEach items="${majors}" var="major">
									<option value="${major.id}">${major.name}</option>
								</c:forEach>
						</select>
			学历：<select name="education">
				<option value="">不限</option>
				<option value="">本科</option>
				<option value="">专科</option>
				<option value="">高中及中专</option>
				<option value="">硕士及以上</option>
			</select>
			来源:<select name="source">
				<option value="">不限</option>
				<option value="">社招</option>
				<option value="">校招</option>
				<option value="">口碑</option>
				<option value="">介绍</option>
				<option value="">其他</option>
				</select>
			<input type="submit" value=" 查  询 " class="oprbtn"> 
			<input type="reset" value=" 重  置 " class="oprbtn">
		</fieldset>

	</div>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;学员列表
			</legend>
			<div id="datalist">
				<table width="95%">
					<thead>
						<tr id="tableheader">
							<th width="60"><input type="checkbox" />选择</th>
							<th width="40">序号</th>
							<th width="50">姓名</th>
							<th width="40">性别</th>
							<th width="80">所在班级</th>
							<th>毕业院校</th>
							<th>专业</th>
							<th width="70">学历</th>
							<th width="70">毕业时间</th>
							<th width="40">来源</th>
							<th width="80">业务接口人</th>
							<th width="70">绑定帐号</th>
							<th width="40">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageBean.data}" var="student" varStatus="s">
							<tr>
								<td class="center"><input name="checkbox4" type="checkbox"
									value="checkbox" /></td>
								<td>${s.count}</td>
								<td>${student.name}</td>
								<td>${student.gender}</td>
								<td>${student.className}</td>
								<td>${student.collegeName}</td>
								<td>${student.majorName}</td>
								<td>${student.education}</td>
								<td>${student.graduTime}</td>
								<td>${student.source}</td>
								<td>${student.sale}</td>
								<td>${student.account}</td>
								<td>${student.status}</td>
								<td class="center"><img src="images/037.gif" width="9"
									height="9" />[<a href="#">编辑</a>] <img src="images/010.gif"
									width="9" height="9" /> [<a href="#">删除</a>]</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br />
			<div id="nav" >
				<table width="90%" align="center">
					<tr>
						<td align="left">共${pageBean.totalNums}条纪录，当前第${pageBean.page}/${pageBean.totalPage}页，每页${pageBean.pageSize}条纪录</td>
						<td align="right"><img src="images/first.gif" /> <img src="images/back.gif" /> <img
						src="images/next.gif" /> <img src="images/last.gif">
						<select >
							<c:forEach begin="1" end="${pageBean.totalPage}" var="p">
								<option value="${p}">${p}</option>
							</c:forEach>
						</select>
						</td>
					</tr>
				</table>
			</div>
			<div id="opr">
				<input type="button" value=" 新  增 " class="oprbtn" id="new" />
				<input type="button" value=" 删  除 " class="oprbtn" />
			</div>
		</fieldset>
	</div>
</body>
</html>

