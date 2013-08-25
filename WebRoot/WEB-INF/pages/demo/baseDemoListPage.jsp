<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="baseDemoList.title"/></title>
   	<meta name="heading" content="<fmt:message key="baseDemoList.title"/>" />    
</head>
<body>
	<s:form name="queryForm" action="baseDemoListAction" method="post" cssStyle="margin: 0 0 0 0;">
		<div class="search"><h3><fmt:message key="query.condition" /></h3>
			<table>
				<tr>
					<td><fmt:message key="baseDemo.billNum" /></td>
					<td><s:textfield name="baseDemo.billNum"></s:textfield></td>
					<td></td>
					<td><s:submit align="center" key="button.search" cssClass="btn_search" method="queryPage" /></td>
				</tr>
			</table>
		</div>	
		<div class="searchBottomLine1"></div>
		<div class="ListTitle">
			<table>
				<tr>
					<td><s:submit align="center" key="button.add" method="add"
						cssClass="btn_add" /></td>
					<td></td>
				</tr>
			</table>
		</div>
	</s:form>
	<display:table name="resultList" cellspacing="0" cellpadding="0" requestURI="baseDemoListAction.do" partialList="true" size="totalRows" id="resultList" pagesize="${pageSize}" class="its" export="true">
	    <display:column property="billNum" titleKey="baseDemo.billNum" sortable="true" href="baseDemoDataAction.do" paramId="baseDemo.id" paramProperty="id" />
	    <display:column property="billName" titleKey="baseDemo.billName" />
	    <display:column property="billStatus.eleName" titleKey="baseDemo.billStatus" />
	    <display:column property="tranTime" titleKey="baseDemo.tranTime" />
	    <display:column titleKey="querry.list.title" media="html" autolink="false">
		<a href="baseDemoDataAction.do?baseDemo.id=${resultList.id}" ><fmt:message key="querry.list.operation.edit"/></a>   
	    <a href="baseDemoDataAction!delete.do?baseDemo.id=${resultList.id}" onclick="return(confirm('<fmt:message key="message.delete.confirm"/>?'))" ><fmt:message key="querry.list.operation.delete"/></a>
		</display:column>
	</display:table>
</body>