<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
    
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
    <TABLE cellSpacing=0 cellPadding=0 width="100%" 
background="admin/images/header_bg.jpg" border=0>
  <TR height=56>
    <TD width=260><font color="#ffffff" size="4"><b>私人牙科诊所病例管理系统 </b></font></TD>
    <%HashMap admin = (HashMap)session.getAttribute("admin");
    CommDAO dao = new CommDAO();
	%>
    <TD style="FONT-WEIGHT: bold; COLOR: #fff; PADDING-TOP: 20px" 
      align=middle>当前用户： &nbsp;&nbsp;
      <%=admin.get("utype") %>-<%=admin.get("uname") %>-<%=admin.get("tname") %>
      <%if(admin.get("utype").equals("医生")){ 
    	  HashMap deptm = dao.select("select * from dept where id="+admin.get("dept")).get(0);
      %>
      科室:<%=deptm.get("deptname") %>
      <%} %>
      
       <A style="COLOR: #fff" 
      onclick="if (confirm('确定要退出吗？')) return true; else return false;" 
      href="/srykzsblmis/studysite?ac=exit" target=_top>退出系统</A> 
    </TD>
    <TD align=right width=268><!--  <IMG height=56 
      src="admin/images/header_right.jpg" width=268>--></TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR bgColor=#1c5db6 height=4>
    <TD></TD></TR></TABLE>
  </body>
</html>
