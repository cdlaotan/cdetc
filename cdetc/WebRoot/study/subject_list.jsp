<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>科目列表</title>
<base href="${base}/"></base>
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">

</script>
</head>

<body>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;科目列表
			</legend>
			
			<div id="datalist">
				<table>
					<thead>
						<tr id="tableheader">
							<th width="60"><input type="checkbox" id="selall"/>选择</th>
							<th width="60">序号</th>
							<th width="80">科目名称</th>
							<th width="80">课程数量</th>
							<th width="80">班级数量</th>
							<th width="80">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${subjects}" var="subject" varStatus="s">
							<tr>
								<td class="center"><input name="ids" type="checkbox"
									value="${subject.id}" /></td>
								<td class="center">${s.count}</td>
								<td class="center">${subject.name}</td>
								<td class="center">${subject.courseNums}</td>
								<td class="center">${subject.classNums}</td>
								<td class="center">${subject.status}</td>
								<td class="center">
									<img src="images/037.gif" width="9" height="9" />[<a href="user/update/${subject.id}">编辑</a>]&nbsp;
									<img src="images/010.gif" width="9" height="9" />[<input type="hidden" value="${subject.id}"><a href="javascript:void(0)" name="dels">删除</a>]
								</td>
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

