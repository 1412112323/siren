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

  %>
  <body>
  <form action="/srykzsblmis/studysite?ac=ghadd" name="f1" method="post" onsubmit="return ck()">
   <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>新增挂号</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
    <TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
    	<tr bgcolor="#ffffff">
    		<td>挂号编号</td>
    		<td><input type="text" id="ghno" name="ghno" value="<%=Info.AutoID() %>"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>病人姓名</td>
    		<td><input type="text" id="tname" name="tname" size="5" value=""/>*</td>
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
    	<tr bgcolor="#ffffff" >
    		<td>科室</td>
    		<td>
    			<select id="ghdept" name="ghdept">
    			<%ArrayList<HashMap> deptlist  = (ArrayList<HashMap>)dao.select("select * from dept where delstatus='0'"); 
    			for(HashMap deptm:deptlist){%>
    				<option value="<%=deptm.get("id") %>"><%=deptm.get("deptname") %></option>
    				<%} %>
    			</select>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>挂号费</td>
    		<td>
    		<select id="price" name="price">
    			<option value="5">普通号</option>
    			<option value="10">专家号</option>
    		</select>
    		
    		元*</td>
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
            var record={
                num:""
            }
            var checkDecimal=function(n){
                var decimalReg=/^\d{0,8}\.{0,1}(\d{1,2})?$/;//var decimalReg=/^[-\+]?\d{0,8}\.{0,1}(\d{1,2})?$/;
                if(n.value!=""&&decimalReg.test(n.value)){
                    record.num=n.value;
                }else{
                    if(n.value!=""){
                        n.value=record.num;
                    }
                }
            }
        </script>
<script type="text/javascript">
	function ck(){
		if(f1.tname.value==""){
			alert("病人姓名不能为空");
			return false;
		}if(f1.age.value==""){
			alert("年龄不能为空");
			return false;
		}if(f1.idcard.value==""){
			alert("身份证不能为空");
			return false;
		}if(f1.tel.value==""){
			alert("电话不能为空");
			return false;
		}if(f1.addr.value==""){
			alert("住址不能为空");
			return false;
		}if(f1.ghdept.value==""){
			alert("科室不能为空");
			return false;
		}if(f1.price.value==""){
			alert("挂号费不能为空");
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
location.replace("/srykzsblmis/admin/ghlist.jsp");
 <%}%>
</script>