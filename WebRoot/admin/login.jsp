<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="yzm" scope="page" class="util.CheckCode"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>私人牙科诊所病例管理系统 </title>
    
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
  <%
String message = (String)request.getAttribute("message");
	if(message == null){
			message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
 	String code=yzm.getCheckCode();
%>
  <body  onload=document.f1.uname.focus();>
  <form action="/srykzsblmis/studysite?ac=login" method="post" name="f1" onsubmit="return ck()">
   <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" bgColor=#0000FF
border=0>
  <TR>
    <TD align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD align="center" height="30"><font size="4" color="white"><b>私人牙科诊所病例管理系统 </b></font></TD>
          <td></td>
        </TR>
        <TR>
          <TD><IMG height=147 src="admin/images/login_2.jpg" 
            width=468></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 bgColor=#FFF border=0>
        <TR>
          <TD width=16><IMG height=122 src="admin/images/login_3.jpg" 
            width=16></TD>
          <TD align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=230 border=0>
              <TR height=5>
                <TD width=5></TD>
                <TD width=56></TD>
                <TD></TD></TR>
              <TR height=36>
                <TD></TD>
                <TD>用户名</TD>
                <TD><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  maxLength=30 size=24  name=uname></TD></TR>
              <TR height=36>
                <TD>&nbsp; </TD>
                <TD>口　令</TD>
                <TD><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  type=password maxLength=30 size=24 name=upass></TD></TR>
                 <TR >
                <TD>&nbsp; </TD>
                <TD>验证码</TD>
                <TD><input type="text" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                 size="5" id="yzm" name="yzm" class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"><%=code %></TD></TR>
              <TR height=5>
                <TD colSpan=3></TD></TR>
              <TR>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD><INPUT type=image height=18 width=70 
                  src="admin/images/bt_login.gif"></TD></TR></TABLE></TD>
          <TD width=16><IMG height=122 src="admin/images/login_4.jpg" 
            width=16></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD><IMG height=16 src="admin/images/login_5.jpg" 
          width=468></TD></TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=468 border=0>
        <TR>
          <TD align=right>
            </TD>
          </TR>
        </TABLE>
      </TD>
    </TR>
  </TABLE>
</form>
  </body>
</html>
<script type="text/javascript">
	function ck(){
		if(f1.uname.value==""){
			alert("用户名不能为空");
			return false;
		}if(f1.upass.value==""){
			alert("密码不能为空");
			return false;
		}if(f1.yzm.value==""){
  		alert("验证码不能为空");
  		return false;
  		}if(f1.yzm.value!=<%=code%>){
			alert("验证码错误!");
			f1.yzm.focus();
			return false
		}
	}
</script>