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
  <form action="admin/sysuser.jsp?f=f" method="post">
	<%CommDAO dao = new CommDAO();
	 String sql = "select * from sysuser where 1=1 and uname not in('admin') ";
	 String url = "/srykzsblmis/admin/sysuser.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (uname like'%"+key+"%' or tname like'%"+key+"%' )";
	 url+="&key="+key;
	 }if(!key1.equals(""))
	 {
	 sql+=" and (utype ='"+key1+"')";
	 url+="&key1="+key1;
	 }
	 sql+=" order by id desc";
%>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>医护用户管理</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
	<th bgcolor="#ffffff" colspan="14">
		按用户名或姓名查询：<input type="text" id="key" name="key" value="<%=key %>" />&nbsp;&nbsp;&nbsp;
		按用户类型查询：<select id="key1" name="key1">
					<option value="">全部类型</option>
    				<option value="挂号人员" <%if(key1.equals("挂号人员")){out.print("selected==selected");} %>>挂号人员</option>
    				<option value="收费人员" <%if(key1.equals("收费人员")){out.print("selected==selected");} %>>收费人员</option>
    				<option value="药房人员" <%if(key1.equals("药房人员")){out.print("selected==selected");} %>>药房人员</option>
    				<option value="医生" <%if(key1.equals("收费人员")){out.print("selected==selected");} %>>医生</option>
    			</select>
		<input type="submit" value="查询"  />
	</th>
  <TR bgcolor="#ffffff" align="center">
    <TD>用户名</TD>
    <TD>密码</TD>
    <TD>姓名</TD>
    <TD>性别</TD>
    <TD>电话</TD>
    <TD>出生年月</TD>
    <TD>婚否</TD>
    <TD>邮箱</TD>
    <TD>身份证号</TD>
    <TD>毕业学校</TD>
    <TD>住址</TD>
    <TD>用户类型</TD>
    <TD>科室</TD>
    <TD>操作</TD>
   </TR>
   <%String did = request.getParameter("did");
   if(did!=null)
   {
dao.commOper("delete from sysuser where id="+did);
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
	    %>
	    
	<tr bgcolor="#ffffff" align="center">
		<td><%=mstu.get("uname") %></td>
		<td><%=mstu.get("upass") %></td>
		<td><%=mstu.get("tname") %></td>
		<td><%=mstu.get("sex") %></td>
		<td><%=mstu.get("tel") %></td>
		<td><%=mstu.get("birth") %></td>
		<td><%=mstu.get("ismarage") %></td>
		<td><%=mstu.get("email") %></td>
		<td><%=mstu.get("idcard") %></td>
		<td><%=mstu.get("byschool") %></td>
		<td><%=mstu.get("addr") %></td>
		<td><%=mstu.get("utype") %></td>
		<td>
		<%if(mstu.get("utype").equals("医生")){
			HashMap deptm = dao.select("select * from dept where id="+mstu.get("dept")).get(0); %>
		<%=deptm.get("deptname") %>
		<%} %>
		</td>
		<td>
		<a href="admin/sysuseredit.jsp?id=<%=mstu.get("id") %>">修改</a>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="admin/sysuser.jsp?did=<%=mstu.get("id") %>">删除</a>
		</td>
	</tr>
 <%} %>
 	<tr>
 		<td colspan="14" align="center" bgcolor="#FFFFFF">${page.info }</td>
 	</tr>
 </TABLE>
 </form>
  </body>
</html>

