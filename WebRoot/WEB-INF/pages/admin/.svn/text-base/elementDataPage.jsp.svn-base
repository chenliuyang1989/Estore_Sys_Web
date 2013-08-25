<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head />
<s:url id="d_url" action="elementListAction">
	<s:param name="ajax" value="true"></s:param>
</s:url>
<fieldset><legend> <fmt:message key="detail_Info"></fmt:message>
</legend><s:form name="detailForm" action="elementDataAction" method="post" onsubmit="return elementCheck();">
	<s:hidden name="editElement.id" id="elementid"></s:hidden>
	<s:hidden name="gid" id="gid"></s:hidden>
	<s:hidden name="eleGroup.id" id="eleGroup.id"></s:hidden>
	<s:hidden name="editElement.keyFlag" id="keyFlag"></s:hidden>
	<div class="content">
	<table width="100%">
		<tr>
			<td class="desc"><strong><fmt:message
				key="element.elementCode" /><span class="fromrequired">*</span></strong></td>
			<td><s:textfield name="editElement.eleCode" id="editCode" onchange="editCodeChange(this)"></s:textfield>
				<input type="hidden" id="editCodeOld" value="${ editElement.eleCode}"/>
				</td>
			<td class="desc"><strong><fmt:message
				key="element.elementName" /><span class="fromrequired">*</span></strong></td>
			<td ><s:textfield name="editElement.eleName" id="editName"
				 ></s:textfield></td>
			
			<td class="desc"><strong><fmt:message
				key="element.orderNum" /><span class="fromrequired">*</span></strong></td>
			<td>
			<input type="text" name="editElement.orderNum" value="${editElement.orderNum }" id="editNum" 
				 onkeyup="value=value.replace(/[^\d]/g,'')" />	
			</td>
			
		</tr>
	</table>
	
	</div>
	<table align="center">
	<tr>
		<td>
		<sx:submit type="submit" key="button.save" align="center"
						href="elementDataAction!save.do?ajax=true"  
						notifyTopics="/refresh" cssClass="btn_save" ></sx:submit>
			</td><td>	<sx:submit type="submit" key="button.new" align="center"
						href="elementDataAction!add.do?ajax=true" executeScripts="true"
						notifyTopics="/detail" cssClass="btn_add" validate="true"></sx:submit>
		</td>
	</tr>
	</table>
</s:form></fieldset>