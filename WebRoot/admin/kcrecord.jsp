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
  <form action="admin/kcrecord.jsp?f=f" method="post">
	<%CommDAO dao = new CommDAO();
	 String sql = "select * from kcrecord where 1=1  ";
	 String url = "/srykzsblmis/admin/kcrecord.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (yno like'%"+key+"%'  )";
	 url+="&key="+key;
	 }if(!key1.equals(""))
	 {
		 sql+=" and (savetime >='"+key1+"'  )";
		 url+="&key1="+key1;
		 }if(!key2.equals(""))
		 {
			 sql+=" and (savetime < '"+key2+"'  )";
			 url+="&key2="+key2;
			 }
	 sql+=" order by id desc";
%>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>库存记录</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
	<th bgcolor="#ffffff" colspan="6">
		按药品编号查询：<input type="text" id="key" name="key" value="<%=key %>" />&nbsp;&nbsp;&nbsp;
		按日期查询：<input type="text" id="key1" name="key1" value="<%=key1 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>-
                 <input type="text" id="key2" name="key2" value="<%=key2 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
		 <script type="text/javascript" src="/srykzsblmis/commfiles/js/calendar/WdatePicker.js"></script>
		<input type="submit" value="查询"  />
	</th>
  <TR bgcolor="#ffffff" align="center">
    <TD>药品编号</TD>
    <TD>药品名称</TD>
    <TD>出入库类型</TD>
    <TD>数量</TD>
    <TD>操作员</TD>
    <TD>日期</TD>
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
   		HashMap ym = dao.select("select * from ypcf where yno='"+mstu.get("yno")+"'  ").get(0);
	    %>
	<tr bgcolor="#ffffff" align="center">
		<td><%=mstu.get("yno") %></td>
		<td><%=ym.get("yname") %></td>
		<td>
		<%if(mstu.get("type").equals("in")){ %>
			入库
		<%}else{ %>
			出库
		<%} %>
		</td>
		<td><%=mstu.get("num") %></td>
		<td><%=mstu.get("oper") %></td>
		<td><%=mstu.get("savetime") %></td>
	</tr>
 <%} %>
 	<tr>
 		<td colspan="6" align="center" bgcolor="#FFFFFF">${page.info }</td>
 	</tr>
 </TABLE>
 </form>
  </body>
</html>

