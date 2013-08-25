<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<title><fmt:message key="LoggingList.title" /></title>
<meta name="heading" content="<fmt:message key="LoggingList.heading"/>" />
<script language="javascript" type="text/javascript" src="<c:url value='/scripts/My97DatePicker/WdatePicker.js'/>"  ></script>
</head>
<body>
<s:form name="queryForm" action="businessLogListAction" method="post"
	cssStyle="margin: 0 0 0 0;">
	<div class="search"><h3><fmt:message key="query.condition" /></h3>
		<table>
			<tr>
				<td><fmt:message key="LoggingLog.operatorName" /></td>
				<td><s:textfield name="businessLog.operatorName"/></td>
				<td><fmt:message key="businessLog.loginIp" /></td>
				<td><s:textfield name="businessLog.loginIp"/></td>
				<td><fmt:message key="field.cityName" /></td>
					
					<td>
						<s:select list="allCityList" listKey="eleCode"
							listValue="eleName" name="businessLog.city.eleCode" />
					</td>
			</tr>
			<tr>
				<td><fmt:message key="LoggingLog.operatorTime" /></td>
					<td colspan="5">
						
						<input type="text" class="Wdate"  name="businessLog.operatorTimeBegin" value="<fmt:formatDate value='${businessLog.operatorTimeBegin}' pattern='yyyy-MM-dd'/>" 
						onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d-%H-%m-%s'})"/>
						<fmt:message key="label.date.to"/>
						<input type="text" class="Wdate"  name="businessLog.operatorTimeEnd" value="<fmt:formatDate value='${businessLog.operatorTimeEnd}' pattern='yyyy-MM-dd'/>" 
						onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d-%H-%m-%s'})"/>
					</td>
					
				<td><s:submit align="center" key="button.search"
					method="queryPage" cssClass="btn_search" /></td>				
			</tr>
		</table>
	</div>
	<div class="searchBottomLine1"></div>
	<div class="ListTitle">
		<table>
			<tr>
				<td><input value="<s:text name="button.setview"/>" type="button"
					onclick="popColumnList(1);" class="btn_Set"></td>
				<td></td>
			</tr>
		</table>
	</div>
	<%@ include file="/common/columnlist.jsp"%>


<display:table name="resultList" cellspacing="0" cellpadding="0"
	requestURI="businessLogListAction.do" sort="external"
	partialList="true" size="totalRows" defaultsort="1" id="resultList"
	pagesize="${pageSize}" class="its" export="true">
	<c:forEach var="cl" items="${collist}">
		<c:if test="${cl.status=='A'}">
			<display:column property="${cl.property}" media="${cl.media}"
				titleKey="${cl.titleKey}" decorator="${cl.decorator}" sortable="${cl.sortable}"
				format="${cl.format}" />
		</c:if>
	</c:forEach>
</display:table>
</s:form>
</body>