<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="etc" uri="/etc/utils" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>新增试卷</title>
    <base href="${base}/"></base>
    <jsp:include page="../base.jsp" />
	
  	<script type="text/javascript">
  	var questypeIds="",techtypeId="";
  	//更新questypeIds的值，以选中的题型复选框的value拼接
  	/*
  	function updateQuestypeIds(){
  		questypeIds="";
  		$.each($("#questypes :checkbox[checked]"),function(i,f){
  			questypeIds+=$(f).val()+",";
		});	
  		if(questypeIds!=""){
  			questypeIds=questypeIds.substring(0,questypeIds.lastIndexOf(","));
  		}
  	}*/
  	function updateQuestions(){
  		/*if(techtypeId==""){
  			return;
  		}
  		var cellFunc=[
          function(data){
        	  return data.questypeName;           	
          },
		  function(data){
           	  return data.content.replace(/<[^>]+>/g,"");
          },
          function(data){
        	  var v="<div style='text-align:center'><input type='hidden' value='"+data.id+"' />"
        	  		+"<input type='hidden' value='"+data.questypeId+"' />"
        	  		+"<img src='${base}/images/ico_add.png' title='增加' id='addques' />"
        	  		+"<img src='${base}/images/detail.png' title='查看' id='detailques'/></div>";
              return $(v)[0];
          }
        ];/*
		QuestionService.getQuestions(1,5,techtypeId,questypeIds,function(questions){
			dwr.util.removeAllRows("selques");
			dwr.util.addRows("selques",questions,cellFunc);
			$("#selques #detailques").each(function(){
				$(this).click(function(){
					//alert($(this).prev().prev().val());
					//alert($(this).prev().prev().prev().val());
					$.dialog({
						id:'viewQues',
					    content: 'url:${base}/question/view/'+$(this).prev().prev().prev().val()+'.do',
					    max: false,
					    min: false,
					    title:'查看题目',
					    width: '400px',
					    height:'300px',
					    cancelVal: '关闭',
					    cancel: true
					});
				});
			});
			//添加题目到作业中
			$("#selques #addques").each(function(){
				$(this).click(function(){
					var qt=$(this).prev().val();//题型
					var qid=$(this).prev().prev().val();//题目ID
					var isExist=false;
					//判断题目是否重复
					$("#"+qt+" :hidden[name=quesIds]").each(function(){
						if($(this).val()==qid){
							$.dialog.alert('不能添加重复的题目！');
							isExist = true;
						}
					});
					if(isExist){
						return false;
					}
					var qcontent=$(this).parent().parent().prev().html();//题干
					var p=$("<p></p");
					var remove=$("<a href='#'>移除</a>");
					var up=$("<a href='#'>上移</a>");
					var down=$("<a href='#'>下移</a>");
					var detail=$("<a href='#'>详细</a>");
					var value=$("<span>分值:</span><input type='text' name='value' size='1'>");
					var qid=$("<input type='hidden' name='quesIds' value='"+qid+"'/>"+qcontent+"</p>");
					//p.append("&nbsp;&nbsp;");
					p.append(remove);
					p.append("&nbsp;&nbsp;");
					p.append(up);
					p.append("&nbsp;&nbsp;");
					p.append(down);
					p.append("&nbsp;&nbsp;");
					p.append(detail);
					p.append("&nbsp;&nbsp;");
					p.append(value);
					p.append("<br />");
					p.append(qid);
					$("#"+qt).append(p);
				
					remove.click(function(){
						var r=$(this);
						$.dialog.confirm("您确认删除吗？",function(){
							r.parent().remove();
						});
						return false;
					});
					up.click(function(){
						var f=$(this).parent().parent().find(":first-child");
						if($(this).parent().html()!=f.html()){
							$(this).parent().prev().before($(this).parent());
						}
						return false;
					});
					down.click(function(){
						var f=$(this).parent().parent().find(":last-child");
						if($(this).parent().html()!=f.html()){
							$(this).parent().next().after($(this).parent());
						}
						return false;
					});
					detail.click(function(){
						$.dialog({
							id:'viewQues',
						    content: 'url:${base}/question/view/'+$(this).next().next().val()+'.do',
						    max: false,
						    min: false,
						    title:'查看题目',
						    width: '400px',
						    height:'300px',
						    cancelVal: '关闭',
						    cancel: true
						});
						return false;
					});
				});
			});
		});*/
  	}
  	/*var setting = {
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				techtypeId=treeNode.id;
				if(questypeIds==""){
					$.dialog.alert("请选择题型").time(3);
				}else{
					updateQuestions();
				}
			}
		}
	};*/

	$(function(){
		//增加试卷
		/*
		$("#publish").click(function(){
			$.dialog.confirm("创建后不可修改！您确定创建此试卷吗？",function(){
				var paper={
						length:$("#length").val(),
						description:$("#description").val()
				};
				var quesIds=[],values=[];
				$(":hidden[name='quesIds']").each(function(i,h){
					quesIds.push($(h).val());
				});
				$(":input[name='value']").each(function(i,h){
					values.push($(h).val());
				});
				
				PaperService.addPaper(paper,quesIds,values,{callback:function(){
							alert("OK");
						},errorHandler:function(message){
							alert("出错！");
						}
					}
				);
			});
		});*/
		//得到技术类别树
		/*TechtypeService.getAllTechTypes(function(techtypes){
			$.fn.zTree.init($("#techtype"), setting, JSON.parse(techtypes)).expandAll(true);
		});*/
		//得到题型
		$.getJSON("questype/ajax",function(quesTypes){
			for(var i in quesTypes){
				var questype="<input type='checkbox' value='"+quesTypes[i].id+"' /><span>"+quesTypes[i].name+"</span>";
				$("#questypes").append(questype);
			}
			//为题型复选框增加事件
			$(":checkbox").each(function(){
				$(this).click(function(){
					var s=$(this);
					if($(this).prop("checked")){
						var questype="<fieldset id='"+$(this).val()+"'><legend>"+$(this).next().html()
						+"(<span class='quesNums'>0</span>道题，每题<input type='text' size='1' class='value'>分，共<span class='quesValue'>0</span>分)"
						+"<input type='checkbox'>统一设置分值"
						+"</legend></fieldset>";
						if($("fieldset").length==0){
							$("#paperdetails").append(questype);
						}else{
							var b=true;
							$.each($("fieldset"),function(i,f){
								if($(f).attr("id") > s.attr("value")){
									$(f).before(questype);
									b=false;
									return false;
								}
							});
							if(b){
								$("#paperdetails").append(questype); 									
							}
						}
						//更新变量questypeIds的值
						//updateQuestypeIds();
						//updateQuestions();
					}else{
						$.dialog.confirm("取消该题型会丢失您可能已经选择的该题型的题目！",
							function(){
								$.each($("fieldset"),function(i,f){
									if($(f).attr("id")==s.attr("value")){
										$(f).remove();
									}
								});
								//更新变量questypeIds的值
								updateQuestypeIds();//alert(questypeIds);
								updateQuestions();
							},
							function(){
								s.attr("checked","checked");
							}
						);
					}
				});
			});
			//得到科目
			$.getJSON("subject/ajax",function(subjects){
				for(var i in subjects){
					var subject="<option value='"+subjects[i].id+"'>"+subjects[i].name+"</option>";
					$("#subject").append(subject);
				}
			});
			//为科目下拉框增加事件处理
			$("#subject").on("change",function(){
				$.getJSON("course/get/"+$(this).val(),function(courses){
					for(var i in courses){
						var course="<option value='"+courses[i].id+"'>"+courses[i].name+"</option>";
						$("#course").append(course);
					}
				});
			});
			//为课程下拉框增加事件处理
			$("#course").on("change",function(){
				$.getJSON("chapter/get/"+$(this).val(),function(chapters){
					for(var i in chapters){
						var chapter="<option value='"+chapters[i].id+"'>"+chapters[i].name+"</option>";
						$("#chapter").append(chapter);
					}
				});
			});
			//为章节下拉框增加事件处理
			$("#chapter").on("change",function(){
				$.getJSON("knowledge/get/"+$(this).val(),function(knowledges){
					for(var i in knowledges){
						var knowledge="<option value='"+knowledges[i].id+"'>"+knowledges[i].name+"</option>";
						$("#knowledge").append(knowledge);
					}
				});
			});
		});
	});
  	</script>
  	<style type="text/css">
  		#main{
  			margin: auto;
  		}
  		#paperdetails{
  			border:1px green dashed;
  			width:450px;
			margin-left:5px;
  			float: left;
  		}
  		#questions{
  			/*border:1px green dashed;*/
  			width:700px;
			margin-left:10px;
  			float: left;
  		}
  		#jobendtime{
  			text-align:center;
  		}
  		#nav{
  			text-align:center;
  		}
  	</style>
  </head>
  
  <body>
  	<h1>新增试卷</h1>
	 <div>
	  简要描述:<input type="text" id="description" size="50">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 考试时长:<input type="text" id="length" size="3">(分钟)
	 <br />
	 设置试卷题型:<span id="questypes"></span>
