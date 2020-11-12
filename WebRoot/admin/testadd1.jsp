<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  
<script language="javascript" type="text/javascript">

<%  String cfno = "czd001"; 
  CommDAO dao = new CommDAO();
  HashMap m = dao.select("select * from czd where cfno = '"+cfno+"'").get(0);
  String info = m.get("info").toString();
  System.out.println(info);%>

</script>
  <body>
  <form action="/srykzsblmis/studysite?ac=testadd" name="f1" method="post" onsubmit="return ck()"  autocomplete="off">
   <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>新增车位</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
    <TABLE cellSpacing=1 cellPadding=2 width="95%" align=center border=0 bgcolor="#cccccc">
        <tr bgcolor="#ffffff">
    		<td> <input name="button" type="button" onclick='additem("tb")' value="添加>>"/><input type="button" value="删除" onclick="deleteitem();" /><input type="submit" name="submit" onclick="return getsub()" value="提交"/></td>
    		<input id="Hidden1" name="Hidden1" type="hidden" value="<%=info %>" />
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td>
    			<table id="tb"></table>   
    		</td>
    	</tr>

    </TABLE>
    </form>
  </body>
</html>
<script type="text/javascript">

function mSift_SeekTp(oObj, nDire) {  

        var nPosition = null;  

        if (oObj.getBoundingClientRect && !document.all) {  

            var oDc = document.documentElement;  

            switch (nDire) {  

            case 0:  

                return oObj.getBoundingClientRect().top + oDc.scrollTop;  

            case 1:  

                return oObj.getBoundingClientRect().right + oDc.scrollLeft;  

            case 2:  

                return oObj.getBoundingClientRect().bottom + oDc.scrollTop;  

            case 3:  

                return oObj.getBoundingClientRect().left + oDc.scrollLeft;  

            }  

        } else {  

            if (nDire == 1 || nDire == 3) {  

                nPosition = oObj.offsetLeft;  

            } else {  

                nPosition = oObj.offsetTop;  

            }  

            if (arguments[arguments.length - 1] != 0) {  

                if (nDire == 1) {  

                    nPosition += oObj.offsetWidth;  

                } else if (nDire == 2) {  

                    nPosition += oObj.offsetHeight;  

                }  

            }  

            if (oObj.offsetParent != null) {  

                nPosition += mSift_SeekTp(oObj.offsetParent, nDire, 0);  

            }  

            return nPosition;  

        }  

    }  

    function mSift(cVarName, nMax) {  

        this.oo = cVarName;  

        this.Max = nMax;  

    }  

    mSift.prototype = {  

        Varsion : 'v2010.10.29 by AngusYoung | mrxcool.com',  

        Target : Object,  

        TgList : Object,  

        Listeners : null,  

        SelIndex : 0,  

        Data : [],  

        ReData : [],  

        Create : function(oObj) {  

            var _this = this;  

            var oUL = document.createElement('ul');  

            oUL.style.display = 'none';  

            oObj.parentNode.insertBefore(oUL, oObj);  

            _this.TgList = oUL;  

            oObj.onkeydown = oObj.onclick = function(e) {  

                _this.Listen(this, e);  

            };  

            oObj.onblur = function() {  

                setTimeout(function() {  

                    _this.Clear();  

                }, 100);  

            };  

        },  

        Complete : function() {  

        },  

        Select : function() {  

            var _this = this;  

            if (_this.ReData.length > 0) {  

                _this.Target.value = _this.ReData[_this.SelIndex].replace(  

                        /\*/g, '*').replace(/\|/g, '|');  

                _this.Clear();  

            }  

            setTimeout(function() {  

                _this.Target.focus();  

            }, 10);  

            _this.Complete();  

        },  

        Listen : function(oObj) {  

            var _this = this;  

            _this.Target = oObj;  

            var e = arguments[arguments.length - 1];  

            var ev = window.event || e;  

            switch (ev.keyCode) {  

            case 9://TAB  

                return;  

            case 13://ENTER  

                _this.Target.blur();  

                _this.Select();  

                return;  

            case 38://UP  
                _this.SelIndex = _this.SelIndex > 0 ? _this.SelIndex - 1  
                        : _this.ReData.length - 1;  
                break;  
            case 40://DOWN  
                _this.SelIndex = _this.SelIndex < _this.ReData.length - 1 ? _this.SelIndex + 1  
                        : 0;  
                break;  
            default:  
                _this.SelIndex = 0;  
            }  
            if (_this.Listeners) {  
                clearInterval(_this.Listeners);  
            }  
            _this.Listeners = setInterval(function() {  
                _this.Get();  
            }, 10);  
        },  
        Get : function() {  
            var _this = this;  
            if (_this.Target.value == '') {  
                _this.Clear();  
                return;  
            }  
            if (_this.Listeners) {  
                clearInterval(_this.Listeners);  
            }  
            ;  
            _this.ReData = [];  
            var cResult = '';  
            for ( var i = 0; i < _this.Data.length; i++) {  
                if (_this.Data[i].toLowerCase().indexOf(  
                        _this.Target.value.toLowerCase()) >= 0) {  
                    _this.ReData.push(_this.Data[i]);  
                    if (_this.ReData.length == _this.Max) {  
                        break;  
                    }  
                }  
            }  
            var cRegPattern = _this.Target.value.replace(/\*/g, '*');  
            cRegPattern = cRegPattern.replace(/\|/g, '|');  
            cRegPattern = cRegPattern.replace(/\+/g, '\\+');  
            cRegPattern = cRegPattern.replace(/\./g, '\\.');  
            cRegPattern = cRegPattern.replace(/\?/g, '\\?');  
            cRegPattern = cRegPattern.replace(/\^/g, '\\^');  
            cRegPattern = cRegPattern.replace(/\$/g, '\\$');  
            cRegPattern = cRegPattern.replace(/\(/g, '\\(');  
            cRegPattern = cRegPattern.replace(/\)/g, '\\)');  
            cRegPattern = cRegPattern.replace(/\[/g, '\\[');  
            cRegPattern = cRegPattern.replace(/\]/g, '\\]');  
            cRegPattern = cRegPattern.replace(/\\/g, '\\\\');  
            var cRegEx = new RegExp(cRegPattern, 'i');  
            for ( var i = 0; i < _this.ReData.length; i++) {  
                if (_this.Target.value.indexOf('*') >= 0) {  
                    _this.ReData[i] = _this.ReData[i].replace(/\*/g, '*');  
                }  
                if (_this.Target.value.indexOf('|') >= 0) {  
                    _this.ReData[i] = _this.ReData[i].replace(/\|/g, '|');  
                }  
                cResult += '<li style="padding:0 5px;line-height:20px;cursor:default;" onmouseover="' 
                        + _this.oo  
                        + '.ChangeOn(this);' 
                        + _this.oo  
                        + '.SelIndex=' 
                        + i  
                        + ';" onmousedown="' 
                        + _this.oo  
                        + '.Select();">' 
                        + _this.ReData[i]  
                                .replace(  
                                        cRegEx,  
                                        function(s) {  
                                            return '<span style="background:#ff9;font-weight:bold;font-style:normal;color:#e60;">' 
                                                    + s + '</span>';  
                                        });  
                +'</li>';  
            }  
            if (cResult == '') {  
                _this.Clear();  
            } else {  
                _this.TgList.innerHTML = cResult;  
                _this.TgList.style.cssText = 'display:block;position:absolute;background:#fff;border:#090 solid 1px;margin:-1px 0 0;padding: 5px;list-style:none;font-size:12px;';  
                _this.TgList.style.top = mSift_SeekTp(_this.Target, 2) + 'px';  
                _this.TgList.style.left = mSift_SeekTp(_this.Target, 3) + 'px';  
                _this.TgList.style.width = _this.Target.offsetWidth - 12 + 'px';  
            }  
            var oLi = _this.TgList.getElementsByTagName('li');  
            if (oLi.length > 0) {  
                oLi[_this.SelIndex].style.cssText = 'background:#36c;padding:0 5px;line-height:20px;cursor:default;color:#fff;';  
            }  
        },  
        ChangeOn : function(oObj) {  
            var oLi = this.TgList.getElementsByTagName('li');  
            for ( var i = 0; i < oLi.length; i++) {  
                oLi[i].style.cssText = 'padding:0 5px;line-height:20px;cursor:default;';  
            }  
            oObj.style.cssText = 'background:#36c;padding:0 5px;line-height:20px;cursor:default;color:#fff;';  
        },  
        Clear : function() {  
            var _this = this;  
            if (_this.TgList) {  
                _this.TgList.style.display = 'none';  
                _this.ReData = [];  
                _this.SelIndex = 0;  
            }  
        }  
    }  
