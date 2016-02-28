<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>增加新学员</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$("#cancel").click(function() {
			history.go(-1);
		});
		Calendar.setup({
	        trigger    : "birthDate",
	        inputField : "birthDate"
	    });
	});
</script>
</head>

<body>
	<div id="main">
		<h1>增加学员</h1>
		<form action="student/add" method="post">
			<div id="newdata">
				<table width="800" border="1">
					<tr>
						<td width="100">姓名</td>
						<td width="300"><input type="text" name="name"></td>
						<td width="100">性别</td>
						<td width="300"><input type="radio" name="gender" value="男" checked="checked">男
							<input type="radio" name="gender" value="女">女</td>
					</tr>
					<tr>
						<td>身份证</td>
						<td><input type="text" name="idCard"></td>
						<td>出生年月</td>
						<td><input type="text" name="birthDate" id="birthDate"></td>
					</tr>
					<tr>
						<td>学历</td>
						<td>
						<select name="education">
							<option value="本科">本科</option>
							<option value="专科">专科</option>
							<option value="高中及中专">高中及中专</option>
							<option value="硕士及以上">硕士及以上</option>
							<option value="其他">其他</option>
						</select>
						<td>相片</td>
						<td><input type="text" name="photo"></td>
					</tr>
					<tr>
						<td>毕业院校</td>
						<td><select name="collegeId">
								<c:forEach items="${colleges}" var="college">
									<option value="${college.id}">${college.name}</option>
								</c:forEach>
						</select></td>
						<td>专业</td>
						<td><select name="majorId">
								<c:forEach items="${majors}" var="major">
									<option value="${major.id}">${major.name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>毕业时间</td>
						<td><input type="text" name="graduTime"></td>
						<td>住址</td>
						<td><input type="text" name="address"></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td><input type="text" name="phoneNum"></td>
						<td>QQ</td>
						<td><input type="text" name="qq"></td>
					</tr>
					<tr>
						<td>所在班级</td>
						<td><select name="classId">
								<c:forEach items="${classes}" var="clazz">
									<option value="${clazz.id}">${clazz.name}</option>
								</c:forEach>
						</select></td>
						<td>分配帐号</td>
						<td><input type="text" name="userid"></td>
					</tr>
					<tr>
						<td>业务接口人</td>
						<td><input type="text" name="sale"></td>
						<td>来源</td>
						<td><input type="radio" name="source" value="社招" checked="checked">社招
						<input type="radio" name="source" value="校招">校招
						<input type="radio" name="source" value="口碑">口碑
						<input type="radio" name="source" value="介绍">介绍
						<input type="radio" name="source" value="其他">其他</td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="3"><textarea  name="description" cols="100" rows="5"></textarea></td>
					</tr>
				</table>

			</div>
			<div id="opr">
				<input type="submit" value=" 新  增 " class="oprbtn" id="new" /> <input
					type="button" value=" 取  消 " class="oprbtn" id="cancel" />
			</div>
		</form>
	</div>
</body>
</html>
