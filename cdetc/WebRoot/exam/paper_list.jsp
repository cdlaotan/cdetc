<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="tm" uri="/tanlan/stringformat" %>
<!DOCTYPE html>
<html>
<head>
<title>试卷列表</title>
<base href="${base}" />
<%@ include file="../base.jsp" %>
<script type="text/javascript" src="dwr/interface/PanswerService.js"></script>
<script type="text/javascript" src="dwr/interface/TmUtil.js"></script>

<script type="text/javascript">
	function doTest(startTime,endTime,paperId,clazzId,length){
		//判断该试卷是否在允许的时间范围内
		TmUtil.between(startTime,endTime,function(b){
			if(b==1){
				$.dialog.alert("该测试还未开始！");
			}else if(b==2){
				$.dialog.confirm("该测试已经结束！是否查看？",function(){
					location.href="paper/view/"+paperId+".do";
				});
			}else{
				PanswerService.getPanswerByPidAndStuId(paperId,"${user.id}",function(panswer){
					if(panswer!=null){
						if(panswer.status==2){
							$.dialog.confirm("您之前做过该套题，但未提交，是否继续？",function(){
								location.href="paper/dotest/"+paperId+"/"+clazzId+".do";
							});
						}else if(panswer.status==3){
							$.dialog.confirm("您之前做过该套题，且已提交，不能再做！是否查看？",function(){
								location.href="paper/doview/"+paperId+".do";
							});
						}else{
							$.dialog.confirm("您之前做过该套题，但未保存答案，是否继续？",function(){
								location.href="paper/dotest/"+paperId+"/"+clazzId+".do";
							});
						}
					}else{
						$.dialog.confirm("本试题最多需要您"+length+"分钟，请确认后，集中精力完成此试卷！",function(){
							location.href="paper/dotest/"+paperId+"/"+clazzId+".do";
						});
					}
				});
			}
		});
	}
</script>
</head>

<body>
	<div id="main">
		<div id="search">
			<fieldset>
				<legend>
					<img src="images/311.gif" />&nbsp;查询条件
				</legend>
				描述：<input type="text" name="description">
				<input type="submit" value=" 查  询 " class="oprbtn">
			</fieldset>
		</div>
		<fieldset>
			<legend>
				<img src="images/311.gif" />&nbsp;试卷列表
			</legend>
			<div id="datalist">
				<table>
					<thead>
						<tr id="tableheader">
							<th width="60">序号</th>
							<th width="350">描述</th>
							<th width="120">考试时长(分钟)</th>
							<th width="70">题目数量</th>
							<th width="300">有效时间</th>
							<th width="140">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${papers}" var="paper" varStatus="s">
							<tr>
								<td class="center">${s.count}</td>
								<td>${paper.description}</td>
								<td class="center">${paper.length}</td>
								<td class="center">${paper.quesNums}</td>
								<td class="center"><tm:formate value="${paper.startTime}" remainLength="19"/>&nbsp;
								至&nbsp;<tm:formate value="${paper.endTime}" remainLength="19"/></td>
								<td class="center"><img src="images/037.gif" width="9"
									height="9" />[<a href="javascript:doTest('${paper.startTime}','${paper.endTime}','${paper.paperId}','${paper.classId}',${paper.length});">开始测试</a>]
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</fieldset>
	</div>
</body>
</html>