</script>
<script type="text/javascript">  
    //建立实例，第一个参数是实例对象的名称，第二个是最多显示的数量  
    var oo = new mSift('oo', 20);  
    //获取数据  
    function loadXMLDoc(obj) {  
        var xmlhttp;  
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari  
            xmlhttp = new XMLHttpRequest();  
        } else {// code for IE6, IE5  
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");  
        }  
        xmlhttp.onreadystatechange = function() {  
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {  
                oo.Data = xmlhttp.responseText.split("$");  
            }  
        };  
        xmlhttp.open("GET", "/srykzsblmis/studysite?ac=test&str="+obj.value, true);  
        xmlhttp.send();  
        fill(obj);
    }  
        //指定文本框对象建立特效  
        function fill(obj){
        	oo.Create(document.getElementById(obj.id));  
        }
        

    </script>
    
    <script type="text/javascript">

	<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/srykzsblmis/admin/testadd1.jsp");
 <%}%>
</script>

<script type="text/javascript">
var count=0 ;
var num = 0;
  <%
  if(!info.equals("")&&info!=""&&info!=null){%>
    var count=0 ;
	var info = '<%=info%>';
	var infoArray = info.split("$");
	num = infoArray.length-1;
	//var cell;
	//cell.
	var id = 'tb';
	var cell;
	var row;
	
	for(var i=0;i<num;i++){
	row = document.getElementById(id).insertRow();
		if(row != null){
		cell = row.insertCell();
		
		cell.innerHTML=""+(i+1)+" <input  onfocus='loadXMLDoc(this)' value='"+infoArray[i]+"'  id='St"+i+"' type='text' name='St"+i+"' >";
		}

	}
<%}%>
if(num!=0){
count = num;
}

