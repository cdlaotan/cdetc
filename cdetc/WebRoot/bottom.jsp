<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<base href="${base}/" />
<title>无标题文档</title>
<%@include file="base.jsp" %>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="24" background="images/main_47.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="29" height="24"><img src="images/main_45.gif"
							width="29" height="24" />
						</td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0" >
								<tr>
									<td width="369">欢迎您！${user.account}!&nbsp;您的角色是${user.roleName}</td>
									<td width="814" >&nbsp;</td>
									<td width="185" nowrap="nowrap"><div
											align="center">
											<img src="images/main_51.gif" width="12" height="12" />如有疑问请与<a
												href="mailto:tanlan@chinasofti.com">技术人员</a>联系
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td width="14"><img src="images/main_49.gif" width="14"
							height="24" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
