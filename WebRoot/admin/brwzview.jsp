<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  <%CommDAO dao = new CommDAO();
  String ghno = request.getParameter("ghno");
  HashMap mm = dao.select("select * from ghinfo where ghno='"+ghno+"'").get(0);
  HashMap map = dao.select("select * from  zd  where ghno="+ghno).get(0);
  String info = map.get("info").toString();
  String numinfo = map.get("numinfo").toString();
  
  %>
  <body>
  <form action="/srykzsblmis/studysite?ac=wzedit" name="f1" method="post" onsubmit="return getsub()">
  
  <input type="hidden" id="ghno" name="ghno" value="<%=map.get("ghno") %>">
   <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>病历预览</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
    <!--startprint1-->
    <TABLE cellSpacing=1 cellPadding=2 width="70%" align=center border=0 bgcolor="#cccccc">
    	<th colspan="3">病历</th>
    	<tr bgcolor="#ffffff" align="center">
    		<td width="33%">病人姓名：<%=mm.get("tname") %></td>
    		<td width="33%">性别：<%=mm.get("sex") %></td>
    		<td width="33%">年龄：<%=mm.get("age") %></td>
    	</tr>
    	<tr bgcolor="#ffffff" align="center">
    		<td>病情：</td>
    		<td colspan="2" align="left">
    		<%=map.get("bq") %>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff" align="center">
    		<td  align="center">诊断：</td>
    		<td colspan="2" align="left">
    		<%=map.get("zd") %>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td  align="center">药品、处置：</td>
    		<td colspan="2">
    		<%
		String yinfo = "";
		String a[] = info.split("\\$");
		String b[] = numinfo.split("\\$");
		for(int i=0;i<a.length;i++){
			yinfo += a[i]+"&nbsp;&nbsp;数量:"+b[i]+"<br/>";
		}
		%>
		<%=yinfo %>
    		</td>
    	</tr>
    	
    	<tr bgcolor="#ffffff">
    		<td  align="center">医生：</td>
    		<td colspan="2">
    		<%=map.get("oper") %>
    		</td>
    	</tr>
    	
    	<tr bgcolor="#ffffff">
    		<td colspan="3">
    			<input id="btnPrint" type="button" value="打印" onclick="javascript:window.print();" />
    		</td>
    	</tr>
    </TABLE>
      <!--endprint1-->
    </form>
  </body>
</html>
<script type="text/javascript">
function preview(oper)       
{
if (oper < 10)
{
bdhtml=window.document.body.innerHTML;//获取当前页的html代码
sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域
eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域
prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html

prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
window.document.body.innerHTML=prnhtml;
window.print();
window.document.body.innerHTML=bdhtml;
} else {
window.print();
}
}
</script>