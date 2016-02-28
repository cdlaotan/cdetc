<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>增加新院校</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$("#cancel").click(function() {
			history.go(-1);
		});
	});
</script>
</head>

<body>
	<div id="main">
		<h1>增加新院校</h1>
		<form action="college/add" method="post" id="collegeform">
			<div id="newdata">
				<table width="500" border="1">
					<tr>
						<td width="60">院校名称</td>
						<td><input type="text" name="name" id="name"></td>
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
