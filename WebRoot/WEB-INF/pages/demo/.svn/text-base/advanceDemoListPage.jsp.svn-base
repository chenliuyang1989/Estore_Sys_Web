<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="advanceDemoList.title"/></title>
   	<meta name="heading" content="<fmt:message key="advanceDemoList.title"/>" />
   	<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/scripts/jquery/jquery.autocomplete.css'/>" />
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.bgiframe.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.ajaxQueue.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/thickbox-compressed.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.autocomplete.js'/>"></script>  
	<script type="text/javascript">
		$(document).ready(function() {
	     		ajaxURL="${ctx}/findElement!findElementByGroup.do?q=billStatus";
	     		$("#billStatusName").autocomplete(ajaxURL,{
	     			multiple: false,
	    			dataType: "json",
	    			minChars: 1,    			
	    			scroll: true,
	    			autoFill:true,
	    			mustMatch:0,
	    			matchCase:true,
	    			cacheLength:1,
	    			multipleSeparator: " ",
	    			matchContains: "word",
	    			parse: function(data) {
	    				return $.map(data, function(row) {
	    					return {
	    						data: row,
	    						value: row.name,
	    						result: row.name 
	    					}
	    				});
	    			},
	    			formatItem: function(item) {
	    				return item.name;
	    			}
	    		}).result(function(e, item) {
	    			if(typeof(item)!='undefined'){
	    				var billStatusId = document.getElementById("billStatusId");    				
	    				billStatusId.value=item.id; 
	    				var billStatusName = document.getElementById("billStatusName");    				
	    				billStatusName.value=item.name;
	    			}
	    		});
	    }); 
	</script>
	<script type="text/javascript">
	    function selectAllRecord() {
	        for(var i=0; i<document.getElementsByName("_chk").length; i++){
	        	document.getElementsByName("_chk")[i].checked = document.getElementById("_chkall").checked;
	        }
	    }
	</script>
</head>
<body>
	<s:form name="queryForm" action="advanceDemoListAction" method="post" cssStyle="margin: 0 0 0 0;">
		<div class="search"><h3><fmt:message key="query.condition" /></h3>
			<table>
				<tr>
					<td><fmt:message key="advanceDemo.billStatus" /><font color="red"></font></td>
					<td>
					<s:hidden name="advanceDemo.billStatus.id" id="billStatusId"/>
					<s:textfield name="advanceDemo.billStatus.eleName" id="billStatusName" cssClass="blueBorder"/>					
					</td>
					<td></td>
					<td><s:submit align="center" key="button.search" cssClass="btn_search" method="queryPage" /></td>
					
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
		</s:form>
		<display:table name="resultList" cellspacing="0" cellpadding="0" decorator="checkboxDecorator" requestURI="advanceDemoListAction.do" partialList="true" size="totalRows" id="resultList" pagesize="${pageSize}" class="its" export="true">
		    <display:column property="checkbox" media="html" title="<input type='checkbox' name='_chkall' id='_chkall' onclick='selectAllRecord();' />"/>	    
		    <c:forEach var="cl" items="${collist}">
				<c:if test="${cl.status=='A'}">
				    <c:if test="${cl.href!=''}">
						<display:column property="${cl.property}" media="${cl.media}"
						titleKey="${cl.titleKey}" decorator="${cl.decorator}" group="${cl.group}" sortable="${cl.sortable}" format="${cl.format}" href="${cl.href}" paramId="${cl.paramId}" paramProperty="${cl.paramProperty}"
						/>
					</c:if>
					<c:if test="${cl.href==''}">
						<display:column property="${cl.property}" media="${cl.media}"
						titleKey="${cl.titleKey}" decorator="${cl.decorator}" group="${cl.group}" sortable="${cl.sortable}" format="${cl.format}" 
						/>
					</c:if>
				</c:if>
			</c:forEach>			
		    <display:column titleKey="querry.list.title" media="html" autolink="false">
			<a href="advanceDemoDataAction.do?advanceDemo.id=${resultList.id}" ><fmt:message key="querry.list.operation.edit"/></a>   
		    <a href="advanceDemoDataAction!delete.do?advanceDemo.id=${resultList.id}" onclick="return(confirm('<fmt:message key="message.delete.confirm"/>?'))" ><fmt:message key="querry.list.operation.delete"/></a>
			</display:column>
		</display:table>
</body>