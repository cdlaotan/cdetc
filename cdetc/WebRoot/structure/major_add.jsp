<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>增加新专业</title>
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
		<h1>增加新专业</h1>
		<form action="major/add" method="post" id="majorform">
			<div id="newdata">
				<table width="700" border="1">
					<tr>
						<td width="100">专业名称</td>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td>是否IT相关名称</td>
						<td><input type="radio" name="relevant" value="是">是
						<input type="radio" name="relevant" value="否">否</td>
					</tr>
				</table>
			</div>
			<div id="opr">
				<input type="submit" value=" 新  增 " class="oprbtn" id="new" />
				<input type="button" value=" 取  消 " class="oprbtn" id="cancel" />
			</div>
		</form>
	</div>
</body>
</html>
