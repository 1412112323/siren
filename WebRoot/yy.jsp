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
  %>
  <script type="text/javascript">
  	<%if(user==null){%>
  		alert("请先登陆");
  		location.href("index.jsp");
  	<%}%>
  </script>
  <script type="text/javascript" src="/srykzsblmis/commfiles/js/calendar/WdatePicker.js"></script>
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
			<%String id = request.getParameter("id"); %>
			<form action="/srykzsblmis/studysite?ac=yy&id=<%=id %>" name="f1" method="post" onsubmit="return ck()">
			<table  border="1" bordercolor="#000000" cellspacing="0" cellpadding="2" style="border-collapse:collapse;font-size:12px" width="100%" align="center">
			<th colspan="6"><h3>预约挂号</h3></th>
				<tr>
					<td>要申报的职称</td>
					<td colspan="2">
						<%
						
						HashMap m = dao.select("select * from dept where id="+id).get(0);
						%>
						<%=m.get("deptname") %>
					</td>
				</tr>
				<tr>
					<td>号类型</td>
					<td>
					<select id="type" name="type">
		    			<option value="5">普通号</option>
		    			<option value="10">专家号</option>
		    		</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"  align="center">
						<input type="submit" value="提交">
					</td>
				</tr>
			</table>    
			</form>                   
                </td>
            </tr>
        </table>
        <div style="margin-top:10px;height:1px;background-color:#1FA9FE;text-align:center;width:800px;">
            
        </div>     
            
    </div> 
    <jsp:include page="foot.jsp"></jsp:include>
    </center>
<script type="text/javascript">
function ck(){
		
}
<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("不能重复报名");
 <%}
if(suc!=null)
{
 %>
 alert("预约成功,等待处理");
location.replace("/srykzsblmis/myyy.jsp");
 <%}%>
</script>
  </body>
</html>
