<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
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
  String id = request.getParameter("id");
  HashMap map = dao.select("select * from sysuser where id="+id).get(0);
  %>

  <body>
  <form action="/srykzsblmis/studysite?ac=sysuseredit" name="f1" method="post" onsubmit="return ck()">
       <input type="hidden" id="id" name="id" >
   <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>编辑用户</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
    <TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
    	<tr bgcolor="#ffffff">
    		<td>用户名</td>
    		<td><input type="text" maxLength=10 id="uname" name="uname"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>密码</td>
    		<td><input type="password" maxLength=10 id="upass" name="upass"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>姓名</td>
    		<td><input type="text" maxLength=10 id="tname" name="tname"/>*</td>
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
    		<td>电话</td>
    		<td><input type="text" id="tel" name="tel"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>出生年月</td>
    		<td><input type="text" id="birth" name="birth" readonly="readonly"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>*</td>
    		<script  language=javascript src="/srykzsblmis/commfiles/js/calendar/WdatePicker.js"></script>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>婚否</td>
    		<td>
    			<select id="ismarage" name="ismarage">
    				<option value="未婚">未婚</option>
    				<option value="已婚">已婚</option>
    			</select>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>邮箱</td>
    		<td><input type="text" id="email" name="email"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>身份证号</td>
    		<td><input type="text" id="idcard" name="idcard"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>毕业学校</td>
    		<td><input type="text" id="byschool" name="byschool"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>住址</td>
    		<td><input type="text" id="addr" name="addr"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>用户类型</td>
    		<td>
    			<select id="utype" name="utype" onchange="cg()">
    				<option value="挂号人员">挂号人员</option>
    				<option value="收费人员">收费人员</option>
    				<option value="药房人员">药房人员</option>
    				<option value="医生">医生</option>
    			</select>
    		</td>
    	</tr>
    	
    	<tr bgcolor="#ffffff" style="display: none" id="uu">
    		<td>科室</td>
    		<td>
    			<select id="dept" name="dept">
    			<%ArrayList<HashMap> deptlist  = (ArrayList<HashMap>)dao.select("select * from dept where delstatus='0'"); 
    			for(HashMap deptm:deptlist){%>
    				<option value="<%=deptm.get("id") %>"><%=deptm.get("deptname") %></option>
    				<%} %>
    			</select>
    		</td>
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
  	<%if(map.get("utype").equals("医生")){%>
  		document.getElementById("uu").style.display = 'block';
  	<%}%>
  </script>
<script type="text/javascript">
function cg(){
	if(f1.utype.value=="医生"){
		document.getElementById("uu").style.display = 'block';
	}else{
		document.getElementById("uu").style.display = 'none';
	}
}
	function ck(){
		if(f1.upass.value==""){
			alert("密码不能为空");
			return false;
		}if(f1.tname.value==""){
			alert("姓名不能为空");
			return false;
		}if(f1.tel.value==""){
			alert("电话不能为空");
			return false;
		}if(f1.birth.value==""){
			alert("出生年月不能为空");
			return false;
		}if(f1.email.value==""){
			alert("邮箱不能为空");
			return false;
		}if(f1.idcard.value==""){
			alert("身份证号不能为空");
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
location.replace("/srykzsblmis/admin/sysuser.jsp");
 <%}%>
</script>
<%=Info.tform(map)%>