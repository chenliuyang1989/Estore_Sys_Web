<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="roleList.title" /></title>
<meta name="heading" content="<fmt:message key="roleList.heading"/>" />
</head>
<body>
<s:form name="queryForm" action="roleListAction" method="post"
	cssStyle="margin: 0 0 0 0;">
	<div class="search"><h3><fmt:message key="query.condition" /></h3>
		<table>
			<tr>
				<td><fmt:message key="role.name" /></td>
				<td><s:textfield name="role.name"></s:textfield></td>
				<td><fmt:message key="role.menu" /></td>
					<td>
						<s:select list="allMenulList" listKey="id"
							listValue="name" name="role.menuId" headerKey="" headerValue="%{getText('label.please.choice')}"/>
					</td>
				<td></td>
				<td><s:submit align="center" key="button.search"
					cssClass="btn_search" method="queryPage" /></td>
			</tr>
		</table>
	</div>
	<div class="searchBottomLine1"></div>
	<div class="ListTitle">
		<table>
			<tr>
				<td><s:submit align="center" key="button.add"
					cssClass="btn_add" method="add" /></td>
				<td><input value="<s:text name="button.setview"/>" type="button"
					onclick="popColumnList(1);" class="btn_Set"></td>
			</tr>
		</table>
	</div>
	<%@ include file="/common/columnlist.jsp"%>


<display:table name="resultList" cellspacing="0" cellpadding="0" 
	requestURI="roleListAction.do" sort="external" partialList="true"
	size="totalRows" defaultsort="1" id="resultList" pagesize="${pageSize}"
	class="its" export="true">
	<c:forEach var="cl" items="${collist}">
		<c:if test="${cl.status=='A'}">
			<c:if test="${cl.property!='menuStr'}">
				<display:column property="${cl.property}" media="html excel pdf"
					titleKey="${cl.titleKey}" decorator="${cl.decorator}"
					format="${cl.format}" />
			</c:if>
			<c:if test="${cl.property=='menuStr'}">
				<display:column property="${cl.property}" media="html excel pdf"
					titleKey="${cl.titleKey}" decorator="${cl.decorator}"
					format="${cl.format}" style="width:60%"/>
			</c:if>
		</c:if>
	</c:forEach>
	<display:column  titleKey="query.list.title" media="html" autolink="false" style="width:60px">
		<a href="roleDataAction.do?id=${resultList.roleId}"><fmt:message
			key="button.edit" /></a>
		<a href="roleDataAction!delete.do?id=${resultList.roleId}"
			onclick="return(confirm('<fmt:message key="message.delete.confirm"/>?'))"><fmt:message
			key="button.delete" /></a>
	</display:column>
</display:table>
</s:form>
</body>