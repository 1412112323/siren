<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%@page import="java.text.DecimalFormat"%>
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
  <form action="admin/mzltj.jsp?f=f" method="post">
	<%CommDAO dao = new CommDAO();
	 String sql = "select * from ghinfo where 1=1 and delstatus='0' ";
	 String url = "/srykzsblmis/admin/mzltj.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String key3 = request.getParameter("key3")==null?"":request.getParameter("key3");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 key1 = Info.getUTFStr(key1);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (ghno like'%"+key+"%' or tname like'%"+key+"%'    )";
	 url+="&key="+key;
	 }if(!key1.equals(""))
	 {
		 sql+=" and (status ='"+key1+"'   )";
		 url+="&key="+key;
		 }if(!key2.equals(""))
		 {
			 sql+=" and (savetime >= '"+key2+"'  )";
			 url+="&key2="+key2;
			 }if(!key3.equals(""))
			 {
				 sql+=" and (savetime < '"+key3+"'  )";
				 url+="&key3="+key3;
				 }
	 sql+=" order by id desc";
%>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>门诊量统计</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
	<th bgcolor="#ffffff" colspan="3">
		状态:<select id="key1" name="key1">
			<option value="">全部</option>
			<option value="待问诊" <%if(key1.equals("待问诊")){out.print("selected==selected");} %>>待问诊</option>
			<option value="已问诊" <%if(key1.equals("已问诊")){out.print("selected==selected");} %>>已问诊</option>
		</select>
		日期：<input type="text" id="key2" name="key2" value="<%=key2 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>-
                 <input type="text" id="key3" name="key3" value="<%=key3 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
		 <script type="text/javascript" src="/srykzsblmis/commfiles/js/calendar/WdatePicker.js"></script>
		<input type="submit" value="查询"  />
	</th>
  <TR bgcolor="#ffffff" align="center">
    <TD>开始日期</TD>
    <TD>结束日期</TD>
    <TD>门诊量</TD>
   </TR>
   <%
   ArrayList list = (ArrayList)dao.select(sql);
	    %>
	<tr bgcolor="#ffffff" align="center">
		<td><%=key2 %></td>
		<td><%=key3 %></td>
		<td><%=list.size() %></td>
		
	</tr>

 </TABLE>
 </form>
  </body>
</html>

