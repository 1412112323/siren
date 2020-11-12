<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 
    	<center style="letter-spacing:1px;margin-top:10px;">
        <div style="padding-top:10px; margin-bottom:5px;">
          联系电话： 17369299939 传真：1412112323
        </div>
        <div>
            Copyright JieGe 2019 http://www.https://www.cnblogs.com/easyjie All Rights Reserved <a href="./admin/login.jsp" target="_blank">后台管理</a>
        </div>
        </center>
  </body>
</html>
