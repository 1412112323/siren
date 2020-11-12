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
    <div style="margin-left:20px;font-size:18px;font-weight:bold;color:#044A8E;margin-top:20px;text-align:center;">
                        用户登录
                    </div> 
                    <hr align="center" width="260">
                
                    <div id="d_login">

                    <div style="font-size:12px;color:#044A8E;margin-top:20px;text-align:left;font-weight:normal;">
                        <form action="/srykzsblmis/studysite?ac=plogin" name="f1" method="post">
                        <table border=0 width=280>
                            <tr height=30>
                                <td width=90 align="right" class="STYLE2">
                                    登录名称：
                                </td>
                                <td width=170 align="left">
                                    <input name="uname" type="text" id="uname" style="width:120px;" />
                                </td>
                            </tr>
                            <tr height=30>
                                <td align="right" class="STYLE2">
                                    登录密码：
                                </td>
                                <td align="left">
                                    <input name="upass" type="password" id="upass" style="width:120px;" />
                                </td>
                            </tr>
                            <tr height=60>
                                <td align="center" colspan="2">
                                <img src="images/login_bottom.png" border="0" onclick="ck()">
                                </td>
                            </tr> 
                        </table>
                        </form>
                    </div>  
                   <hr align="center" width="260">
                    <div style="margin-top:20px;width:280px;text-align:center;">
                      <a href="regedit.jsp"><img src="frontfile/reg.png" border="0"></a>
                    </div> 
                                                                             
                    </div>
  </body>
</html>