function additem(id)
{

    var row,cell,str;
    
    row = document.getElementById(id).insertRow();
    
    if(row != null )
    {
	cell = row.insertCell();
	cell.innerHTML=""+(count+1)+" <input  onfocus='loadXMLDoc(this)'   id='St"+count+"' type='text' name='St"+count+"' >";
	count ++;
    }
}
function deleteitem()
{
    //var curRow = obj.parentNode.parentNode;
    //tb.deleteRow(curRow.rowIndex);
    
    var tbl = document.getElementById('tb');
	var lastRow = tbl.rows.length;
	if (lastRow > 1){
		tbl.deleteRow(lastRow - 1);
		count--;
	}else if(lastRow==1){
		tbl.deleteRow(-1);
		count--;
	}
	
}

function getsub()
{
var re="";
	//if(count==0){
	//	alert("请填写");
	//	return false;
	//}else{
	for (var    i = 0 ;i<count;i++)
	{
		if(document.getElementsByName("St"+i)[0].value==undefined||document.getElementsByName("St"+i)[0].value==''||document.getElementsByName("St"+i)[0].value==null){
			alert("第"+(i+1)+"项为空,请填写");
			return false;
		}else{
			re += document.getElementsByName("St"+i)[0].value+'$';
		}
	}
	document.getElementById("Hidden1").value=re;
	//}
}
  </script>