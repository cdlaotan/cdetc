<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>增加新老师</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#cancel").click(function(){
			history.go(-1);
		});
	});
</script>
</head>

<body>
  <div id="main">
  <h1>增加老师</h1>
	<form action="teacher/add.do" method="post">
		<div id="newdata">
			<table width="500" border="1">
			<tr>
					<td>姓名</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>岗位</td>
					<td><input type="text" name="jobs"></td>
				</tr>
				<tr>
					<td width="60">技术类型</td>
					<td>
						<select name="type">
							<option value="">无</option>
							<c:forEach items="${subjects}" var="subject">
								<option value="${subject.id}">${subject.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>性别</td>
					<td><input type="radio" name="gender" value="男" checked>男
					<input type="radio" name="gender" value="女">女</td>
				</tr>

				<tr>
					<td>出生年月</td>
					<td><input type="text" name="birthdate"></td>
				</tr>

				<tr>
					<td>入职时间</td>
					<td><input type="text" name="entryTime"></td>
				</tr>
			</table>
			
		</div>
		<div id="opr">
			<input type="submit" value=" 新  增 " class="oprbtn" id="newuser" /> <input
				type="button" value=" 取  消 " class="oprbtn" id="cancel" />
		</div>
		</form>
	</div>
</body>
</html>
