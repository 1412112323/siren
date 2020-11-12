if (!$) {
	var $ = function (tagId){
		return document.getElementById(tagId);
	}
}
function fAddClass(XEle, XClass)
{/* shawl.qiu code, void return */
  if(!XClass) throw new Error("XClass 不能为空!");
  if(XEle.className!="") 
  {
    var Re = new RegExp("\\b"+XClass+"\\b\\s*", "");
    XEle.className = XEle.className.replace(Re, "");
	var OldClassName = XEle.className.replace(/^\s+|\s+$/g,"") ;
	if (OldClassName == "" ) {
		 XEle.className = XClass;
	}
	else {
		XEle.className = OldClassName + " " + XClass;
	}
   
  }
  else XEle.className = XClass;
}/* end function fAddClass(XEle, XClass) */

function fRemoveClass(XEle, XClass)
{/* shawl.qiu code, void return */
  if(!XClass) throw new Error("XClass 不能为空!");
  var OldClassName = XEle.className.replace(/^\s+|\s+$/g,"") ;
  if(OldClassName!="") 
  {
	
    var Re = new RegExp("\\b"+XClass+"\\b\\s*", "");
    XEle.className = OldClassName.replace(Re, "");
  }
}/* function fRemoveClass(XEle, XClass) */

var SwitchPic = function(args) {
	this.bigpiccont = $(args.bigpic) ;
	
	this.switchnav = $(args.switchnav) ;
	this.selectstyle = args.selectstyle ;
	this.objname = args.objname ;
	this.curpage = 0 ;
	this.autotimeintval = 3000 ;
	var bigpics = this.bigpiccont.getElementsByTagName("div") ;
	this.totalcount = bigpics.length ;
	//this.bigpics = bigpics ;
	if (args.switchtitles) { 
		this.switchtitles = args.switchtitles ;
	}
	
	
	for (i=0;i<bigpics.length;i++) {
		bigpics[i].onmouseover = new Function(this.objname+".pauseSwitch();") ;
		bigpics[i].onmouseout = new Function(this.objname+".goonSwitch("+this.objname+");") ;
	}
	
	var switchnavs = this.switchnav.getElementsByTagName("li") ;
	for (i=0;i<switchnavs.length;i++) {
		switchnavs[i].onmouseover = new Function(this.objname+".goSwitch("+this.objname+","+i+");"+this.objname+".pauseSwitch();") ;
		switchnavs[i].onmouseout = new Function(this.objname+".goonSwitch("+this.objname+");") ;
	}
}
SwitchPic.prototype.goSwitch = function(obj,page) {
	if (page >= this.totalcount) { page = 0 ;}
	this.curpage = page ;
	
	var bigpics = this.bigpiccont.getElementsByTagName("div") ;
	for (i=0;i<bigpics.length;i++) {
		if (i == page) {bigpics[i].style.display = "block" ;}
		else {bigpics[i].style.display = "none" ;}
	}
	var switchnavs = this.switchnav.getElementsByTagName("li") ;
	for (i=0;i<switchnavs.length;i++) {
		//if (i == page) {Element.addClassName(switchnavs[i], this.selectstyle); }
		//else { Element.removeClassName(switchnavs[i],this.selectstyle); }
		if (i == page) {fAddClass(switchnavs[i], this.selectstyle); }
		else { fRemoveClass(switchnavs[i],this.selectstyle); }
	}
	
}
SwitchPic.prototype.autoSwitch = function(obj) {
	this.curpage ++ ;
	this.goSwitch(obj,this.curpage) ;
	this.autoSwitchTimer = setTimeout(obj.objname+".autoSwitch("+obj.objname+");", this.autotimeintval);
}
SwitchPic.prototype.pauseSwitch = function() {
	clearTimeout(this.autoSwitchTimer);
}
SwitchPic.prototype.goonSwitch = function(obj) {
	clearTimeout(this.autoSwitchTimer);
	this.autoSwitchTimer = setTimeout(obj.objname+".autoSwitch("+obj.objname+");", this.autotimeintval);
}