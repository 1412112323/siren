<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<LINK rel=stylesheet type=text/css href="/frontfile/css.css">
  </head>
  
  <body>
<%HashMap user = (HashMap)session.getAttribute("user"); %>
    <jsp:include page="top.jsp"></jsp:include>
    <div style="margin-top:10px;text-align:center;">
        <table width=800 border="0" cellpadding="0" cellspacing="0">
            <tr height=320 bgcolor="#1FA9FE" style="color:white;font-weight:bold;">
                
                <%if(user==null){ %>
                	<td align="center" width=260 bgcolor="#ECECED" valign="top" style="">
                    <jsp:include page="left.jsp"></jsp:include>
                    </td>
                    <%}else{ %>
                    <td align="center" width=110 bgcolor="#ECECED" valign="top" style="">
                    <jsp:include page="menu.jsp"></jsp:include>
                    </td>
                    <%} %>
                
                <td width="540" align="left" bgcolor="white" style="padding-left:20px;padding-top:15px;color:Black;font-weight:normal;" valign="top">

                    <div id="dv_nr" style="margin-top:15px;line-height:1.5;">
                    <p style="WORD-SPACING: 0px; FONT: 12px/18px Simsun; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); ORPHANS: 2; WIDOWS: 2; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px">
                    <span style="FONT-SIZE: 14px">
                    <strong><span style="COLOR: rgb(255,0,0)">用户使用须知：</span></strong>
                    </span>
                    </p>
                    <p style="WORD-SPACING: 0px; FONT: 12px/18px Simsun; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); ORPHANS: 2; WIDOWS: 2; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px"><span style="FONT-SIZE: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    1、如果您尚未注册，请先注册，然后登录系统！</span>
                    </p>
                    <p style="WORD-SPACING: 0px; FONT: 12px/18px Simsun; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); ORPHANS: 2; WIDOWS: 2; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px"><span style="FONT-SIZE: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    2、选择科室进行挂号！</span></p><p style="WORD-SPACING: 0px; FONT: 12px/18px Simsun; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); ORPHANS: 2; WIDOWS: 2; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px"><span style="FONT-SIZE: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    3、患者个人信息严禁外泄！</span></p><p style="WORD-SPACING: 0px; FONT: 12px/18px Simsun; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); ORPHANS: 2; WIDOWS: 2; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px"><span style="FONT-SIZE: 12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                                                 
                </td>
            </tr>
        </table>
        <div style="margin-top:10px;height:1px;background-color:#1FA9FE;text-align:center;width:800px;">
            
        </div>     
            
    </div> 
      
<script type="text/javascript">
	function ck(){
		if(f1.uname.value==""){
			alert("用户名不能为空");
			return false;
		}if(f1.upass.value==""){
			alert("密码不能为空");
			return false;
		}else{
			f1.submit();
		}
	}
		<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("用户名或密码不正确");
 <%}
if(suc!=null)
{
 %>
location.replace("/srykzsblmis/index.jsp");
 <%}%>
</script>

    <jsp:include page="foot.jsp"></jsp:include>

  </body>
</html>
