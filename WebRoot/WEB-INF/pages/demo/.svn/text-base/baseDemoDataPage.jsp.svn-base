<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="baseDemoData.title"/></title>
   	<meta name="heading" content="<fmt:message key="baseDemoData.title"/>" /> 
   	<sx:head />
</head>
<body>
	<s:form name="dataForm" action="baseDemoDataAction" method="post"  cssStyle="margin: 0 0 0 0;" validate="true">
		<s:token/>
		<s:hidden name="baseDemo.id" ></s:hidden>		
		<s:hidden name="baseDemo.enabled" ></s:hidden>
		
	    <div class="title">
	    	<h3><fmt:message key="baseDemoData.title"/></h3>
	    	<table>
			<tr>			
			<td>
				<s:submit  align="center" key="button.save" method="save" cssClass="btn_save" />
			</td>
			<td>
				<s:submit  align="center" key="button.back" onclick="window.location.href='baseDemoListAction.do';return false;"  cssClass="btn_back" method="cancel"  />
			</td>
			</tr>
			</table>
		</div>
		<div class="content">
			<table cellspacing="1" cellpadding="0" border="0">
				<tr>
					<td class="desc"><strong><fmt:message key="baseDemo.billNum"/></strong></td>
					<td><s:textfield name="baseDemo.billNum" readonly="true" cssClass="grayBg"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="baseDemo.billName"/></strong><span class="fromrequired" >*</span></td>
					<td><s:textfield name="baseDemo.billName" /></td>					
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="baseDemo.billStatus"/></strong><span class="fromrequired" >*</span></td>
					<td>
					<s:select list="billStatusSet" listKey="id" listValue="eleName" name="baseDemo.billStatus.id" />
					</td>					
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="baseDemo.tranTime"/></strong><span class="fromrequired" >*</span></td>
					<td><sx:datetimepicker name="baseDemo.tranTime" displayFormat="yyyy-MM-dd" formatLength="10"/>						
					</td>
				</tr>
			</table>
		</div>
		
	</s:form>	
</body>