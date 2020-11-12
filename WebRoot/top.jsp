<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<STYLE type=text/css>.STYLE2 {
	FONT-SIZE: 12px
}
.STYLE3 {
	FONT-WEIGHT: bold
}
.style7 {
	FONT-FAMILY: "黑体", "方正美黑简体", "华文细黑"; COLOR: #646464; FONT-SIZE: 18px
}
BODY {
	BACKGROUND-IMAGE: url(img/lbg.gif); PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; FONT-SIZE: 12px; PADDING-TOP: 0px
}
.tb {
	WIDTH: 926px
}
.td2 {
	TEXT-ALIGN: left; PADDING-LEFT: 80px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 100%
}
.txtBox {
	BORDER-BOTTOM: #e7ad01 1px solid; BORDER-LEFT: #e7ad01 1px solid; WIDTH: 130px; HEIGHT: 20px; COLOR: #000000; FONT-SIZE: 13px; BORDER-TOP: #e7ad01 1px solid; BORDER-RIGHT: #e7ad01 1px solid
}
#div1 {
	
}
#diqu {
	TEXT-ALIGN: center; WIDTH: 588px; BACKGROUND: url(images/2009_index_04.gif) no-repeat; COLOR: #2e466f
}
#diqu A {
	COLOR: #2e466f
}
.pageWidth {
	TEXT-ALIGN: left; MARGIN: 0px auto; WIDTH: 850px; BACKGROUND: #ffffff
}
#nav {
	PADDING-BOTTOM: 0px; LIST-STYLE-TYPE: none; MARGIN: 1em 0px 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; FONT-SIZE: 16px; FONT-WEIGHT: 200; LIST-STYLE-IMAGE: none; PADDING-TOP: 0px
}
#nav LI {
	FONT-FAMILY: "宋体"; FLOAT: left; FONT-SIZE: 14px; MARGIN-RIGHT: 1px
}
#nav LI A {
	TEXT-ALIGN: center; LINE-HEIGHT: 35px; MARGIN: 0em 0px 0px; WIDTH: 120.5px; DISPLAY: block; BACKGROUND: #f6ad79; COLOR: #000000; FONT-SIZE: 14px; TEXT-DECORATION: none; PADDING-TOP: 5px
}
.bi:hover SPAN {
	TEXT-ALIGN: center; LINE-HEIGHT: 35px; MARGIN: 0em 0px 0px; WIDTH: 120.5px; DISPLAY: block; BACKGROUND: #f6ad79; COLOR: #000000; FONT-SIZE: 14px; TEXT-DECORATION: none; PADDING-TOP: 5px
}
#nav LI A:hover {
	BACKGROUND: #dc3e0b; COLOR: #ffffff; FONT-SIZE: 14px; CURSOR: hand; PADDING-TOP: 0px
}
.bi:hover SPAN {
	BACKGROUND: #dc3e0b; COLOR: #ffffff; FONT-SIZE: 14px; CURSOR: hand; PADDING-TOP: 0px
}
.bi:hover SPAN {
	PADDING-TOP: 5px
}
.la {
	COLOR: #044a8e; TEXT-DECORATION: none
}
.la:hover {
	TEXT-DECORATION: underline
}
</STYLE>

<LINK rel=stylesheet type=text/css href="./frontfile/css.css">
  </head>
  <%HashMap user = (HashMap)session.getAttribute("user");  %>
  <body>
    <center>
       <div style="text-align:center;">
        <table width=800 border="0" cellpadding="0" cellspacing="0">
            <tr height=80>
                <td background="images/top1.gif"></td>
            </tr>
        </table>
    </div>
    	<div style="margih-top:10px;text-align:center;" class="menu">
        <table width=800 border="0" cellpadding="0" cellspacing="0">
            <tr height=30 bgcolor="#1FA9FE" style="color:white;font-weight:bold;">
                <td align="center"><a href="index.jsp"><font size="2">首页</font></a></td>
                <td align="center"><a href="notice.jsp"><font size="2">公告</font></a></td>
                <td align="center"><a href="chat.jsp"><font size="2">留言板</font></a></td>
                <%if(user==null){ %>
                <td align="center"><a href="regedit.jsp"><font size="2">用户注册</font></a></td>
                <%} %>
                <td align="center"><a href="deptlist.jsp"><font size="2">预约挂号</font></a></td>
            </tr>
        </table>
    </div>
    </center>
  </body>
</html>
