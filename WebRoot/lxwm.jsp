<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>私人牙科诊所病例管理系统</title>
    
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
  <jsp:include page="top.jsp"></jsp:include>
  <%HashMap user = (HashMap)session.getAttribute("user"); 
  CommDAO dao = new CommDAO();
  HashMap map = dao.select("select * from siteinfo where id='1' ").get(0);%>
  
        <div style="margin-top:10px;text-align:center;">
        <table width=800 border="0" cellpadding="0" cellspacing="0">
            <tr height=320 bgcolor="#1FA9FE" style="color:white;font-weight:bold;">
                <%if(user==null){ %>
                	<td align="center" width=260 bgcolor="#ECECED" valign="top" style="">
                    <jsp:include page="left.jsp"></jsp:include>
                    </td>
                    <%}else{ %>
                    <td align="center" width=110 bgcolor="#ECECED" valign="top" style="">
                    <jsp:include page="menu.jsp"></jsp:include>
                    </td>
                    <%} %>
                <td  align="left" bgcolor="white" style="padding-left:20px;padding-top:15px;color:Black;font-weight:normal;font-size:12px" valign="top">
			<b><%=map.get("unit") %></b><br/>
			电话：<%=map.get("tel") %><br/>
               传真：<%=map.get("fax") %><br/>  
               地址：<%=map.get("addr") %><br/>                                
                </td>
            </tr>
        </table>
        <div style="margin-top:10px;height:1px;background-color:#1FA9FE;text-align:center;width:800px;">
            
        </div>     
            
    </div> 
    
    
    
    <jsp:include page="foot.jsp"></jsp:include>
    </center>

  </body>
</html>
<script type="text/javascript">
	function ck(){
		if(f1.uname.value==""){
			alert("用户名不能为空");
			return false;
		}if(f1.upass.value==""){
			alert("密码不能为空");
			return false;
		}else{
			f1.submit();
		}
	}
		<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("用户名或密码不正确");
 <%}
if(suc!=null)
{
 %>
location.replace("/srykzsblmis/index.jsp");
 <%}%>
</script>