<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK href="admin/css/admin.css" type="text/css" rel="stylesheet">
  </head>
  
  <body>

<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>您的相关信息</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=2 width="95%" align=center border=0>
  <TR>
    <TD align=right width=100>登陆帐号：</TD>
    <TD style="COLOR: #880000">admin</TD></TR>
  <TR>
    <TD align=right>真实姓名：</TD>
    <TD style="COLOR: #880000">admin</TD></TR>
  <TR>
    <TD align=right>注册时间：</TD>
    <TD style="COLOR: #880000">2007-7-25 15:02:04</TD></TR>
  <TR>
    <TD align=right>登陆次数：</TD>
    <TD style="COLOR: #880000">58</TD></TR>
  <TR>
    <TD align=right>上线时间：</TD>
    <TD style="COLOR: #880000">2008-12-27 17:02:54</TD></TR>
  <TR>
    <TD align=right>IP地址：</TD>
    <TD style="COLOR: #880000">222.240.172.117</TD></TR>
  <TR>
    <TD align=right>身份过期：</TD>
    <TD style="COLOR: #880000">30 分钟</TD></TR>
  <TR>
    <TD align=right>网站开发QQ：</TD>
    <TD style="COLOR: #880000">215288671</TD></TR>
  <TR>
    <TD align=right>免费模板网：</TD>
    <TD style="COLOR: #880000"><a href="http://www.865171.cn">www.865171.cn</a></TD></TR></TABLE>
  </body>
</html>
