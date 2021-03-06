<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="etc" uri="/etc/utils"%>
<!DOCTYPE html>
<html>
<head>
<title>角色列表</title>
<base href="${base}/"></base>
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#new").click(function(){
			location.href="${base}/role/add";
		});
	});
	
	function del(id){
		if(confirm("您确认删除吗?")){
			location.href="${base}/role/del/"+id;
		}
	}
</script>
</head>

<body>
	<div id="main">
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;角色列表
			</legend>
			
			<div id="datalist">
				<table>
					<thead>
						<tr id="tableheader">
							<th width="60"><input type="checkbox" />选择</th>
							<th width="60">序号</th>
							<th width="80">角色名称</th>
							<th width="300">角色描述</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${roles}" var="role" varStatus="s">
							<tr>
								<td class="center"><input name="ids" type="checkbox"
									value=${role.id} /></td>
								<td class="center">${s.count}</td>
								<td class="center">${role.name}</td>
								<td class="center">${role.description}</td>
								<td class="center"><img src="images/037.gif" width="9"
									height="9" />[<a href="role/update/${role.id}">编辑</a>]
									<etc:auth authCode="${authcodes.ROLE_DELETE}"><img src="images/010.gif" width="9"
									height="9" /> [<a href="javascript:void(0)" onclick="del('${role.id}')">删除</a>]</etc:auth></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="opr">
				<etc:auth authCode="${authcodes.ROLE_ADD}"><input type="button" value=" 新  增 " class="oprbtn" id="new" /></etc:auth>
				<etc:auth authCode="${authcodes.ROLE_DELETE}"><input type="button" value=" 删  除 " class="oprbtn" /></etc:auth>
			</div>
		</fieldset>
	</div>
</body>
</html>

