<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>增加新题目</title>
<base href="${base}/" />
<jsp:include page="../base.jsp" />
<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css"/>  
	
<script type="text/javascript">
var codes=['A','B','C','D','E','F','G','H','I','J'];
//创建多选题的选项
function createOptions(code){
	var newoption="<span><input type='hidden' name='choice' value='"+code+"'/>选项 "+code+" :<input type='checkbox' name='manswer' value='"+code+"'/><input name='ocontent'/></span><br />";
	$("#answers").append(newoption);
}
//创建判断题的选项
function createJudgeOptions(){
	var newoption="<span><input type='radio' name='answer' value='T' />正确<input type='radio' name='answer' value='F' />错误</span>";
	$("#answers").append(newoption);
}
//创建填空题的答案设置
function createBlankOptions(){
	var newblank="<span><input type='button' id='newblank' value='增加答案'></span>";
	$("#answers").append(newblank);
	$("#newblank").click(function(){
		var newInput="<input type='text' name='manswer'>";
		$("#answers").append(newInput);
	});
}
//创建简答题的答案设置
function createDescriptionOptions(){
	var newoption="<span><textarea name='answer' cols='80' rows='6'></textarea><span>";
	$("#answers").append(newoption);
}
//创建编程题的答案设置
function createProgrammeOptions(){
	var newoption="<span><textarea name='answer' id='answer' cols='80' rows='6'></textarea></span>";
	$("#answers").append(newoption);
	var option={toolbars:[['fullscreen', 'undo', 'redo', 'cleardoc','insertcode']]
			,initialFrameWidth:700  
	        ,initialFrameHeight:150
	        ,initialContent:'' 
	 };
  var editor = new baidu.editor.ui.Editor(option);  
  editor.render('answer'); 
	
}
$(function() {
	//QuestypeService.getAllQuestypes(function(questypes){
	//	dwr.util.addOptions("questypeId",questypes,"id","name");
	//});
	for(var i=0;i<4;i++){
		createOptions(codes[i]);
	}
	
	$("#cancel").click(function() {
		history.go(-1);
	});
	$("#selknows").click(function(){
		$.dialog({
			id:'selKnows',
		    content: 'url:exam/knowledge_sel.jsp',
		    lock:true,
		    max: false,
		    min: false,
		    title:'选择知识点',
		    width: '600px',
		    height:'400px',
		    drag: false,
		    resize: false,
		    ok:function(){
		        var knows=$.dialog.list['selKnows'].content.knows;
		        for(var i in knows){
		        	var newKnowSpan="<span><input type='hidden' name='knowIds' value='"
		        	+knows[i].id+"' />"
		        	+knows[i].name
		        	+"<img src='${base}/images/delete.jpg' alt='删除' valign='middle'>&nbsp;&nbsp;</span>";
		        	$("#knows").append(newKnowSpan);
		        }
		        $("#knows img").each(function(){
		        	$(this).click(function(){
		        		$(this).parent().remove();
		        	});
		        });
		    },
		    cancelVal: '关闭',
		    cancel: true
		});
	});
	$("#questypeId").change(function(){
		$("#answers").empty();		
		var questypeId=$(this).val();
		if(questypeId==1){
			for(var i=0;i<4;i++){
				createOptions(codes[i]);
			}
		}else if(questypeId==2){
			createJudgeOptions();
		}else if(questypeId==3){
			createBlankOptions();
		}else if(questypeId==4){
			createDescriptionOptions();
		}else if(questypeId==5){
			createProgrammeOptions();
		}
	});
	$("#quesform").submit(function(){
		var questypeId=$("#questypeId").val();
		//如果是选择题
		if(questypeId==1){
			var answer="<input type='hidden'name='answer'>";
			$("#answers").append(answer);
			var v="";
			$("#answers :checked").each(function(){
				v += $(this).val()+",";
			});
			$("input[name='answer']").val(v.substring(0, v.length-1));
		}else if(questypeId==3){//填空题
			var answer="<input type='hidden'name='answer'>";
			$("#answers").append(answer);
			var v="";
			$("#answers input[name='manswer']").each(function(){
				v += $(this).val()+",";
			});
			$("input[name='answer']").val(v.substring(0, v.length-1));
		}
		
		//数据有效性验证
		
		return true;
	});
	var option={toolbars:[
	          	            ['fullscreen', 'source', '|', 'undo', 'redo', '|',
	                         'bold', 'italic', 'underline', 'strikethrough', 'removeformat','pasteplain',
	                         '|', 'insertorderedlist', 'insertunorderedlist','selectall', 'cleardoc', '|',
	                         'lineheight','|','add', 'imagenone', 'imageleft', 'imageright','imagecenter', '|',
	                         'insertimage', 'insertcode','|','preview']
	                 ]
			,labelMap:{
			    'add':'增加填空'
			}
			,initialFrameWidth:690  
	        ,initialFrameHeight:150
	        ,initialContent:'' 
	 };
  var editor = new baidu.editor.ui.Editor(option);  
  editor.render('content');   
});

</script>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="js/customizeUE.js"></script>

</head>

<body>
	<div id="main">
		<h1>增加新题目</h1>
		 <form action="question/add" method="post" id="quesform">
				<div id="newdata">
					<table width="800" border="1">
						<tr>
							<td width="100">题&nbsp;&nbsp;&nbsp;型</td>
							<td width="300">
							<select name="questypeId" id="questypeId">
								<c:forEach items="${questypes}" var="questype">
									<option value="${questype.id}">${questype.name}</option>
								</c:forEach>
							</select>
							</td>
							<td width="100">来&nbsp;&nbsp;&nbsp;源</td>
							<td><input type="text" name="source" /></td>
						</tr>
						<tr>
							<td>题&nbsp;&nbsp;&nbsp;干</td>
							<td colspan="3"><textarea id="content" name="content" cols="100" rows="5"></textarea>
								<script type="text/javascript"> 
								
								</script>  
							</td>
						</tr>
						<tr>
							<td>答案设置</td>
							<td id="answers" colspan="3">
							</td>
						</tr>
						<tr>
							<td>难度系数</td>
							<td colspan="3"><input type="radio" name="difficulty" value="1">难
							<input type="radio" name="difficulty" value="2" checked="checked">中等
							<input type="radio" name="difficulty" value="3">简单
							</td>
						</tr>
						<tr>
							<td>知识点</td>
							<td id="knows" colspan="3">
							<input type="button" value=" 选 择 " id="selknows">
							</td>
						</tr>
						
						<tr>
							<td>答案解析</td>
							<td colspan="3"><textarea id="analysis" name="analysis" rows="5"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div id="opr">
					<input type="submit" value=" 新  增 " id="ad1dques" class="oprbtn" />
					<input type="button" value=" 取  消 " class="oprbtn" id="cancel" />
				</div>
			</form>
	</div>
</body>
</html>
