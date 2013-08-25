<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.gmcc.sso.TokenUtils"%>
<%@page import="com.gmcc.util.SpringSecurityUtils" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<%@ include file="/common/meta.jsp"%>
<title><fmt:message key="webapp.name" /></title>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value='/styles/${appConfig["csstheme"]}/theme.css'/>" />
<link rel="stylesheet" type="text/css" media="print"
	href="<c:url value='/styles/${appConfig["csstheme"]}/print.css'/>" />
</head>
<body>
<div id="header">
	<a href="${ctx}/logout.jsp?defalutUser=<%=SpringSecurityUtils.getCurrentUserName() %>" title="<fmt:message key='button.exit'/>" target="_parent" class="exit"> </a>
	<a href="javascript:void(0)" onclick="parent.hidiv();" title="<fmt:message key='button.notice'/>" class="help"></a>
	<a href="javascript:void(0)" title="<fmt:message key='button.passwordChange'/>" onclick="parent.addNewTabArr('${ctx}/admin/passwordDataAction.do',null,null,'<fmt:message key='password.title'/>','','true')" class="changePasswd"></a>
	<div class="left">
	<div class="logo"></div>
		<ul>
		<s:iterator value="appList">
			<s:property value="rootMenu" escape="false"/>
		</s:iterator>
		</ul>
	</div>
	<div class="right"></div>
</div>
<div class="hr1"></div>
</body>
</html>