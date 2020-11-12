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
  <%HashMap admin = (HashMap)session.getAttribute("admin"); %>
  <body>
  <form action="admin/jzghrecord.jsp?f=f" method="post">
	<%CommDAO dao = new CommDAO();
	 String sql = "select * from zd where ghno in (select ghno from  ghinfo where  delstatus='0' and ghdept='"+admin.get("dept")+"' and status='已问诊')";
	 String url = "/srykzsblmis/admin/jzghrecord.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String key3 = request.getParameter("key3")==null?"":request.getParameter("key3");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (ghno like'%"+key+"%'    )";
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
	 sql+=" order by ghno desc";
%>
<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>问诊记录</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
<TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
	<th bgcolor="#ffffff" colspan="10">
		按编号查询：<input type="text" id="key" name="key" value="<%=key %>" />&nbsp;&nbsp;&nbsp;
		诊断日期：<input type="text" id="key2" name="key2" value="<%=key2 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>-
                 <input type="text" id="key3" name="key3" value="<%=key3 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
		 <script type="text/javascript" src="/srykzsblmis/commfiles/js/calendar/WdatePicker.js"></script>
		<input type="submit" value="查询"  />
	</th>
  <TR bgcolor="#ffffff" align="center">
    <TD>挂号编号</TD>
    <TD>病人姓名</TD>
    <TD>性别</TD>
    <TD>年龄</TD>
    <TD>病情</TD>
    <TD>诊断</TD>
    <TD>药品、处置</TD>
    <TD>操作员</TD>
    <TD>日期</TD>
    <TD>操作</TD>
   </TR>
   <%String did = request.getParameter("did");
   if(did!=null)
   {
		dao.commOper("delete from  zd  where ghno="+did);
		dao.commOper("update ghinfo set status='待问诊' where ghno='"+did+"'");
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
   		HashMap ghmap = dao.select("select * from ghinfo where ghno='"+mstu.get("ghno")+"'").get(0);
	    %>
	<tr bgcolor="#ffffff" align="center">
		<td><a href="admin/brwzview.jsp?ghno=<%=mstu.get("ghno") %>"><%=mstu.get("ghno") %></a></td>
		<td><%=ghmap.get("tname") %></td>
		<td><%=ghmap.get("sex") %></td>
		<td><%=ghmap.get("age") %></td>
		<td><%=mstu.get("bq") %></td>
		<td><%=mstu.get("zd") %></td>
		<td align="left">
		<%String info = mstu.get("info").toString();
		String numinfo = mstu.get("numinfo").toString();
		String yinfo = "";
		String a[] = info.split("\\$");
		String b[] = numinfo.split("\\$");
		for(int i=0;i<a.length;i++){
			yinfo += a[i]+"&nbsp;&nbsp;数量:"+b[i]+"<br/>";
		}
		%>
		<%=yinfo %>
		</td>
		<td><%=mstu.get("oper") %></td>
		<td><%=mstu.get("savetime") %></td>
		<td>
		<%if(mstu.get("fkstatus").equals("未付款")){ %>
		<a href="admin/brwzedit.jsp?ghno=<%=mstu.get("ghno") %>">修改</a>
		<a href="admin/jzghrecord.jsp?did=<%=mstu.get("ghno") %>">删除</a>
		<%}else{ %>
			病人已付款
		<%} %>
		</td>
	</tr>
 <%} %>
 	<tr>
 		<td colspan="10" align="center" bgcolor="#FFFFFF">${page.info }</td>
 	</tr>
 </TABLE>
 </form>
  </body>
</html>

