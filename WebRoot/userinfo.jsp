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
  HashMap map = dao.select("select * from patient where id='"+user.get("id")+"' ").get(0);%>
  
        <div style="margin-top:10px;text-align:center;">
        
        <table width=800 border="0" cellpadding="0" cellspacing="0">
        
            <tr height=320 bgcolor="#1FA9FE" style="color:white;font-weight:bold;">
                <td align="center" width=110 bgcolor="#ECECED" valign="top" style="">
                    <jsp:include page="menu.jsp"></jsp:include>
                </td>
                <td  align="center" bgcolor="white" style="padding-left:20px;padding-top:15px;color:Black;font-weight:normal;" valign="top">

			<form action="/srykzsblmis/studysite?ac=userinfo&id=<%=map.get("id") %>" name="f1" method="post" onsubmit="return ck()">
                        <table border=0  style="font-size:12px">
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
                                <input type="submit" value="提交">
                                </td>
                            </tr>                                                                                    
                        </table>
                        </form>
                                                 
                </td>
            </tr>
        </table>
        <div style="margin-top:10px;height:1px;background-color:#1FA9FE;text-align:center;width:800px;">
            
        </div>     
            
    </div> 
    
    
    
    <jsp:include page="foot.jsp"></jsp:include>
    </center>
    <script type="text/javascript">
	function ck(){
		if(f1.upass.value==""){
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
 alert("修改成功");
location.replace("/srykzsblmis/userinfo.jsp");
 <%}%>
</script>
  </body>
</html>
<%=Info.tform(map)%>