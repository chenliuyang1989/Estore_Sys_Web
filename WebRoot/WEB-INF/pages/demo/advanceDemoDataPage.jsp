<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="advanceDemoData.title"/></title>
   	<meta name="heading" content="<fmt:message key="advanceDemoData.title"/>" /> 

</head>
	<script type="text/javascript">
	    function selectAllRecord() {
	        for(var i=0; i<document.getElementsByName("_chk").length; i++){
	        	document.getElementsByName("_chk")[i].checked = document.getElementById("_chkall").checked;
	        }
	    }
	</script>
<body>
	<s:form name="dataForm" action="advanceDemoDataAction" method="post"  cssStyle="margin: 0 0 0 0;" validate="true">
		<s:token/>
		<s:hidden name="advanceDemo.id" ></s:hidden>		
		<div class="title">
	    	<h3><fmt:message key="advanceDemoDataHead.title"/></h3>
	    	<table>
			<tr>
			<c:if test="${!view}">			
			<td>
				<s:submit  align="center" key="button.save" method="save" cssClass="btn_save" />
			</td>
			</c:if>	
			<td>
				<s:submit  align="center" key="button.back" onclick="window.location.href='advanceDemoListAction.do';return false;"  cssClass="btn_back" method="cancel"  />
			</td>
			</tr>
			</table>
		</div>
		<div class="content">
			<table cellspacing="1" cellpadding="0" border="0">
				<tr>
					<td class="desc"><strong><fmt:message key="advanceDemo.billNum"/></strong></td>
					<td><s:textfield name="advanceDemo.billNum" readonly="true" /></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="advanceDemo.billName"/></strong><span class="fromrequired" >*</span></td>
					<td><s:textfield name="advanceDemo.billName" /></td>					
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="advanceDemo.billStatus"/></strong><span class="fromrequired" >*</span></td>
					<td>
					<s:select list="billStatusSet" listKey="id" listValue="eleName" name="advanceDemo.billStatus.id" />
					</td>					
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="advanceDemo.tranTime"/></strong><span class="fromrequired" >*</span></td>
					<td>						
					</td>
				</tr>
			</table>
		</div>
		<div class="content">
			<display:table id="detailList" name="detailList" decorator="checkboxDecorator" cellspacing="0" cellpadding="0" requestURI="advanceDemoDataAction.do" class="its">
			    <display:column style="width: 5%" property="checkbox" title="<input type='checkbox' name='_chkall' id='_chkall' onclick='selectAllRecord();' />" />		    	
			    <display:column titleKey="advanceDemoDetail.content" >			    	
			    	<input type="hidden" name="detailList[${detailList.index}].id" value="${detailList.id}" />
			    	<input type="text" name="detailList[${detailList.index}].content" size="15" value="${detailList.content}" />
			    </display:column>			    		    
			</display:table>
		</div>
	</s:form>	
</body>