<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.gmcc.sso.TokenUtils"%>
<%@page import="com.gmcc.util.SpringSecurityUtils" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%
	String isExternalUser = (String)request.getAttribute(TokenUtils.isExternalUser);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎进入电子商务云平台</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/easyui.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/styles/easyui2.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/styles/icon.css'/>">
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery-1.4.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.easyui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/frameWord.js'/>"></script>	
	<script>
		$(function(){
			//welcomeTab("/Estore_Wms_Web/taskmg/workspaceAct!findWorkspace.do","工作台",true);
			welcomeTab("/estoreWms/taskmg/workspaceAct!findWorkspace.do","工作台",true);

			if("${loginEd}"=="true"){
				var ret=validateStrongPassword("${passEasy}",8);
		    	if(!ret){
		    		alert("您的密码太简单,请及时修改密码！\n密码规则: 至少为八位，且必须包含大小写字母，数字，特殊符号(如~!@#$%^等);\n例如：Abc123@#");
		    		newTab("${ctx}/admin/passwordDataAction.do","密码修改",true);
		    	}
				//window.showModalDialog("modal.htm",obj,"dialogWidth=200px;dialogHeight=100px");
			}
		
		});
		function validateStrongPassword(value,length ){
		  	  var ret=true;
		  	  var upp_regex=/.*?[A-Z]+.*/;
		  	  var low_regex=/.*?[a-z]+.*/;
		  	  var num_regex=/.*?[0-9]+.*/;
		  	  var spe_regex=/.*?[\W]+.*/;
		  	  
		  	  if(value.length < length){
		  	    ret=false;
		  	  }
		  	  if(!upp_regex.exec(value)){
		  	    ret=false;
		  	  }
		  	  if(!low_regex.exec(value)){
		  	    ret=false;
		  	  }
		  	  if(!num_regex.exec(value)){
		  	    ret=false;
		  	  }
		  	  if(!spe_regex.exec(value)){
		  	    ret=false;
		  	  }
		  	  return ret;   
		  } 
		
		//window.onunload=function(){
		//	if($("#north_tab")[0].style.width<=0){
		//		window.location.href="${ctx}/logout.jsp?isExternalUser=${isExternalUser}";
		//	}
			//var n = window.event.screenX - window.screenLeft;
	       // var b = n > document.documentElement.scrollWidth-20;
	       // alert(n);
	       // alert(window.event.clientY);
	       // if(b && window.event.clientY<0){//关闭整个浏览器
	       // 	alert("关闭");
	       //	window.location.href="${ctx}/logout.jsp?isExternalUser=${isExternalUser}";
	       // }else if(window.event.altKey){//alt+f4
	       // 	alert("关闭");
	       // 	window.location.href="${ctx}/logout.jsp?isExternalUser=${isExternalUser}";
	       // }else if(n>0 && window.event.clientY<0){//关闭选项卡
	       // 	alert("关闭");
	       // 	window.location.href="${ctx}/logout.jsp?isExternalUser=${isExternalUser}";
	       // }else{
           // 	alert("刷新");
           // }
			//alert( '这就是你要做的事,关闭网页之后做的！ ');
			//window.location.href="${ctx}/logout.jsp";
		//} ;
		//window.onbeforeunload=function(){
			//var ThreeDays=3*24*60*60*1000;
			//var expDate = new Date();
			//expDate.setTime(expDate.getTime()-ThreeDays);
			//document.cookie = "ESTORE_TOKEN=; expires="+expDate.toGMTString();
			//document.cookie = "SPRING_SECURITY_REMEMBER_ME_COOKIE=; expires="+expDate.toGMTString();
			//alert("${ctx}");
			//window.location.href="/Estore_Sys_Web/logout.jsp?isExternalUser=true";
		//};
	</script>
	
