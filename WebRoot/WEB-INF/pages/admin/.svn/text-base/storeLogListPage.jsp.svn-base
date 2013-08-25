<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="storeLogList.title"/></title>
   	<meta name="heading" content="<fmt:message key="storeLogList.title"/>" />  
   	 <script language="javascript" type="text/javascript" src="<c:url value='/scripts/My97DatePicker/WdatePicker.js'/>"  ></script>
   	<script type="text/javascript">
	    function selectAllRecord() {
	        for(var i=0; i<document.getElementsByName("_chk").length; i++){
	        	document.getElementsByName("_chk")[i].checked = document.getElementById("_chkall").checked;
	        }
	    }
	</script>
	
</head>
<body>
	<s:form name="queryForm" action="storeLogListAction" method="post" cssStyle="margin: 0 0 0 0;">
		<input type="hidden" id="logType" name="logTypeCode" value="${logTypeCode }"/>
		<div class="search"><h3><fmt:message key="query.condition" /></h3>
			<table>				
				<tr>
					<td><fmt:message key="businessLog.operatorName" /></td>
					<td >
						<s:textfield name="businessLog.operatorName"/>						
					</td>
					<td><fmt:message key="businessLog.operatorContent" /></td>
					<td>
						<s:textfield name="businessLog.operatorContent"/>	
					</td>
					<td><fmt:message key="field.cityName" /></td>
					
					<td>
						<s:select list="allCityList" listKey="eleCode"
							listValue="eleName" name="businessLog.city.eleCode" />
					</td>
				</tr>
				<tr>
					<td><fmt:message key="businessLog.operatorTime" /></td>
					<td colspan="3">
						
						<input type="text" class="Wdate" name="businessLog.operatorTimeBegin" value="<fmt:formatDate value='${businessLog.operatorTimeBegin}' pattern='yyyy-MM-dd'/>" 
						onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d-%H-%m-%s'})"/>
						<fmt:message key="label.date.to"/>
						<input type="text" class="Wdate"  name="businessLog.operatorTimeEnd" value="<fmt:formatDate value='${businessLog.operatorTimeEnd}' pattern='yyyy-MM-dd'/>" 
						onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d-%H-%m-%s'})"/>
					</td>
					<td></td>
					<td ><s:submit align="center" key="button.search" cssClass="btn_search" method="queryPage" /></td>
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
		
	<display:table name="resultList" cellspacing="0" cellpadding="0"  decorator="checkboxDecorator" requestURI="storeLogListAction.do" partialList="true" size="totalRows" id="resultList" pagesize="${pageSize}" class="its" export="true" >
	    <c:forEach var="cl" items="${collist}">
			<c:if test="${cl.status=='A'}">
				<c:if test="${cl.property!='content'}">
					<display:column property="${cl.property}" media="${cl.media}"
					titleKey="${cl.titleKey}" sortable="${cl.sortable}" decorator="${cl.decorator}"
					 />
				</c:if>
				<c:if test="${cl.property=='content'}">
					<display:column property="${cl.property}" media="${cl.media}"
					titleKey="${cl.titleKey}" sortable="${cl.sortable}" decorator="${cl.decorator}"
					style="width:50%"
					 />
				</c:if>	
			</c:if>
		</c:forEach>			
	</display:table>	
	</s:form>
</body>