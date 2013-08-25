<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<%@ include file="/common/meta.jsp"%>
<title><decorator:title /> | <fmt:message key="webapp.name" /></title>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value='/styles/${appConfig["csstheme"]}/theme.css'/>" />
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value='/styles/style.css'/>" />
<link rel="stylesheet" type="text/css" media="print"
	href="<c:url value='/styles/${appConfig["csstheme"]}/print.css'/>" />
<link rel="stylesheet" type="text/css" media="all" 
	href="<c:url value='/styles/jquerytreeview/jquery.treeview.css'/>" />
<c:set var="noHeadJS" scope="request">
	<decorator:getProperty property="meta.noHeadJS" />
</c:set>
<decorator:head />
</head>
<body
	<decorator:getProperty property="body.id" writeEntireProperty="true"/>
	<decorator:getProperty property="body.class" writeEntireProperty="true"/>
>
<div id="content" class="clearfix" align="left">
	<%@ include	file="/common/messages.jsp"%>
<decorator:body />
</div>
</body>
</html>
