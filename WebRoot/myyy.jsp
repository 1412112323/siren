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
  ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from yy where uid='"+user.get("id")+"' order by savetime desc");
  %>
  <script type="text/javascript">
  <%
    String did = request.getParameter("did");
  if(did!=null)
  {
	   dao.commOper("delete from  yy  where id="+did);%>
	   location.href("myyy.jsp");
  <%}
  %>
  </script>
  
        <div style="margin-top:10px;text-align:center;">
        <table width=800 border="0" cellpadding="0" cellspacing="0">
            <tr height=320 bgcolor="#1FA9FE" style="color:white;font-weight:bold;">
                <td align="center" width=110 bgcolor="#ECECED" valign="top" >
                    <jsp:include page="menu.jsp"></jsp:include>
                </td>
                <td  align="center" bgcolor="white" style="padding-left:20px;padding-top:15px;color:Black;font-weight:normal;" valign="top">
                        <table  border="1" bordercolor="#000000" cellspacing="0" cellpadding="2" style="border-collapse:collapse;font-size:12px" width="100%" align="center">
                            <tr height=30>
                                <td  align="center">科室</td>
                                <td  align="center">号别</td>
                                <td  align="center">挂号编号</td>
                                <td  align="center">挂号日期</td>
                                <td  align="center">操作</td>
                            </tr>
                            <%for(HashMap map:list){ 
                            HashMap m = dao.select("select * from dept where id="+map.get("dept")).get(0);
                            %>
                            <tr align="center">
                            	<td><%=m.get("deptname") %></td>
                            	<td>
                            	<%=map.get("type").equals("5")?"普通号":"专家号" %>
                            	
                            	</td>
                            	<td><a href="ghx.jsp?ghno=<%=map.get("ghno") %>"><%=map.get("ghno") %></a></td>
                            	<td><%=map.get("savetime") %></td>
                            	<td>
                            		<%if(map.get("ghno").equals("")){ %>
                            			<a href="myyy.jsp?did=<%=map.get("id") %>">撤销</a>
                            		<%} %>
                            	</td>
                            </tr> 
                            <%} %>                                                                    
                        </table>
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
