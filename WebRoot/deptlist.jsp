<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
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
			<form action="deptlist.jsp?f=f" name="f1" method="post" >
			<table  border="1" bordercolor="#000000" cellspacing="0" cellpadding="2" style="border-collapse:collapse;font-size:12px" width="100%" align="center">
			<tr>
				<td colspan="4">
					科室名称：<input type="text" id="key" name="key">
					<input type="submit" value="查询">
				</td>
			</tr>
			
			<tr align="center">
				<td>科室名称</td>
				<td>电话</td>
				<td>地点</td>
				<td>操作</td>
			</tr>
				
			<%
			String sql = "select * from dept where delstatus='0' ";
			 String url = "/srykzsblmis/deptlist.jsp?1=1";
			 String key = request.getParameter("key")==null?"":request.getParameter("key");
			 String f = request.getParameter("f");
			 if(f==null)
			 {
			 key = Info.getUTFStr(key);
			 }
			 if(!key.equals(""))
			 {
			 sql+=" and (deptname like'%"+key+"%' )";
			 url+="&key="+key;
			 }
			 
			 sql+=" order by id  ";
			 PageManager pageManager = PageManager.getPage(url,10, request);
             pageManager.doList(sql);
             PageManager bean= (PageManager)request.getAttribute("page");
             ArrayList<HashMap> list=(ArrayList)bean.getCollection();
			for(HashMap m:list){%>
				<tr align="center">
					<td><%=m.get("deptname") %></td>
					<td><%=m.get("tel") %></td>
					<td><%=m.get("addr") %></td>
					<td>
					<%if(user!=null){ %>
					<a href="yy.jsp?id=<%=m.get("id") %>">预约</a>
					<%}else{ %>
					请先登陆					
					<%} %>
					</td>
				</tr>
			<%} %>
					<TR align=center>
					    <TD class=forumrow  height=24 colspan="4">${page.info }</TD>
					  </TR>     
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