</div>
	 <hr />
	 <div id="main">
     <div id="paperdetails"></div>
     <div id="questions">
     	<fieldset>
     	<legend>题目筛选</legend>
     		科目:<select id="subject">
     			<option value="">不限</option>
     		</select>
     		课程:<select id="course">
     		<option value="">不限</option>
     		</select>
     		章节:<select id="chapter">
     		<option value="">不限</option>
     		</select>
     		知识点:<select id="knowledge">
     		<option value="">不限</option>
     		</select>
     		<input type="button" value="筛选"><br /><br />
     		<table border="1" width="100%" id="datalist">
     			<thead>
     				<tr id="tableheader">
     					<th width="10%">题型</th>
     					<th width="80%">题干</th>
     					<th width="10%">操作</th>
     				</tr>
     			</thead>
     			<tbody id="selques">
     			</tbody>
     		</table><br />
     		<div id="nav">
     			<img src="images/first.gif" id="first"/> 
     			<img src="images/back.gif" id="back" />
     			<img src="images/next.gif" id="next" />
     			<img src="images/last.gif" id="last" />
     		</div>
     		</fieldset>
    </div>
    <div style="clear:both"></div><br />
    </div>
    <div style="text-align: center;"><input type="button" value=" 预  览 " id="view" class="oprbtn">
    <input type="button" id="publish" value=" 增  加 " class="oprbtn">
    <input type="button" value=" 取  消 " id="cancel" class="oprbtn"></div>
  </body>
</html>
