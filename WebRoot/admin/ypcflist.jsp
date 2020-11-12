<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
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
  <form action="admin/ypcflist.jsp?f=f" method="post">
	<%CommDAO dao = new CommDAO();
	 String sql = "select * from ypcf where 1=1 and delstatus='0' ";
	 String url = "/srykzsblmis/admin/ypcflist.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 key1 = Info.getUTFStr(key1);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (yname like'%"+key+"%' or yno like'%"+key+"%' )";
	 url+="&key="+key;
	 }
	 if(!key1.equals(""))
	 {
	 sql+=" and (type ='"+key1+"')";
	 url+="&key1="+key1;
	 }
	 sql+=" order by id desc";
%>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>药品处置管理</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
	<th bgcolor="#ffffff" colspan="7">
		按药品、处置名称或编号查询：<input type="text" id="key" name="key" value="<%=key %>" />&nbsp;&nbsp;&nbsp;
		按类型查询：<select id="key1" name="key1">
					<option value="">全部类型</option>
    				<option value="处置" <%if(key1.equals("处置")){out.print("selected==selected");} %>>处置</option>
    				<option value="药品" <%if(key1.equals("药品")){out.print("selected==selected");} %>>药品</option>
    			</select>
		<input type="submit" value="查询"  />
	</th>
  <TR bgcolor="#ffffff" align="center">
    <TD>编号</TD>
    <TD>名称</TD>
    <TD>单价</TD>
    <TD>类型</TD>
    <TD>规格</TD>
    <TD>厂商</TD>
    <TD>操作</TD>
   </TR>
   <%String did = request.getParameter("did");
   if(did!=null)
   {
dao.commOper("update ypcf set delstatus='1' where id="+did);
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
	    %>
	<tr bgcolor="#ffffff" align="center">
		<td><%=mstu.get("yno") %></td>
		<td><%=mstu.get("yname") %></td>
		<td><%=mstu.get("price") %>元</td>
		<td><%=mstu.get("type") %></td>
		<td><%=mstu.get("gg") %></td>
		<td><%=mstu.get("company") %></td>
		
		<td>
		<a href="admin/ypcfedit.jsp?id=<%=mstu.get("id") %>">修改</a>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="admin/ypcflist.jsp?did=<%=mstu.get("id") %>">删除</a>
		</td>
	</tr>
 <%} %>
 	<tr>
 		<td colspan="8" align="center" bgcolor="#FFFFFF">${page.info }</td>
 	</tr>
 </TABLE>
 </form>
  </body>
</html>

