<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="hrCompanyist.title"/></title>
   	<meta name="heading" content="<fmt:message key="hrCompanyist.title"/>" />  
   	 <script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
   	<script type="text/javascript">
   		$(function(){
   			$("#orgPropertiesId").val("${hrCompany.orgProperties}");
   			$("#orgTypeId").val("${hrCompany.orgType.id}");
   		});
   		
	    function selectAllRecord() {
	        for(var i=0; i<document.getElementsByName("_chk").length; i++){
	        	document.getElementsByName("_chk")[i].checked = document.getElementById("_chkall").checked;
	        }
	    }
	    function confirmDel(){
	    	return confirm('<fmt:message key='message.delete.confirm'/>?');
	     }
	</script>
</head>
<body>
	<s:form name="queryForm" action="hrCompanyListAction" method="post" cssStyle="margin: 0 0 0 0;">
		<div class="search"><h3><fmt:message key="query.condition" /></h3>
			<table>
			
				<tr>
					<td><fmt:message key="company.compCode" /></td>
					<td>
						<input type="text" name="hrCompany.compCode" value="${hrCompany.compCode }"/>
					</td>
					<td><fmt:message key="company.companyname" /></td>
					<td>
						<input type="text" name="hrCompany.compName" value="${hrCompany.compName }" />
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><fmt:message key="company.orgProperties" /></td>
					<td>
						<select id="orgPropertiesId" name="hrCompany.orgProperties">
							<option value=""><fmt:message key="label.please.choice" /></option>
							<option value="1"><fmt:message key="company.orgProperties.inner" /></option>
							<option value="2"><fmt:message key="company.orgProperties.outer" /></option>
						</select>
					</td>
					<td><fmt:message key="company.orgType.eleName" /></td>
					<td><s:select list="allOrgTypeList" listKey="id"
							listValue="eleName" name="hrCompany.orgType.id" headerKey=""
							headerValue="%{getText('label.please.choice')}" />
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="desc"><fmt:message key="company.orgCategory" /></td>
					<td colspan="4">
						<input type="checkbox"  name="hrCompany.isWareHouse" value="1" <s:if test='%{hrCompany.isWareHouse=="1"}'>checked </s:if>/><fmt:message key="company.isWareHouse" />
						<input type="checkbox" name="hrCompany.isPurchase" value="1" <s:if test='%{hrCompany.isPurchase=="1"}'>checked</s:if>/><fmt:message key="company.isPurchase" />
						<input type="checkbox" name="hrCompany.isSales" value="1" <s:if test='%{ hrCompany.isSales=="1"}'>checked</s:if> /><fmt:message key="company.isSales" />
						<input type="checkbox" name="hrCompany.isLogistics" value="1" <s:if test='%{hrCompany.isLogistics=="1"}'>checked</s:if>/><fmt:message key="company.isLogistics" />
					</td>
					
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
				<td><s:submit  align="center" key="button.delete" action="hrCompanyDataAction" method="deleteBatch" cssClass="btn_del" onClick="return confirmDel();" />
				</td>
					<td><input value="<s:text name="button.setview"/>" type="button"
						onclick="popColumnList(1);" class="btn_Set"></td>
					<td></td>
				</tr>
			</table>
		</div>
		<%@ include file="/common/columnlist.jsp"%>
	
	<display:table name="resultList" cellspacing="0" cellpadding="0"  decorator="checkboxDecorator" requestURI="hrCompanyListAction.do" partialList="true" size="totalRows" id="resultList" pagesize="${pageSize}" class="its" export="true">
	   	<display:column property="checkbox" media="html" title="<input type='checkbox' name='_chkall' id='_chkall' onclick='selectAllRecord();' />"/>    
	    <c:forEach var="cl" items="${collist}">
			<c:if test="${cl.status=='A'}">
				<c:if test="${cl.property!='orgCategory'}">
					<display:column property="${cl.property}" media="${cl.media}"
					titleKey="${cl.titleKey}" sortable="${cl.sortable}" decorator="${cl.decorator}"
					 />
				</c:if>
				<c:if test="${cl.property=='orgCategory'}">
					<display:column property="${cl.property}" media="${cl.media}"
					titleKey="${cl.titleKey}" sortable="${cl.sortable}" decorator="com.gmcc.decorator.OrgCategoryWrapper"
					 />
				</c:if>
			</c:if>
		</c:forEach>			
	   <display:column titleKey="querry.list.title" media="html" autolink="false">
			<a href="hrCompanyDataAction.do?hrCompany.id=${resultList.id}" ><fmt:message key="querry.list.operation.edit"/></a>   
		    <a href="hrCompanyDataAction!delete.do?hrCompany.id=${resultList.id}" onClick="return(confirm('<fmt:message key="message.delete.confirm"/>?'))" ><fmt:message key="querry.list.operation.delete"/></a>	
		</display:column>
	</display:table>	
	</s:form>
</body>