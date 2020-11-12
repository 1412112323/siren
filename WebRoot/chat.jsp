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
			<form action="/srykzsblmis/studysite?ac=chatadd" name="form1" method="post" onsubmit="return ck()" >
			<table  border="1" bordercolor="#000000" cellspacing="0" cellpadding="2" style="border-collapse:collapse;font-size:12px" width="100%" align="center">
			<%if(user!=null){ %>
			<tr>
				<td colspan="4">
					留言内容：<input type="text" id="msg" name="msg">
					<input type="submit" value="提交">
				</td>
			</tr>
			<%} %>
			<tr align="center">
				<td>留言内容</td>
				<td>回复内容</td>
				<td>留言人</td>
				<td>留言日期</td>
			</tr>
				
			<%
			String sql = "select * from chat where 1=1 ";
			 String url = "/srykzsblmis/chat.jsp?1=1";
			 String key = request.getParameter("key")==null?"":request.getParameter("key");
			 String f = request.getParameter("f");
			 if(f==null)
			 {
			 key = Info.getUTFStr(key);
			 }
			 if(!key.equals(""))
			 {
			 sql+=" and (title like'%"+key+"%' )";
			 url+="&key="+key;
			 }
			 
			 sql+=" order by id desc";
			 PageManager pageManager = PageManager.getPage(url,10, request);
             pageManager.doList(sql);
             PageManager bean= (PageManager)request.getAttribute("page");
             ArrayList<HashMap> list=(ArrayList)bean.getCollection();
			for(HashMap m:list){
			HashMap mmm = dao.select("select * from patient where id="+m.get("uid")).get(0);
			%>
				<tr align="center">
					<td><%=m.get("msg") %></td>
					<td><%=m.get("hfmsg") %></td>
					<td><%=mmm.get("tname") %></td>
					<td><%=m.get("savetime") %></td>
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
		if(form1.msg.value==""){
			alert("留言内容不能为空");
			return false;
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
location.replace("/srykzsblmis/chat.jsp");
 <%}%>
</script>