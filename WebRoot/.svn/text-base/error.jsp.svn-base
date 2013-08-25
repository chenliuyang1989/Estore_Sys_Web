<%@ page language="java" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title><fmt:message key="errorPage.title" /></title>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value='/styles/${appConfig["csstheme"]}/theme.css'/>" />
<script language="javascript">
function showErrorDetail(){
	var content = document.getElementById("exceptions");
	if(content.style.display == "none"){
		content.style.display = "";
		parent.parent.document.all("mainiframe").style.height=document.body.scrollHeight+170;
	}else{
		content.style.display = "none";
	}
}
</script>
</head>

<body id="error">
<div class="error" style="width: 100%;"><img
	src="<c:url value='/images/iconWarning.gif'/>" /> <%String code="0010";
	    if(null!=request.getAttribute("exceptionCode")){
	    	code=(String)request.getAttribute("exceptionCode");
	    }
	    %> <%=code+",&nbsp;&nbsp;"%><fmt:message>errorPage.messages</fmt:message>,
	<a onclick="javascript:showErrorDetail();" href="#"><fmt:message
		key="errorPage.view.exception"></fmt:message></a> <a
		href="javascript:history.go(-1);"><fmt:message>errorPage.back</fmt:message></a>
	<div id='exceptions'
		style="display: none; OVERFLOW-y: no; OVERFLOW-x: auto; width: 100%;">
		<% if (exception != null) { %> <pre>
		<% exception.printStackTrace(new java.io.PrintWriter(out)); %>
		</pre> <% } else if ((Exception)request.getAttribute("javax.servlet.error.exception") != null) { %>
		<pre>
		<% ((Exception)request.getAttribute("javax.servlet.error.exception")).printStackTrace(new java.io.PrintWriter(out)); %>
				    </pre> <% }%>
	</div>
</div>
</body>
</html>
