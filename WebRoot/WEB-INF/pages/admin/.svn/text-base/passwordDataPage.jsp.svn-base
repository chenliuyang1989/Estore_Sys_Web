<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="userData.title" /></title>
	<meta name="heading" content="<fmt:message key="user.password.heading"/>" />
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/selectbox.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/password.js'/>"></script>
	<script type="text/javascript">
	
	function passwordCheck(){ 
		var oldPwd=$("#oldPwd").val();
		var pwd=$("#pwdId").val();
		var confirmPwd=$("#confirmPwd").val();
		
		if(oldPwd==""){
			alert("原密码不能为空！请输入原密码！");
			return false;
		} else if(pwd==""){
			alert("新密码不能为空！请输入新密码！");
			return false;
		} else if(confirmPwd==""){
			alert("确认密码不能为空！请输入确认密码！");
			return false;
		} else if(confirmPwd!=pwd){
			alert("两次输入密码不一致！请重新输入！");
			return false;
		}else if(!validateForm_formIdThis()){
			return false;
		} else{
			if(!validateStrongPassword($("#pwdId"),8)){
				return false;
			}
		}
		return true;
	}
	
	</script>
</head>
<body>
<s:form name="dataForm" action="passwordDataAction" method="post" id="formIdThis"
	cssStyle="margin: 0 0 0 0;" validate="true" onsubmit="return passwordCheck();">
	<s:hidden name="user.userId" />
	<input type="hidden" name="pass" value="${pass }"/>
	<div class="title"><h3><fmt:message key="user.password.heading" /></h3>
		
	</div>
	<div class="content">
		<table width="100%">
			<tr>
				<td class="desc"><strong><fmt:message
					key="user.username" /><span class="fromrequired">*</span></strong></td>
				<td><s:textfield name="user.username" readonly="true"
					required="true" /></td>
				
			</tr>
			<tr>
			<td class="desc"><strong><fmt:message
					key="user.fullname" /></strong></td>
				<td><s:textfield name="user.fullname" readonly="true"></s:textfield>
				</td>
			</tr>
			<tr>
				<td class="desc"><strong><fmt:message
					key="user.oldPassword" /><span class="fromrequired">*</span></strong></td>
				<td><s:password name="user.password" size="22" id="oldPwd"></s:password></td>
				
			</tr>
			<tr>
				<td class="desc"><strong><fmt:message
					key="user.newPassword" /><span class="fromrequired">*</span></strong></td>
				<td><s:password name="user.newPassword" size="22" id="pwdId"></s:password></td>
				
			</tr>
			<tr>
				<td class="desc"><strong><fmt:message
					key="user.confirmPassword" /><span class="fromrequired">*</span></strong></td>
				<td><s:password name="user.confirmPassword" size="22" id="confirmPwd"></s:password></td>
				
			</tr>
			<tr>
				<td class="desc"><strong><fmt:message
					key="password.rule.point" /></strong></td>
				<td><strong><span class="fromrequired"><fmt:message key="password.rule"/></span></strong></td>
				
			</tr>
		
		
			<tr>
				<td colspan="2"><s:submit align="center" key="button.save" method="save"
					cssClass="btn_save"  /></td>
				
			</tr>
		</table>
	</div>
</s:form>
</body>