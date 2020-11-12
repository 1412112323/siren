<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>私人牙科诊所病例管理系统 </title>
    
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
  
<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
<FRAME name=header src="admin/header.jsp" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="170, *">
<FRAME name=menu src="admin/menu.jsp" frameBorder=0 noResize>
  <%HashMap admin = (HashMap)session.getAttribute("admin");
	if(admin.get("utype").equals("管理员")){
	%>
<FRAME name=main src="admin/sysuser.jsp" frameBorder=0 noResize scrolling=yes>
<%}else if(admin.get("utype").equals("医生")){ %>
<FRAME name=main src="admin/jzghlist.jsp" frameBorder=0 noResize scrolling=yes>
<%}else if(admin.get("utype").equals("挂号人员")){ %>
<FRAME name=main src="admin/ghadd.jsp" frameBorder=0 noResize scrolling=yes>
<%}else if(admin.get("utype").equals("收费人员")){ %>
<FRAME name=main src="admin/dsf.jsp" frameBorder=0 noResize scrolling=yes>
<%}else if(admin.get("utype").equals("药房人员")){ %>
<FRAME name=main src="admin/dfy.jsp" frameBorder=0 noResize scrolling=yes>
<%} %>
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
</html>
