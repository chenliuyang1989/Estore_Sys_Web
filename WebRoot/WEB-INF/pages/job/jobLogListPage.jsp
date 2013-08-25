<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="jobLogList.title"/></title>
   	<meta name="heading" content="<fmt:message key="jobLogList.title"/>" />  
   	 <script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
   	<script type="text/javascript">
	    function selectAllRecord() {
	        for(var i=0; i<document.getElementsByName("_chk").length; i++){
	        	document.getElementsByName("_chk")[i].checked = document.getElementById("_chkall").checked;
	        }
	    }
	</script>
</head>
<body>
	<s:form name="queryForm" action="jobLogListAction" method="post" cssStyle="margin: 0 0 0 0;">
		<div class="search"><h3><fmt:message key="query.condition" /></h3>
			<table>
				<tr>
					<td><fmt:message key="jobLog.jobConfig.jobname" /></td>
					<td>
						<s:textfield name="jobLog.jobConfig.jobname"/>
					</td>
					<td></td>
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
		<display:table name="resultList" cellspacing="0" cellpadding="0"   requestURI="jobLogListAction.do" partialList="true" size="totalRows" id="resultList" pagesize="${pageSize}" class="its" export="true">
		    <c:forEach var="cl" items="${collist}">
				<c:if test="${cl.status=='A'}">
						<display:column property="${cl.property}" media="${cl.media}"
						titleKey="${cl.titleKey}" sortable="${cl.sortable}" decorator="${cl.decorator}"
						 />
				</c:if>
			</c:forEach>			
		</display:table>	
	</s:form>
</body>