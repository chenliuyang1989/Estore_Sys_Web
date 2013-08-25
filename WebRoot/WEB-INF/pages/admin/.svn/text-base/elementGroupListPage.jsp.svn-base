<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="elementList.title" /></title>
<c:if test="${ttype=='0'}">
	<meta name="heading" content="<fmt:message key="elementList.heading"/>" />
</c:if>
<c:if test="${ttype!='0'}">
	<meta name="heading"
		content="<fmt:message key="elementList.heading1"/>" />
</c:if>
<script type="text/javascript"
	src="<c:url value='/scripts/selectbox.js'/>"></script>
</head>
<body>
<s:form name="queryForm" action="elementGroupListAction" method="post">
	<s:hidden name="ttype" id="ttype"></s:hidden>
	<div class="search"><h3><fmt:message
		key="query.condition" /></h3>
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td><fmt:message key="element.groupName" /></td>
			<td><s:textfield name="eleGroup.eleGroupName" ></s:textfield></td>
			<td><fmt:message key="element.remarks" /></td>
			<td><s:textfield name="eleGroup.eleGroupRemark"></s:textfield></td>
			<td><s:submit align="center" key="button.search"
				method="queryPage" cssClass="btn_search" /></td>
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


<display:table name="resultList" cellspacing="0" cellpadding="0"
	requestURI="elementGroupListAction.do" sort="external"
	partialList="true" size="totalRows" defaultsort="1" id="resultList"
	pagesize="${pageSize}" class="its" export="true">
	<display:column property="eleGroupName" titleKey="element.groupName" />
	<display:column property="eleGroupRemark" titleKey="element.remarks"
		sortable="true" />
		<display:column property="eleStr" titleKey="elementgroup.element" style="width:60%"/>
	<display:column titleKey="query.list.title" autolink="false" media="html">
		<a href="elementGroupDataAction.do?id=${resultList.id}"><fmt:message
			key="button.edit" /></a>
		<a href="elementGroupListAction!delete.do?id=${resultList.id}"
			onclick="return(confirm('<fmt:message key="message.delete.confirm"/>?'))"><fmt:message
			key="button.delete" /></a>
	</display:column>
</display:table>
</s:form>

</body>