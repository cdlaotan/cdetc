<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>无标题文档</title>
<base href="${base}/" />
<%@include file="base.jsp" %>
<style type="text/css">
	#back{
		width:47px;
		height: 23px;
		background-image: url('images/main_12.gif');
		background-position:-51px 0;
		border-width: 0px
	}
	#go{
		width:49px;
		height: 23px;
		background-image: url('images/main_12.gif');
		background-position:-98px 0;
		border-width: 0px
	}
	#info{
		width:104px;
		height: 23px;
		background-image: url('images/main_12.gif');
		background-position:-206px 0;
		border-width: 0px
	}
	#exit{
		width:58px;
		height: 23px;
		background-image: url('images/main_12.gif');
		background-position:-309px 0;
		border-width: 0px	
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#back").click(function(){
			history.go(-1);
		});
		$("#go").click(function(){
			history.go(1);
		});
		$("#info").click(function(){
			 window.top.frames['mainFrame'].$.dialog({
				id:'updatePwd',
			    content: 'url:password_update.jsp',
			    lock:true,
			    max: false,
			    min: false,
			    title:'修改个人密码',
			    width: '400px',
			    height:'200px',
			    //drag: false,
			    resize: false,
			    cancelVal: '关闭',
			    cancel: true,
			    ok:function(){
			    	window.top.frames['mainFrame'].$.dialog.list['updatePwd'].content.updatePwd();
			    	return false;
			    }
			});
		});
		$("#exit").click(function(){
			window.top.frames['mainFrame'].$.dialog.confirm("您确定退出吗？",function(){
				top.location.href="user/logout";
			});
		});
		
	});
</script>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
  <tr>
    <td height="9" style="line-height:9px; background-image:url(images/main_04.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="97" height="9" background="images/main_01.gif">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47" background="images/main_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="38" height="47" background="images/main_06.gif">&nbsp;</td>
        <td width="59"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="29" background="images/main_07.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="18" background="images/main_14.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
              <tr>
                <td  style="width:1px;">&nbsp;</td>
                <td ><span class="STYLE1">${user.account}</span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="155" background="images/main_08.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23"><input type="button" id="back" /><input type="button" id="go" /><input type="button" id="info" /><input type="button" id="exit" /></a></td>
          </tr>
        </table></td>
        <td width="420" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="5" style="line-height:5px; background-image:url(images/main_18.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="180" background="images/main_16.gif"  style="line-height:5px;">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</html>
