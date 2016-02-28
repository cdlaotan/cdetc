<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改角色</title>
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
	var allNodes=[];
	$(function(){
		$.getJSON("authority/list",function(auths){
			$.fn.zTree.init($("#tree"), setting, auths).expandAll(true);
			var treeObj = $.fn.zTree.getZTreeObj("tree");
			getAllChildren(treeObj.getNodes());
			for(var i=0;i<allNodes.length;i++){
				<c:forEach items="${role.authorities}" var="auth">
					if(allNodes[i].id=="${auth.id}"){
						allNodes[i].checked=true;
						continue;
					}
				</c:forEach>
			}
			treeObj.refresh();
		});
		$("#update").click(function(){
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
	
	//递归获取所有的节点，包括子节点
	function getAllChildren(nodes){
		if(nodes==undefined){
			return;
		}
		for(var i=0;i<nodes.length;i++){
			allNodes.push(nodes[i]);
			getAllChildren(nodes[i].children);
		}
	} 
</script>
</head>

<body>
 <div id="main">
  	<h1>修改角色</h1>
	<sf:form action="role/update" method="post" modelAttribute="role">
		<input type="hidden" name="id" value="${role.id}" />
		<div id="newdata">
			<table width="500" border="1">
				<tr>
					<td width="60">角色名</td>
					<td><input type="text" name="name" value="${role.name}" size="30" /><sf:errors path="name"></sf:errors> </td>
				</tr>
				<tr>
					<td>角色描述</td>
					<td><textarea name="description" id="description" cols="27">${role.description}</textarea></td>
				</tr>
				<tr>
					<td>分配权限</td>
					<td><ul id="tree" class="ztree"></ul></td>
				</tr>
			</table>
		</div>
		<div id="opr">
			<input type="submit" value=" 修  改 " class="oprbtn" id="update" /> <input
				type="button" value=" 取  消 " class="oprbtn" id="cancel" />
		</div>
		<div id="selAuths"></div>
		</sf:form>
	</div>
</body>
</html>
