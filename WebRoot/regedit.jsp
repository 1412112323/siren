<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
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
<STYLE type=text/css>
BODY
{
            padding-right: 0px;
            padding-left: 0px;
            padding-bottom: 0px;
            margin: 0px;
            padding-top: 0px;
            font-size: 12px;
}
.STYLE2 {
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

    <jsp:include page="top.jsp"></jsp:include>
    
      <div style="margin-top:10px;text-align:center;">
        <table width=800 border="0" cellpadding="0" cellspacing="0">
            <tr height=320 bgcolor="#1FA9FE" style="color:white;font-weight:bold;">
                <td align="center" width=800 bgcolor="#ECECED" valign="top" style="">
                    <div style="margin-left:20px;font-size:16px;font-weight:bold;color:#044A8E;margin-top:20px;text-align:center;">
                        用户注册
                    </div> 
                    <hr>
                    <div style="font-size:12px;color:#044A8E;margin-top:20px;text-align:center;font-weight:normal;">
                    <form action="/srykzsblmis/studysite?ac=regedit" name="f1" method="post">
                        <table border=0 width=700 style="font-size:12px">
                            <tr bgcolor="#ffffff">
                                <td width=130 >
                                    登录名称：
                                </td>
                                <td width=570 align="left">
                                    <input name="uname" type="text" id="uname" style="width:150px;" />&nbsp;
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td >
                                    登录密码：
                                </td>
                                <td align="left">
                                    <input name="upass" type="password" id="upass" style="width:150px;" />&nbsp;
                                </td>
                            </tr>
                            <tr bgcolor="#ffffff">
                                <td >
                                    重复密码：
                                </td>
                                <td align="left">
                                    <input name="upass1" type="password" id="upass1" style="width:150px;" />&nbsp;
                                </td>
                            </tr>
         <tr bgcolor="#ffffff">
    		<td>病人姓名</td>
    		<td><input type="text" id="tname" name="tname" size="5"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>性别</td>
    		<td>
    			<select id="sex" name="sex">
    				<option value="男">男</option>
    				<option value="女">女</option>
    			</select>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>年龄</td>
    		<td><input type="text" id="age" name="age" size="2"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>身份证</td>
    		<td><input type="text" id="idcard" name="idcard" />*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>电话</td>
    		<td><input type="text" id="tel" name="tel" />*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>住址</td>
    		<td><input type="text" id="addr" name="addr" />*</td>
    	</tr>       
                                                                          
                            <tr height=60>
                                <td align="center" colspan="2">
                                   <img src="images/reg.png" border="0" onclick="ck()"/>
                                </td>
                            </tr>                                                                                    
                        </table>
                        </form>
                        
                    </div>  
                </td>
            </tr>
        </table>
        <div style="margin-top:10px;height:1px;background-color:#1FA9FE;text-align:center;width:800px;">
            
        </div>     
               
    </div> 

    <jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript">
	function ck(){
		if(f1.uname.value==""){
			alert("用户名不能为空");
			return false;
		}if(f1.upass.value==""){
			alert("密码不能为空");
			return false;
		}if(f1.upass1.value==""){
			alert("再次输入密码");
			return false;
		}if(f1.upass1.value!=f1.upass.value){
			alert("两次密码不一致");
			return false;
		}if(f1.tname.value==""){
			alert("姓名不能为空");
			return false;
		}if(f1.sex.value==""){
			alert("性别不能为空");
			return false;
		}if(f1.idcard.value==""){
			alert("身份证不能为空");
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
 alert("已存在的用户名");
 <%}
if(suc!=null)
{
 %>
 alert("注册成功");
location.replace("/srykzsblmis/index.jsp");
 <%}%>
</script>
  </body>
</html>
