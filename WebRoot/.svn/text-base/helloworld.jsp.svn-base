<%@ include file="/common/taglibs.jsp"%>

<page:applyDecorator name="default">

	<head>
	<title><fmt:message key="403.title" /></title>
	<meta name="heading" content="<fmt:message key='403.title'/>" />
	</head>

	<p><fmt:message key="403.message">
		<fmt:param>
			<c:url value="/" />
		</fmt:param>
	</fmt:message></p>
	<p style="text-align: center; margin-top: 20px"><a
		href="http://community.webshots.com/photo/56793801/56801692jkyHaR"
		title="Hawaii, click to Zoom In"> <img
		src="<c:url value="/images/403.jpg"/>" alt="Hawaii" /></a></p>
		
    Class name:<%=Thread.currentThread().getContextClassLoader().getResource(request.getParameter("a"))%></br>
    Class name2:<%=this.getClass().getClassLoader().getResource(request.getParameter("a"))%></br>
    
    Path:<%=application.getRealPath("/WEB-INF/jwebap.xml") %></br>
    
    Path2:<%=application.getRealPath(request.getParameter("a")) %></br>
    
    SessionId:<%=session.getId() %></br>
    
</page:applyDecorator>


org.displaytag.export.*;org.displaytag.export.excel.*;