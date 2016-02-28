<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>增加新知识点</title>
<base href="${base}/" />
<jsp:include page="../base.jsp"></jsp:include>
<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css">
<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css" />
<script type="text/javascript" src="js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
<script type="text/javascript">
var setting = {
	async: {
		enable: true,
		url: getUrl
	},


	view: {
		dblClickExpand: false
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeExpand: beforeExpand,
		onAsyncSuccess: onAsyncSuccess,
		onAsyncError: onAsyncError,
		onClick:onClick
	}
};
function getUrl(treeId, treeNode) {
	//var curCount = (treeNode.children) ? treeNode.children.length : 0;
	//var getCount = (curCount + perCount) > treeNode.count ? (treeNode.count - curCount) : perCount;
	//var param = "id="+treeNode.id;
	return "chapter/list/"+treeNode.id;
}
function beforeExpand(treeId, treeNode) {
	if (!treeNode.isAjaxing) {
		//startTime = new Date();
		//treeNode.times = 1;
		ajaxGetNodes(treeNode, "refresh");
		return true;
	} else {
		alert("zTree 正在下载数据中，请稍后展开节点。。。");
		return false;
	}
}
function onAsyncSuccess(event, treeId, treeNode, msg) {
	if (!msg || msg.length == 0) {
		return;
	}
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	//totalCount = treeNode.count;
	//if (treeNode.children.length < totalCount) {
	//	setTimeout(function() {ajaxGetNodes(treeNode);}, perTime);
	//} else {
		treeNode.icon = "";
		zTree.updateNode(treeNode);
		zTree.selectNode(treeNode.children[0]);
		//endTime = new Date();
		//var usedTime = (endTime.getTime() - startTime.getTime())/1000;
		//className = (className === "dark" ? "":"dark");
		//showLog("[ "+getTime()+" ]&nbsp;&nbsp;treeNode:" + treeNode.name );
		//showLog("加载完毕，共进行 "+ (treeNode.times-1) +" 次异步加载, 耗时："+ usedTime + " 秒");
	//}
}
function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	alert("异步获取数据出现异常。");
	treeNode.icon = "";
	zTree.updateNode(treeNode);
}

function ajaxGetNodes(treeNode, reloadType) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	if (reloadType == "refresh") {
		treeNode.icon = "../../../css/zTreeStyle/img/loading.gif";
		zTree.updateNode(treeNode);
	}
	zTree.reAsyncChildNodes(treeNode, reloadType, true);
}


function onClick(e, treeId, treeNode) {
	if(!treeNode.isParent){
		$("#chapterName").attr("value", treeNode.name);
		$("#chapterId").attr("value", treeNode.id);
		hideMenu();
	}
}

function showMenu() {
	var chapterObj = $("#chapterName");
	var chapterOffset = $("#chapterName").offset();
	$("#menuContent").css({left:chapterOffset.left + "px", top:chapterOffset.top + chapterObj.outerHeight() + "px"}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
		hideMenu();
	}
}

$(function(){
	$("#cancel").click(function(){
		history.go(-1);
	});

	$.getJSON("course/ajax",function(courses){
		$.fn.zTree.init($("#treeDemo"), setting, courses);
	});
	var option = {
		toolbars : [ [ 'fullscreen', 'source','|', 'undo', 'redo', '|','bold', 'italic', 'underline',
				'strikethrough','removeformat', 'pasteplain',	'|', 'insertorderedlist','insertunorderedlist',
				'selectall', 'cleardoc', '|','lineheight', '|', 'imagenone', 'imageleft',
				'imageright', 'imagecenter','|', 'insertimage','insertcode', '|','preview' ] ],
		initialFrameWidth : 700,
		initialFrameHeight : 400,
		initialContent : ''
	};
	var editor = new baidu.editor.ui.Editor(option);
	editor.render('details');
});
</script>


<style type="text/css">
#menuContent{
	background-color:white;
	border: 1px green dashed;
	z-index: 1000
}
</style>
</head>

<body>
	<div id="main">
		<h1>增加知识点</h1>
		<form action="knowledge/add" method="post">
			<div id="newdata">
				<table width="800" border="1">
					<tr>
						<td width="100">知识点名称</td>
						<td width="300"><input type="text" name="name" style="width:100%;"></td>
						<td width="100">所属章节</td>
						<td width="300"><input id="chapterName" type="text" readonly style="width:75%;"/>
							&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a>
							<input type="hidden" name="chapterId" id="chapterId">
						</td>
					</tr>
					<tr>
						<td>知识点描述</td>
						<td colspan="3"><textarea id="details" name="details"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div id="opr">
				<input type="submit" value=" 新  增 " class="oprbtn"/>
				<input type="button" value=" 取  消 " class="oprbtn" id="cancel" />
			</div>
		</form>
	</div>
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
	</div>
</body>
</html>
