<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>增加新用户</title>
<base href="${base}/" />
<jsp:include page="../base.jsp" />
<script type="text/javascript">
	function validateAccount(){
		var b=true;
		if($("#account").val()==""){
			$("#accountmsg").html("用户帐号不能为空");
			$("#accountmsg").addClass("input_error");
			return false;
		}else if($("#account").val().length<3 || $("#account").val().length>15){
			$("#accountmsg").html("用户帐号长度不能为小于3或者大于15");
			$("#accountmsg").addClass("input_error");
			return false;
		}else{
			/*
			$.get("user/isexist/"+$("#account").val(),function(r){
				if(r==true){
					$("#accountmsg").html("用户帐号已经存在");
					$("#accountmsg").addClass("input_error");
					b= false;
				}else{
					$("#accountmsg").html("&nbsp;");
					$("#accountmsg").addClass("input_ok");
				}
			});*/
			$.ajax({
				  type: "get",
				  url: "user/isexist/"+$("#account").val(),
				  async:false,
				  success:function(r){
						if(r==true){
							$("#accountmsg").html("用户帐号已经存在");
							$("#accountmsg").addClass("input_error");
							b= false;
						}else{
							$("#accountmsg").html("&nbsp;");
							$("#accountmsg").addClass("input_ok");
						}
				}
		   });
		}
		return b;
	}
	
	function validatePassword(){
		if($("#password").val()==""){
			$("#passwordmsg").html("用户密码不能为空");
			$("#passwordmsg").addClass("input_error");
			return false;
		}
		return true;
	}
	
	$(function(){
		$("#account").blur(validateAccount);
		$("#password").blur(validatePassword);
		$("#userform").submit(function(){
			var t=validatePassword();
			var b=validateAccount();
			return (b && t);
		});
		
		$("#assigntostudent").click(function(){
			$.dialog({
				id:'sel',
				content:'url:student/select',
				width:'700px',
				height:'400px',
				title:'选择学员',
				lock:true,
				ok:function(){
					var selectedStudent=$.dialog.list['sel'].content.selectedStudent;
					$("#assignId").val(selectedStudent[0]);
					$("#assignName").val(selectedStudent[1]);
					$("#type").val("s");
				},
				cancel:true
				
			});
		});
		$("#assigntoteacher").click(function(){
			$.dialog({
				id:'sel',
				content:'url:teacher/select',
				width:'700px',
				height:'400px',
				title:'选择教师',
				lock:true,
				ok:function(){
					var selectedTeacher=$.dialog.list['sel'].content.selectedTeacher;
					$("#assignId").val(selectedTeacher[0]);
					$("#assignName").val(selectedTeacher[1]);
					$("#type").val("t");
				},
				cancel:true
				
			});
		});
		$("#cancel").on("click",function(){
			history.go(-1);
		});
	});
</script>
</head>

<body>
 <div id="main">
  	<h1>增加新用户</h1>
	<form method="post" action="user/add" id="userform">
		<div id="newdata">
			<table width="500" border="1">
				<tr>
					<td width="80">用户帐号</td>
					<td><input type="text" name="account"  id="account" size="30"/><span id="accountmsg"></span></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;码</td>
					<td><input type="password" name="password" id="password" size="30"><span id="passwordmsg"></span></input></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="password" name="cfmpassword" id="cfmpassword" size="30"><span id="cfmpwdmsg"></span></input></td>
				</tr>
				<tr>
					<td>角&nbsp;&nbsp;色</td>
					<td>
						<select name="role">
							<c:forEach items="${roles}" var="role">
								<option value="${role.id}">${role.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>分配给</td>
					<td>
					<input type="text" name="type" id="type">
					<input type="text" name="assignId" id="assignId">
					<input type="text" id="assignName" readonly="readonly">
					<input type="button" value="选择学员 " class="oprbtn" id="assigntostudent">
					<input type="button" value="选择讲师 " class="oprbtn" id="assigntoteacher"></td>
				</tr>
				<tr>
					<td>是否启用</td>
					<td><input type="radio" name="status" value="启用" checked="checked">启用
					<input type="radio" name="status" value="禁用">禁用</td>
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
