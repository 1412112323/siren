<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK href="admin/css/admin.css" type="text/css" rel="stylesheet">
<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
  </head>
  <%HashMap admin = (HashMap)session.getAttribute("admin");%>
  <body>
    <TABLE height="100%" cellSpacing=0 cellPadding=0 width=170 
background=admin/images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        
        <TR>
          <TD height=10></TD></TR></TABLE>
         
         <%if(admin.get("utype").equals("管理员")){ %>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=admin/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(1) 
            href="javascript:void(0);">基础功能</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
      
      <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/noticeadd.jsp" 
            target=main>新增公告</A></TD></TR>
      
      <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/notice.jsp" 
            target=main>公告管理</A></TD></TR>
            
            
            <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/chat.jsp" 
            target=main>留言管理</A></TD></TR>
      
      
      <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/sysuseradd.jsp" 
            target=main>新增医护用户</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/sysuser.jsp" 
            target=main>医护用户管理</A></TD></TR>
            
       <!--      <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/testadd1.jsp" 
            target=main>测试1</A></TD></TR>-->  
       <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/deptadd.jsp" 
            target=main>新增医院科室</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/deptlist.jsp" 
            target=main>医院科室管理</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/ypcfadd.jsp" 
            target=main>新增药品处置</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/ypcflist.jsp" 
            target=main>药品处置管理</A></TD></TR>
        
            
        <TR height=4>
          <TD colSpan=2></TD></TR></TABLE>
         <%} %>
         <%if(admin.get("utype").equals("挂号人员")){ %>
         
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=admin/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(2) 
            href="javascript:void(0);">挂号管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
      <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/yy.jsp" 
            target=main>预约挂号</A></TD></TR>
       <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/ghadd.jsp" 
            target=main>新增挂号</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/ghlist.jsp" 
            target=main>挂号管理</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR></TABLE>
          
      
		<%} %>
      <%if(admin.get("utype").equals("药房人员")){ %>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=admin/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(3) 
            href="javascript:void(0);">药房管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/dfy.jsp" 
            target=main>待发药</A></TD></TR>
         <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/yfy.jsp" 
            target=main>发药记录</A></TD></TR>
            <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/yprk.jsp" 
            target=main>药品入库</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/ypkc.jsp" 
            target=main>药品库存</A></TD></TR>
       <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/kcrecord.jsp" 
            target=main>库存记录</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR></TABLE>
          
          <%} %>
          
           
       <%if(admin.get("utype").equals("管理员")){ %>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=admin/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(4) 
            href="javascript:void(0);">统计报表</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/sftj.jsp" 
            target=main>收费统计</A></TD></TR>
            
            <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/ghtj.jsp" 
            target=main>挂号统计</A></TD></TR>
            
 		<TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/mzltj.jsp" 
            target=main>门诊量统计</A></TD></TR>
            
        <TR height=4>
          <TD colSpan=2></TD></TR></TABLE>
          <%} %>
          
          <%if(admin.get("utype").equals("收费人员")){ %>
            <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=admin/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(6) 
            href="javascript:void(0);">收费管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child6 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/dsf.jsp" 
            target=main>待收费</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/ysf.jsp" 
            target=main>已收费</A></TD></TR>
       <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/sftj.jsp" 
            target=main>收费统计</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR></TABLE>
          <%} %>
          
           <%if(admin.get("utype").equals("医生")){ %>
         <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=admin/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(5) 
            href="javascript:void(0);">就诊管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/jzghlist.jsp" 
            target=main>挂号信息</A></TD></TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/jzghrecord.jsp" 
            target=main>问诊记录</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD></TR></TABLE>

         <%} %>
         
       
         
           <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=admin/images/menu_bt.jpg><A 
            class=menuParent onclick=expand(7) 
            href="javascript:void(0);">个人信息</A></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
      <TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="admin/uppass.jsp" 
            target=main>修改个人信息</A></TD></TR>
 
        <TR height=4>
          <TD colSpan=2></TD></TR></TABLE>
          
    
      
          
          
        
     </TD>
    <TD width=1 bgColor=#d1e6f7></TD></TR></TABLE>
  </body>
</html>
