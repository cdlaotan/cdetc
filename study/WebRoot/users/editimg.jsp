<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<base href="${base}/">
<title>个人中心</title>
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#file_upload").on("change", function() {
			var file = document.getElementById("file_upload").files[0];//$(this).file;
			if (file) {
				//alert(file.name + "==" + file.size + "=" + file.type);
			}
		});
		$("#saveimg").on(
				"click",
				function() {
					var fd = new FormData();
					fd.append("file", document
							.getElementById("file_upload").files[0]);
					var xhr = new XMLHttpRequest();
					xhr.upload.addEventListener("progress", uploadProgress,
							false);
					xhr.addEventListener("load", uploadComplete, false);
					xhr.addEventListener("error", uploadFailed, false);
					xhr.addEventListener("abort", uploadCanceled, false);
					xhr.open("post", "user/uploadimg");
					xhr.send(fd);
				});
	});
	function uploadProgress(evt) {
		if (evt.lengthComputable) {
			var percentComplete = Math.round(evt.loaded * 100 / evt.total);
			document.getElementById('progressNumber').innerHTML = percentComplete
					.toString()
					+ '%';
		} else {
			document.getElementById('progressNumber').innerHTML = 'unable to compute';
		}
	}

	function uploadComplete(evt) {
		$("#userimg").attr("src",evt.target.responseText);
	}

	function uploadFailed(evt) {
		alert("There was an error attempting to upload the file.");
	}

	function uploadCanceled(evt) {
		alert("The upload has been canceled by the user or the browser dropped the connection.");
	}
</script>
</head>

<body>
	<div class="top">
		<jsp:include page="../top.jsp" />
	</div>
	<div class="header">
		<jsp:include page="../header.jsp" />
	</div>
	<div class="content">
		<c:import url="left.jsp"></c:import>
		<div class="uright">
			<div class="miaoshu">
				<img width="12px" height="12px" align="texttop"
					src="css/default/tip1.gif">上传头像说明：支持jpg、gif、png、jpeg四种格式图片上传。<br />
				<font color="red">上传限制：1、图片大小不能超过2M;&nbsp;&nbsp;2、图片长宽大于100*100px时系统将自动压缩</font>
			</div>
			<div class="tab2" id="tab">
				<ul>
					<li><a href="">个人资料</a></li>
					<li><a href="">修改密码</a></li>
					<li class="on"><a href="users/editimg.jsp">修改头像</a>
					</li>
				</ul>
				<div class="clr"></div>
			</div>

			<div class="grxx">
				<div class="listx">
					<div id="avatar" style=" width:104px;height:104px;float:left;">
						<img id="userimg" src="${sessionScope.user.avatar}"
							style="border-color: #CDCDCD #CDCDCD #CDCDCD #CDCDCD;border-radius: 5px 5px 5px 5px;border-style: solid;border-width: 1px;height: 100px;padding: 2px;width: 100px;" />
					</div>
					<div id="progressNumber"></div>
					<div style="float:left;margin-left:20px;margin-top:10px;">
						<span><input id="file_upload" name="file_upload"
							type="file" /> </span><br /> <span><input type="button"
							id="saveimg" class="button4" value="保&nbsp;存" name="submit" /> </span>
					</div>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<!--footer-->
	<div class="footer">
		<c:import url="../footer.jsp"></c:import>
	</div>
</body>
</html>