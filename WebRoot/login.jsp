<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
 <title><fmt:message key="login.title"/></title>
 <meta name="heading" content="<fmt:message key='login.heading'/>"/>
 <meta name="menu" content="Login"/>
 <%@ include file="/common/meta.jsp" %>
 <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/${appConfig["csstheme"]}/layout-1col.css'/>" />
 <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/${appConfig["csstheme"]}/theme.css'/>" />
 <link rel="stylesheet" type="text/css" media="print" href="<c:url value='/styles/${appConfig["csstheme"]}/print.css'/>" />
 <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/loginNew.css'/>" />
 <script type="text/javascript" src="<c:url value='/scripts/login.js'/>"></script>	
 <link rel="stylesheet" type="text/css" href="<c:url value='/scripts/jquery/dialog/base/jquery.ui.all.css'/>">
   <script type="text/javascript" src="<c:url value='/scripts/jquery/jquery-1.4.2.min.js'/>"></script>
   <script type="text/javascript" src="<c:url value='/scripts/jquery/dialog/jquery-ui-1.8.2.custom.min.js'/>"></script>
 <script>
 $(function(){
	 if("${phoneCheck}"=="true"){
	 	openDiv();
	 	$("#verificationCode").focus();
	 }
	 $("[name=verificationCode]").eq(0).val("");
	 if($("#parDiv").is(":visible")){
		 $(this).bind("keypress.ui-dialog", function(event) { 
			 if (event.keyCode == $.ui.keyCode.ENTER) { 
			  $(".ui-dialog-buttonpane button").last().click();
			  return false;
			 } 
			});
	 }
	 
 });
 function openDiv(){
		$("#parDiv").dialog({
			autoOpen: true,
			modal: true,
			width:300,
			height:170,
			beforeclose: function(event, ui) { window.location.href="${ctx}/logout.jsp?defalutUser=${userName}"; },
			buttons:{
				"<fmt:message key='button.cancel'/>":function(){cancelLogin();},
				"<fmt:message key='button.confirm' />":function(){intoSys();}
			}
		});
		//$("#parDiv").dialog('open');
	}
	 function intoSys(){
		 if($("#verificationCode").val()==""){
			 $("#noPhoneCodeTdId").show();
			 $("#codeErrorTRID").hide();
			 $("#verificationCode").focus();
		//	 alert("请输入验证码");
			 return false;
		 }
		 var f=document.createElement("form");
		 f.action="index.do";
		 f.method="post";
		 f.innerHTML="<input type='hidden' name='verificationCode' value='"+$("#verificationCode").val()+"'/>"+
		 				"<input type='hidden' name='loginSuccess' value='true'/>"+
		 				"<input type='hidden' name='defalutUser' value='${userName }'/>";
		 document.body.appendChild(f);
		 f.submit();
		 //window.location.href="?loginSuccess=true&verificationCode="+$("#verificationCode").val();
	}
	 function cancelLogin(){
		 $('#parDiv').dialog('close');
		// window.location.href="${ctx}/logout.jsp";
	 }
	function setDefaultValue(){
		$("#defalutUserId").val($("#j_username").val());
		return true;
	}
	function sendMsg(){
		$.ajax({
		    type: "post", 
		    async: false,
		    url: "${ctx}/system/index!sendMsg.do", 
		    success: function(data){ 
	    	   	return;
	    	}
	    	});
		$("#verificationCode").val("");
		$("#verificationCode").focus();
	}
	function loginTo(){
		if($("#j_username").val()==""){
			//alert("请填写用户名");
			hideLi();
			$("#noUserId").show();
			$("#noPwdId").hide();
			return false;
		}else if($("#j_password").val()==""){
			//alert("请填写密码");
			hideLi();
			$("#noUserId").hide();
			$("#noPwdId").show();
			return false;
		}
		$("#loginForm")[0].action="${ctx}/j_security_check?spring-security-redirect=/system/index.do?defalutUser="+$("#j_username").val();
		$("#loginForm")[0].submit();
	}
	function hideLi(){
		$("#phoneCheckErrorId").hide();
		$("#pwdErrorNumId").hide();
		$("#lockedErrorId").hide();
		$("#userDisEnErrorId").hide();
		$("#forbiddenErrorId").hide();
		$("#kickOffErrorId").hide();
		$("#upAuthErrorId").hide();
		
	}
  </script>
