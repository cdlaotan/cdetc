<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>增加新角色</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript">
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true,
				pIdKey: "parentId"
			}
		}
	};
	
	$(function(){
		$.getJSON("authority/list",function(auths){
			$.fn.zTree.init($("#tree"), setting, auths).expandAll(true);
		});
		//$.fn.zTree.init($("#tree"), setting, ${authorities}).expandAll(true);
		
		$("#new").click(function(){
			var treeObj = $.fn.zTree.getZTreeObj("tree");
			//获得所有选择的复选框
			var nodes = treeObj.getCheckedNodes(true);
			for(var i=0;i<nodes.length;i++){
				var newPriv="<input type='text' name='authIds' value='"+nodes[i].id+"'>";
				$("#selAuths").append(newPriv);
			}
			$("#roleForm").submit();
		});
	});
</script>
</head>

<body>
 <div id="main">
  	<h1>增加新角色</h1>
	<sf:form method="post" modelAttribute="role" id="roleForm">
		<div id="newdata">
			<table width="500" border="1">
				<tr>
					<td width="60">角色名</td>
					<td><input type="text" name="name"  size="31"/><sf:errors path="name"></sf:errors> </td>
				</tr>
				<tr>
					<td>角色描述</td>
					<td><textarea name="description" id="description" cols="32"></textarea></td>
				</tr>
				<tr>
					<td>分配权限</td>
					<td><ul id="tree" class="ztree"></ul></td>
				</tr>
			</table>
		</div>
		<div id="opr">
			<input type="button" value=" 新  增 " class="oprbtn" id="new" /> <input
				type="button" value=" 取  消 " class="oprbtn" id="cancel"/>
		</div>
		<div id="selAuths"></div>
		</sf:form>
	</div>
</body>
</html>
