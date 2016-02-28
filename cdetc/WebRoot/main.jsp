<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>主界面-中软国际卓越培训中心(成都)</title>
<base href="${base}/" />
<link rel="shortcut icon" href="images/favicon.ico" />
<jsp:include page="base.jsp" />
</head>
<frameset rows="61,*,24" framespacing="0" frameborder="no" border="0">
  <frame src="top.jsp" scrolling="no" noresize="noresize" />
  <frameset cols="180,*" frameborder="yes" border="1" bordercolor="green" noresize="noresize">
  	<frame src="left.jsp" scrolling="yes"/>
  	<frame src="tabpanel.jsp" name="mainFrame" id="main"/>
  </frameset>
  <frame src="bottom.jsp" scrolling="no" noresize="noresize" />
</frameset>
</html>
