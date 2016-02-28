<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>增加新班级</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$("#cancel").click(function() {
			history.go(-1);
		});
		$("#clazzform").validate({
			rules : {
				name : {
					required : true,
					minlength : 6
				}
			},
			messages : {
				name : {
					required : "请输入班级名",
					minlength : jQuery.format("班级名称不能小于{0}个字")
				}
			}
		});
	});
</script>
</head>

<body>
	<div id="main">
		<h1>增加新班级</h1>
		<form action="class/add.do" method="post" id="clazzform">
			<div id="newdata">
				<table width="500" border="1">
					<tr>
						<td width="60">班级名</td>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td>技术类型</td>
						<td>
						<select name="type">
							<c:forEach items="${subjects}" var="subject">
								<option value="${subject.id}">${subject.name}</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td>开班时间</td>
						<td><input type="text" name="startTime" /></td>
					</tr>
					<tr>
						<td>结训时间</td>
						<td><input type="text" name="endTime" /></td>
					</tr>
				</table>
			</div>
			<div id="opr">
				<input type="submit" value=" 新  增 " class="oprbtn" id="newclassr" />
				<input type="button" value=" 取  消 " class="oprbtn" id="cancel" />
			</div>
		</form>
	</div>
</body>
</html>
