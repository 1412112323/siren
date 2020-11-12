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
  String id = request.getParameter("id");
  HashMap map = dao.select("select * from ypcf where id="+id).get(0);
  %>
  <body>
  <form action="/srykzsblmis/studysite?ac=ypcfedit" name="f1" method="post" onsubmit="return ck()">
   <input type="hidden" id="id" name="id" >
   <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>编辑药品、处置</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
    <TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
    	<tr bgcolor="#ffffff">
    		<td>编号</td>
    		<td><%=map.get("yno") %></td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>名称</td>
    		<td><input type="text"  id="yname" name="yname"/>*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>单价</td>
    		<td><input type="text"  id="price" name="price" onkeyup='checkDecimal(this)'/>元*</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>类型</td>
    		<td>
    			<select id="type" name="type" onchange="cg()">
    				<option value="处置">处置</option>
    				<option value="药品">药品</option>
    				
    			</select>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff" style="display: none" id="u1">
    		<td>规格</td>
    		<td><input type="text"  id="gg" name="gg"/>*</td>
    	</tr>
    	
    	<tr bgcolor="#ffffff" style="display: none" id="u2">
    		<td>厂商</td>
    		<td><input type="text"  id="company" name="company"/>*</td>
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
  	<%if(map.get("type").equals("药品")){%>
  		document.getElementById("u1").style.display = 'block';
  		document.getElementById("u2").style.display = 'block';
  	<%}%>
  </script>
<script type="text/javascript">
function cg(){
	if(f1.type.value=="药品"){
		document.getElementById("u1").style.display = 'block';
		document.getElementById("u2").style.display = 'block';
	}else{
		document.getElementById("u1").style.display = 'none';
		document.getElementById("u2").style.display = 'none';
	}
}
	function ck(){
		if(f1.yname.value==""){
			alert("名称不能为空");
			return false;
		}if(f1.price.value==""){
			alert("单价不能为空");
			return false;
		}
		if(f1.type.value=="药品"){
			if(f1.gg.value==""){
				alert("规格不能为空");
				return false;
			}if(f1.company.value==""){
				alert("厂商不能为空");
				return false;
			}
		}
		
		
	}
	<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("已存在编号");
 <%}
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/srykzsblmis/admin/ypcflist.jsp");
 <%}%>
</script>
<%=Info.tform(map)%>