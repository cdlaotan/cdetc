<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>院校列表</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#new").click(function(){
			location.href="college/add";
		});
	});
</script>
</head>

<body>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;院校列表
			</legend>
			
			<div id="datalist">
				<table width="80%">
					<thead>
						<tr id="tableheader">
							<th><input type="checkbox" />选择</th>
							<th>序号</th>
							<th>院校名称</th>
							<th>学员人数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${colleges}" var="college" varStatus="s">
							<tr>
								<td class="center"><input name="checkbox4" type="checkbox"
									value="checkbox" /></td>
								<td>${s.count}</td>
								<td>${college.name}</td>
								<td>${college.stuNums}</td>
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
				<input type="button" value=" 新  增 " class="oprbtn" id="new" /> <input
					type="button" value=" 删  除 " class="oprbtn" />
			</div>
		</fieldset>
	</div>
</body>
</html>