</head>
<body class="easyui-layout">
	<div id="north_tab" region="north" style="height:81px;padding:0px;width:100%;" >
		<iframe id="northf" frameborder="0"  width="100%" height="81px" marginwidth="0" marginheight="0" scrolling="no" src ="<s:url action='header'/>" >
		</iframe>
	</div>
	<div id="tab_west" region="west" split="true" title="<%=SpringSecurityUtils.getCurrentUserName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href='${ctx}/logout.jsp?<%=TokenUtils.isExternalUser %>=<%=isExternalUser %>&defalutUser=<%=SpringSecurityUtils.getCurrentUserName() %>' title='安全退出' target='_parent' class='exit'><fmt:message key='button.exit'/> </a>"  style="width:200px;overflow:hidden;">
		<iframe id="westf" frameborder="0" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="auto"  
			allowtransparency="true" style="background-color :#fcfeff;" src ="<s:url action="menuDisplay"/>" >
		</iframe>
	</div>
	<div id="tab_center"  region="center"  style="width:auto;height:100%;overflow:auto;"  >
	</div>	
	<div id="footer" region="south" style="height:33px;padding:0px;" align="center">
		<iframe frameborder="0" width="100%" height="33px" marginwidth="0" marginheight="0" scrolling="no" src ="<s:url action="footer"/>" >
		</iframe>
	</div>
<div id="mm" class="easyui-menu" style="width:150px;">
<div id="mm-tabclose"><fmt:message key="tab.menu.tabclose"/></div>
<div id="mm-tabcloseall"><fmt:message key="tab.menu.tabcloseall"/></div>
<div id="mm-tabcloseother"><fmt:message key="tab.menu.tabcloseother"/></div>
<div class="menu-sep"></div>
<div id="mm-tabcloseright"><fmt:message key="tab.menu.tabcloseright"/></div>
<div id="mm-tabcloseleft"><fmt:message key="tab.menu.tabcloseleft"/></div>
</div>
<!-- 打印相关 -->
<iframe id="iframe_print" name="iframe_invoice" style="display:none;" src="" frameborder="0" scrolling="no" height="0px" width="0px"></iframe>
<iframe id="iframe_invoice" name="iframe_invoice" style="display:none;" src="" frameborder="0" scrolling="no" height="0px" width="0px"></iframe>
<iframe id="iframe_receipt" name="iframe_receipt" style="display:none;" src="" frameborder="0" scrolling="no" height="0px" width="0px"></iframe>
<iframe id="iframe_treaty" name="iframe_treaty" style="display:none;" src="" frameborder="0" scrolling="no" height="0px" width="0px"></iframe>
<iframe id="iframe_transport" name="iframe_transport" style="display:none;" src="" frameborder="0" scrolling="no" height="0px" width="0px"></iframe>
<input type="hidden" id="defalutUser" name="defalutUser" value="<%=SpringSecurityUtils.getCurrentUserName() %>"/>
</body>

</html>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new Date());
%>

<DIV id=eMeng style="border:1 solid #b0def9;width:260px;height:180px;position:absolute;top: 600;left: 1000">
	<div style="background-color: #cfe6f4;height: 25px"><span style="margin-left:5px;margin-top:5px; width: 230;background-color: #cfe6f4;font-size: 14px;color: #09306d"><b>系统通告</b></span><span style="cursor: pointer; background-color: #cfe6f4;font-size: 18px;color: #09306d"" onclick="hidiv();">×</span> </div>
	<div>
	<iframe name="noticeFrame" src="../admin/verNoticeAct!findScrollNotice.do?versionnotice.toflag=1&versionnotice.enabled=1&versionnotice.visibletime1=<%=today %>&versionnotice.deadline2=<%=today %>" width="100%" height="180" marginwidth="0" frameborder=0 SCROLLING="no"></iframe>
	</div>
</div>  
<script language="javascript">   

	function hidiv() {

		if(document.getElementById("eMeng").style.display=="none") { 
			document.getElementById("eMeng").style.display = 'block';
			} else {
				document.getElementById("eMeng").style.display = 'none';
			}
		
	}

  
   function    resizeDiv()   
   {   
   var    obj=document.getElementById("eMeng");   
   try{   
   divHeight    =    parseInt(obj.offsetHeight,10);   
   divWidth    =    parseInt(obj.offsetWidth,10);   
   docWidth    =    document.body.clientWidth;   
   docHeight    =    document.body.clientHeight;   
   obj.style.top    =    docHeight    -    divHeight    +    parseInt(document.body.scrollTop,10);   
   obj.style.left    =    docWidth    -    divWidth    +    parseInt(document.body.scrollLeft,10);   
   }   
   catch(e){}   
   }   
   window.onload    =    resizeDiv;    //页面加载时调用resizeDiv()函数
   window.onresize    =    resizeDiv;    //页面大小变化时调用resizeDiv()函数
   window.onscroll    =    resizeDiv;    //页面滚动条被拖动时调用resizeDiv()函数 
   
   </script>
