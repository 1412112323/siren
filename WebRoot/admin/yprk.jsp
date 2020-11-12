<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sysuseradd.jsp' starting page</title>
    
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
  <%CommDAO dao = new CommDAO(); %>
  <body>
  <form action="/srykzsblmis/studysite?ac=yprk" name="f1" method="post" onsubmit="return ck()">
   <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>药品入库</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
    <TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
    	<tr bgcolor="#ffffff">
    		<td>药品名称</td>
    		<td><select id="yno" name="yno">
    		<%ArrayList<HashMap> yplist = (ArrayList<HashMap>)dao.select("select * from ypcf where delstatus='0' and type='药品' "); 
    		for(HashMap ypmap:yplist){%>
    			<option value="<%=ypmap.get("yno") %>"><%=ypmap.get("yno") %>-<%=ypmap.get("yname") %></option>
    			<%} %>
    		</select>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>入库数量</td>
    		<td><input type="text"  id="num" name="num" size="5" />*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td colspan="2">
    			<input type="submit" value="提交"/>
    			<input type="reset" value="重置"/>
    		</td>
    	</tr>
    </TABLE>
    </form>
  </body>
</html>
<script type="text/javascript">
	function ck(){
		var reg=/^([1-9]\d*)$/;
		if(f1.yno.value==""){
			alert("药品不能为空");
			return false;
		}if(f1.num.value==""){
			alert("入库数量不能为空");
			return false;
		}else if(reg.test(f1.num.value)==false){
		
			alert("入库数量请输入正整数");
			return false;
		}
	}
	<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("已存在的用户名");
 <%}
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/srykzsblmis/admin/yprk.jsp");
 <%}%>
</script>