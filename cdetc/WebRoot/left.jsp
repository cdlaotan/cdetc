<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>无标题文档</title>
<base href="${base}/" />
<jsp:include page="base.jsp"></jsp:include>
<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="js/jquery.ztree.all-3.5.js"></script>
<script type="text/JavaScript">
var setting = {
		data : {
			key: {
				children: "children",
				name: "name",
				title: "",
				url: "url"
			},
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "parentId",
				rootPId: null
			},
			keep: {
				parent: false,
				leaf: false
			}
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				if (!treeNode.isParent) {
					top.mainFrame.addTab(treeNode.name,treeNode.link);
				}
			}
		}
	};

	$(function() {
		$.getJSON("authority/menu",function(auths){
			$.fn.zTree.init($("#tree"), setting, auths).expandAll(true);
		});
	});
</script>
</head>

<body>
	<table width="177" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="26" background="images/main_21.gif">&nbsp;</td>
		</tr>
		<tr>
			<td>
				<ul id="tree" class="ztree"></ul>
			</td>
		</tr>
	</table>
</body>
</html>
