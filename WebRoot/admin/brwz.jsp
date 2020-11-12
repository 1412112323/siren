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
  String ghno = request.getParameter("ghno");
  HashMap map = dao.select("select * from  ghinfo  where ghno="+ghno).get(0);

  %>
  <body>
  <form action="/srykzsblmis/studysite?ac=wzadd" name="f1" method="post" onsubmit="return getsub()">
  
  <input type="hidden" id="ghno" name="ghno" value="<%=map.get("ghno") %>">
   <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <TR height=20>
    <TD></TD></TR>
  <TR height=22>
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align=middle background=admin/images/title_bg2.jpg>病人问诊</TD></TR>
  <TR bgColor=#ecf4fc height=12>
    <TD></TD></TR>
  <TR height=20>
    <TD></TD></TR></TABLE>
    <TABLE cellSpacing=1 cellPadding=2 width="70%" align=center border=0 bgcolor="#cccccc">
    	<th colspan="3">病情诊断</th>
    	<tr bgcolor="#ffffff" align="center">
    		<td width="33%">病人姓名：<%=map.get("tname") %></td>
    		<td width="33%">性别：<%=map.get("sex") %></td>
    		<td width="33%">年龄：<%=map.get("age") %></td>
    	</tr>
    	<tr bgcolor="#ffffff" align="center">
    		<td>病情：</td>
    		<td colspan="2">
    		<textarea rows="5" cols="100" id="bq" name="bq"></textarea>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff" align="center">
    		<td  align="center">诊断：</td>
    		<td colspan="2">
    		<textarea rows="5" cols="100" id="zd" name="zd"></textarea>
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td  align="center">药品、处置：</td>
    		<td colspan="2">
    		<input name="button" type="button" onclick='additem("tb")' value="添加>>"/><input type="button" value="删除" onclick="deleteitem();" /></td>
    		<input id="Hidden1" name="Hidden1" type="hidden"  />
    		<input id="Hidden2" name="Hidden2" type="hidden"  />
    		
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td align="center">明细：</td>
    		<td colspan="2">
    			<table id="tb"></table>   
    		</td>
    	</tr>
    	<tr bgcolor="#ffffff">
    		<td colspan="3">
    			<input type="submit" value="提交"/>
    			<input type="reset" value="重置"/>
    		</td>
    	</tr>
    </TABLE>
    </form>
  </body>
</html>
<script type="text/javascript">
	function ck(){


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
location.replace("/srykzsblmis/admin/jzghlist.jsp");
 <%}%>
</script>

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
        xmlhttp.open("GET", "/srykzsblmis/studysite?ac=ajaxsearch&str="+obj.value, true);  
        xmlhttp.send();  
        fill(obj);
    }  
        //指定文本框对象建立特效  
        function fill(obj){
        	oo.Create(document.getElementById(obj.id));  
        }
        

    </script>
    
    <script type="text/javascript">
var count=0 ;
var num = 0;

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
	cell.innerHTML=""+(count+1)+" <input  onfocus='loadXMLDoc(this)'   id='St"+count+"' type='text' name='St"+count+"' size='50'> ;数量:<input type='text' id='num"+count+"' name='num"+count+"' value='1' />";
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
var reg=/^([1-9]\d*)$/;
		if(f1.bq.value==""){
			alert("病情不能为空");
			return false;
		}if(f1.zd.value==""){
			alert("诊断不能为空");
			return false;
		}
		
var re="";
	//if(count==0){
	//	alert("请填写");
	//	return false;
	//}else{
	var renum="";
	for (var    i = 0 ;i<count;i++)
	{
		if(document.getElementsByName("St"+i)[0].value==undefined||document.getElementsByName("St"+i)[0].value==''||document.getElementsByName("St"+i)[0].value==null){
			alert("第"+(i+1)+"项为空,请填写");
			return false;
		}else{
			re += document.getElementsByName("St"+i)[0].value+'$';
		}
		if(document.getElementsByName("num"+i)[0].value==undefined||document.getElementsByName("num"+i)[0].value==''||document.getElementsByName("num"+i)[0].value==null){
			alert("第"+(i+1)+"项数量为空,请填写");
			return false;
		}else if(reg.test(document.getElementsByName("num"+i)[0].value)==false){
			alert("第"+(i+1)+"项数量请输入正整数");
			return false;
		}else{
			renum += document.getElementsByName("num"+i)[0].value+'$';
		}
	}
	document.getElementById("Hidden1").value=re;
	document.getElementById("Hidden2").value=renum;
	//}
}
  </script>