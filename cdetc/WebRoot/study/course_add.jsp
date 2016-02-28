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
	$("#newchapter").click(function(){
		var html = template('test');
		$('#coursetable').append(html);
	});	
});
</script>
<script id="test" type="text/html">
<tr>
	<td width="80">章节</td>
	<td><input type="text" name="chapterNames"  id="name" size="30"/><span id="countmsg"></span></td>
</tr>
</script>
</head>

<body>
 <div id="main">
  	<h1>增加新课程</h1>
	<form method="post" action="course/add" id="courseform">
		<div id="newdata">
			<table width="500" border="1" id="coursetable">
				<tr>
					<td width="80">课程名称</td>
					<td><input type="text" name="name"  id="name" size="30"/><span id="countmsg"></span></td>
				</tr>
				<tr>
					<td width="80">所属学科</td>
					<td><c:forEach items="${subjects}" var="subject">
						<input type="checkbox" name="subjectIds" value="${subject.id}" />${subject.name}&nbsp;&nbsp;
					</c:forEach>
					</td>
				</tr>
			</table>
		</div>
		<div id="opr"><input type="button" value="新增章节" class="oprbtn" id="newchapter" /> 
			<input type="submit" value=" 新  增 " class="oprbtn" id="new" /> <input
				type="button" value=" 取  消 " class="oprbtn" id="cancel"/>
		</div>
		</form>
	</div>
</body>
</html>
