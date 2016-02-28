<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>增加新课程</title>
<base href="${base}/" />
<jsp:include page="../base.jsp" />
<script type="text/javascript" src="js/template.js"></script>
<script type="text/javascript">
$(function(){
});
</script>
<script id="test" type="text/html">
</script>
</head>

<body>
 <div id="main">
  	<h1>增加新题型</h1>
	<form method="post" action="questype/add">
		<div id="newdata">
			<table width="500" border="1">
				<tr>
					<td width="80">题型名称</td>
					<td><input type="text" name="name"  id="name" size="30"/><span id="countmsg"></span></td>
				</tr>
			</table>
		</div>
		<div id="opr">
			<input type="submit" value=" 新  增 " class="oprbtn" id="new" /> <input
				type="button" value=" 取  消 " class="oprbtn" id="cancel"/>
		</div>
		</form>
	</div>
</body>
</html>
