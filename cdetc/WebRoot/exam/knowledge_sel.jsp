<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>选择知识点</title>
    <link rel="stylesheet" href="${base}/styles/tm.css" type="text/css">
    <link rel="stylesheet" href="${base}/styles/zTreeStyle.css" type="text/css">
    <style type="text/css">
    	#techtypes{
    		border:1px green dashed;
    		width:30%;
    		
    		float:left
    	}
    	#knows{
    		border:1px green dashed;
    		width:65%;
    		height:350px;
    		float:right
    	}
    </style>
    <script type="text/javascript" src="${base}/js/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="${base}/js/jquery.ztree.all-3.4.js"></script>
	<script type="text/javascript" src="${base}/dwr/engine.js"></script>
	<script type="text/javascript" src="${base}/dwr/util.js"></script>
	<script type="text/javascript" src="${base}/dwr/interface/TechtypeService.js"></script>
	<script type="text/javascript" src="${base}/dwr/interface/KnowledgeService.js"></script>
	
    <script type="text/javascript">
        var knows=[];
        function Knowledge(id,name){
        	this.id=id;
        	this.name=name;
        }
        function removeKnowId(knowId){
        	for(var i=0;i<knows.length;i++){
        		if(knowId == knows[i].id){
        			knows.splice(i,1);	
        		}
        	}
        }
		var setting = {
			data : {
				simpleData : {
					enable : true
				}
				
			},
			callback : {
				onClick : function(event, treeId, treeNode) {
					KnowledgeService.getKnowledges({"techtypeId":treeNode.id},function(knowledges){
						var cellfuncs=[
			               function(data){
			            	   var input="<input type='checkbox' name='knowIds' value='"+data.id+"'>";
			            	   return $(input)[0];
			               },
			               function(data){
			            	   return data.name;
			               }
						];
						dwr.util.removeAllRows("knowslist");
						dwr.util.addRows("knowslist",knowledges,cellfuncs);
						$(":checkbox").each(function(){
							$(this).click(function(){
								if($(this).attr("checked")){
									var know=new Knowledge($(this).val(),$(this).parent().next().html())
									knows.push(know);
								}else{
									removeKnowId($(this).val());
								}
							});
						});
					});
				}
			}
		};
		$(function(){
			TechtypeService.getAllTechTypes(function(techtypes){
				$.fn.zTree.init($("#techtype"), setting, JSON.parse(techtypes));
			});
			
		});
     </script>
  </head>
  <body>
  <div id="techtypes">
  	<div>技术类别</div>
  	<ul id="techtype" class="ztree">技术类别</ul>
  </div>
    
    <div id="knows"><div id="datalist">
		<table width="95%" border="1" align="center">
			<thead>
				<tr id="tableheader">
					<th width="15%">选择</th>
					<th>知识点</th>
				</tr>
			</thead>
			<tbody id="knowslist">
				
			</tbody>
		</table>
		<div>导航</div>
		</div>
	</div>
  </body>
</html>
