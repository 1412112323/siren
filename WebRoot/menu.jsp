<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
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
  <center>
    <div style="font-size:18px;font-weight:bold;color:#044A8E;margin-top:20px;text-align:center;">
                        用户功能
                    </div> 
                    <hr align="center" >
                
                    <div id="d_login">

                    <div style="font-size:12px;color:#044A8E;margin-top:20px;font-weight:normal;">
                        <table border=0 width=110 >
                            <tr height=30>
                                <td width=90 class="STYLE2" align="center">
                                    <a href="myyy.jsp">预约就诊信息</a>
                                </td>
                            </tr>
                            
                            <tr height=30>
                                <td width=90  class="STYLE2" align="center">
                                  <a href="userinfo.jsp"> 个人信息修改</a>
                                </td>
                            </tr>
                            <tr height=30>
                                <td width=90  class="STYLE2" align="center">
                                  <a href="/srykzsblmis/studysite?ac=frontexit"> 安全退出</a>
                                </td>
                            </tr>
                        </table>
                    </div> 
                                                                             
                    </div>
                    </center>
  </body>
</html>
