<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>用户列表</title>
<base href="${base}/"></base>
<jsp:include page="../base.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#new").click(function(){
			location.href="${base}/user/add";
		});
		$("#selall").click(function(){
			$(":checkbox[name=ids]").prop("checked",$(this).prop("checked"));
		});
		$(":checkbox[name=ids]").click(function(){
			var b=true;
			$(":checkbox[name=ids]").each(function(){
				if(!$(this).prop("checked")){
					b=false;
					return;
				}
			});
			$("#selall").prop("checked",b);
		});
		
	//	alert($("a[name=dels]").length);
		$("a[name=dels]").each(function(index,a){
			$(a).click(function(){
				alert($(a).prev().val());
				$.get("user/del/"+$(a).prev().val(),function(){
					$(a).parent().parent().remove();
				});
			});
		});
	});
</script>
</head>

<body>
	<div id="main">
			<div id="serach">
			<fieldset>
				<legend>
					<img src="images/311.gif" />&nbsp;查询条件
				</legend>
				<form action="user/list">
				 帐号：<input type="text" name="account" size=10> 
				 类型：<input type="radio" checked="checked">不限 
				 <input type="radio">老师
				 <input type="radio">学生 
				 <input type="submit" value=" 查  询 " class="oprbtn">
				</form>
			</fieldset>
		</div>
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;用户列表
			</legend>
			
			<div id="datalist">
				<table>
					<thead>
						<tr id="tableheader">
							<th width="60"><input type="checkbox" id="selall"/>选择</th>
							<th width="60">序号</th>
							<th width="80">用户帐号</th>
							<th width="80">角色</th>
							<th width="80">帐号类型</th>
							<th width="80">分配给</th>
							<th width="80">用户状态</th>
							<th width="160">最后登录时间</th>
							<th width="100">最后登录IP</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageBean.data}" var="user" varStatus="s">
							<tr>
								<td class="center"><input name="ids" type="checkbox"
									value="${user.id}" /></td>
								<td class="center">${s.count}</td>
								<td class="center">${user.account}</td>
								<td class="center">${user.roleName}</td>
								<td class="center">${user.type}</td>
								<td class="center">${user.assignName}</td>
								<td class="center">${user.status}</td>
								<td class="center">${user.lastLoginTime}</td>
								<td class="center">${user.lastLoginIP}</td>
								<td class="center">
									<img src="images/037.gif" width="9" height="9" />[<a href="user/update/${user.id}">编辑</a>]&nbsp;
									<img src="images/010.gif" width="9" height="9" />[<input type="hidden" value="${user.id}"><a href="javascript:void(0)" name="dels">删除</a>]
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br />
			<div id="nav" >
				<table width="50%" align="center">
					<tr>
						<td align="left">共120条纪录，当前第1/10页，每页10条纪录</td>
						<td align="right"><img src="images/first.gif" /> <img src="images/back.gif" /> <img
						src="images/next.gif" /> <img src="images/last.gif">
						<select ><option>1</option><option>2</option></select>
						</td>
					</tr>
				</table>
			</div>
			<div id="opr">
				<input type="button" value=" 新  增 " class="oprbtn" id="new" /> <input
					type="button" value=" 删  除 " class="oprbtn" />
			</div>
		</fieldset>
	</div>
</body>
</html>

