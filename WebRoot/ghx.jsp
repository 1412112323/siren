<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="java.text.DecimalFormat"%>
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

  <%
  String ghno = request.getParameter("ghno");
  HashMap ghmap = dao.select("select * from ghinfo where ghno='"+ghno+"'").get(0); 
     		HashMap mstu = dao.select("select * from zd where ghno='"+ghno+"'").get(0);%>
        <div style="margin-top:10px;text-align:center;">
        <table width=800 border="0" cellpadding="0" cellspacing="0">
            <tr height=320 bgcolor="#1FA9FE" style="color:white;font-weight:bold;">
                <td align="center" width=110 bgcolor="#ECECED" valign="top" >
                    <jsp:include page="menu.jsp"></jsp:include>
                </td>
                <td  align="center" bgcolor="white" style="padding-left:20px;padding-top:15px;color:Black;font-weight:normal;" valign="top">
                          <!--startprint1-->
                        <table  border="1" bordercolor="#000000" cellspacing="0" cellpadding="2" style="border-collapse:collapse;font-size:12px" width="100%" align="center">
                            <tr height=30>
                                <td  align="center" colspan="2">
                                	病历
                                </td>
                            </tr>
                            
                            <tr height=30>
                                <td  align="center">
                                病情
                                </td>
                                <td  align="left">
                                <%=mstu.get("bq") %>
                                </td>
                            </tr>
                            <tr height=30>
                                <td  align="center">
                                诊断
                                </td>
                                <td  align="left">
                                <%=mstu.get("zd") %>
                                </td>
                            </tr>
                            <tr height=30>
                                <td  align="center">
                                药品
                                </td>
                                <td  align="left">
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
                            </tr>
                            <tr height=30>
                                <td  align="center">
                                总金额
                                </td>
                                <td  align="left">
                                <%if(mstu.get("totalprice")!=null){ %>
         <%DecimalFormat decimal = new DecimalFormat("#.#");
		String totalprice = decimal.format(Double.valueOf(mstu.get("totalprice").toString()));
		%>
		<%=totalprice %>元
		<%} %>
                                </td>
                            </tr>
                            <tr height=30>
                                <td  align="center" colspan="2">
                                	<input id="btnPrint" type="button" value="打印" onclick="javascript:window.print();" />
                                </td>
                            </tr>
                            
                        </table>
                        <!--endprint1-->
                </td>
            </tr>
        </table>
        <div style="margin-top:10px;height:1px;background-color:#1FA9FE;text-align:center;width:800px;">
            
        </div>     
            
    </div> 
    
    
    
    <jsp:include page="foot.jsp"></jsp:include>
    </center>
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
  </body>
</html>