</head>
<body>
    <div  class="divLogin">
    <div  class="loginArea" >
    		<br /><br /><%@ include file="/common/messages.jsp" %>
			<form name="loginForm" method="post" id="loginForm" action="" >
			<input type="hidden" id="defalutUserId" name="defalutUser" value="admin"/>
			<input type="hidden" id="passEasy" value="false"/>
			<ul>
			<li class="error" id="noUserId" style="display:none">
					 <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			       	 <fmt:message key="errors.noUser"/>
			</li>
			<li class="error" id="noPwdId" style="display:none">
					 <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			       	<fmt:message key="errors.noPwd"/>
			</li>
			<c:if test="${param.phoneCheck eq 'false'}">
				<li class="error" id="phoneCheckErrorId">
					 <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			       	 <fmt:message key="errors.user.nophone"/>
			    </li>
			</c:if>
			<c:if test="${param.error eq 'true'}">
			<%String username=(String)session.getAttribute("SPRING_SECURITY_LAST_USERNAME");
				//out.println(username);
				String pwdErrorNum=(String)session.getAttribute("pwdErrorNum_"+username);
				//out.println("**:"+pwdErrorNum);
				if(pwdErrorNum!=null){
					String[] errorNum=pwdErrorNum.split(",");
					if(errorNum[1].equals("0")){
						request.setAttribute("pwdErrorNum","密码错误"+errorNum[0]+"次,账号已被锁定");
					}else{
						request.setAttribute("pwdErrorNum","密码错误"+errorNum[0]+"次,今天还剩余"+errorNum[1]+"次");
					}
				}
				//out.println("**:"+pwdErrorNum);
			%>
			<c:if test="${pwdErrorNum!=null && pwdErrorNum!=''}">
				<li class="error" id="pwdErrorNumId">
					 <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			       	 ${pwdErrorNum }
			       </li>
			</c:if>
			<c:if test="${fn:contains(SPRING_SECURITY_LAST_EXCEPTION, 'User account is locked')}">
				<li class="error" id="lockedErrorId">
					 <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			       	 <fmt:message key="errors.account.locked"/>
			       </li>
			</c:if>
			<c:if test="${!fn:contains(SPRING_SECURITY_LAST_EXCEPTION, 'User account is locked') 
					&& !fn:contains(SPRING_SECURITY_LAST_EXCEPTION, 'User account is sa user')
					&& (pwdErrorNum==null || pwdErrorNum=='') }">
				<li class="error" id="userDisEnErrorId">
			        <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			        <fmt:message key="errors.password.mismatch"/>
			        <%--${sessionScope.SPRING_SECURITY_LAST_EXCEPTION_KEY.message}--%>
			    </li>
			</c:if>
			<c:if test="${fn:contains(SPRING_SECURITY_LAST_EXCEPTION, 'User account is sa user') }">
				<li class="error" id="userDisEnErrorId">
			        <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			       <fmt:message key="errors.user.sa"/>
			        <%--${sessionScope.SPRING_SECURITY_LAST_EXCEPTION_KEY.message}--%>
			    </li>
			</c:if>
			</c:if>
			<c:if test="${param.error eq 'FORBIDDEN'}">
			    <li class="error" id="forbiddenErrorId">
			        <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			        <fmt:message key="errors.login.forbidden"/>
			    </li>
			</c:if>
			<c:if test="${param.error eq 'KICK_OFF'}">
			    <li class="error" id="kickOffErrorId">
			        <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			        <fmt:message key="errors.login.kickOff"/>
			        
			    </li>
			</c:if>
			<c:if test="${param.error eq 'UP_AUTH'}">
			    <li class="error" id="upAuthErrorId">
			        <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
			        <fmt:message key="errors.login.upAuth"/>
			        
			    </li>
			</c:if>
			</ul>
		 
	 		<ul>
			<li id="li_username"><fmt:message key="login.username"/><span class="req">*</span>:</li>
			<li><input type="text" tabindex="1" value="${userName }" id="j_username" name="j_username" class="text"></li>
			<li id="li_password"><br/><fmt:message key="login.password"/><span class="req">*</span>:</li>
			<li><input type="password" tabindex="2" id="j_password" name="j_password" class="text" value="${userPwd }"></li>
			<li><input type="submit" onclick="return loginTo();" tabindex="4" value="<fmt:message key='login.submit'/>" name="login" class="button"></li>
			</ul>	 
		 	
		 	<div id="parDiv" title="<fmt:message key='label.phone.verification'/>"  
		 		style="padding:25px 10px 10px 10px;display:none;width:100%;text-align:left;overflow:hidden;vertical-align:middle;" >
				<table border="0" class="dialog_login">
				
				<tr >
					<td nowrap="nowrap" valign="middle" calss="td1">
						<span ><fmt:message key="label.phone.verification.code"/></span>
						<input type="text" id="verificationCode"  value="" style="height:20px;width:100px;"/>
						<input type="button"  value="<fmt:message key='label.phone.sendmsg'/>" onclick="sendMsg()"/>
					</td>
				</tr>
				
				<s:if test="#request.codeCheck=='false'">
					<tr id="codeErrorTRID">
						<td height="30px" valign="middle">
							<font color="red"><strong><fmt:message key="errors.phone.verification"/></strong></font>
						</td>
					</tr>
				</s:if>
				<tr id="noPhoneCodeTdId" style="display:none">
						<td height="30px" valign="middle">
							<font color="red"><strong><fmt:message key='errors.phone.noPhoneCode'/></strong></font>
						</td>
				</tr>
				
				</table>
			</div>
			</form>
	
	</div>
	
    <div class="co" >
    <span class="conter">
        <font color="white">
        &copy; <fmt:message key="copyright.year"/>&nbsp;
        <a href="<fmt:message key="company.url"/>" style="color:white" target="_blank"><fmt:message key="company.name"/></a>
        </font>
    </span>
	</div>
	
	
	</div>
<script >
if(window.parent!=window){
	window.parent.location.href=window.location.href;
}
</script>
</body>
</html>