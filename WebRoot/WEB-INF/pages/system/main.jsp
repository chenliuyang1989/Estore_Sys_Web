<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/common/taglibs.jsp"%>
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
<div id="content">
<div id="tt" region="center" style="overflow:hidden;">
	</div>
<p></p>
</div>

</body>
</html>
