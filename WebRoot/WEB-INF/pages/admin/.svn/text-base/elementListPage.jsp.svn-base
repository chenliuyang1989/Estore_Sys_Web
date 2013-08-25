<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<s:hidden name="gid" id="gid"></s:hidden>
<s:if test="resultList != null">
	<display:table name="resultList" cellspacing="0" cellpadding="0"
		requestURI="elementListAction.do" sort="external" partialList="true"
		size="totalRows" defaultsort="1" id="resultList"
		pagesize="${pageSize}" class="its">
		<display:column property="eleCode" titleKey="element.elementCode"
			paramId="id" paramProperty="id" />
		<display:column property="eleName" titleKey="element.elementName"
			paramId="id" paramProperty="id" />
		<display:column property="orderNum" titleKey="element.orderNum"
			paramId="id" paramProperty="id" />
		<display:column titleKey="button.edit">
			<s:url id="detail_element" action="elementDataAction">
				<s:param name="ajax" value="true"></s:param>
			</s:url>
			<s:url id="delete" action="elementDataAction">
				<s:param name="ajax" value="true"></s:param>
				<s:param name="id" value="id"></s:param>
			</s:url>
			<a dojoType="struts:BindAnchor" validate="false"
				ajaxAfterValidation="false" id="edit"
				href="<s:property value="detail_element" />&id=${resultList.id}&gid=${gid}"
				targets="element" showError="true" parseContent="true"> <fmt:message
				key="button.edit" /> </a>
			<a dojoType="struts:Bind" events="onclick" value="ssss"
				validate="false" ajaxAfterValidation="false" id="deletes"
				name="deletes"
				href="elementDataAction!delete.do?ajax=true&id=${resultList.id}"
				onclick="return(confirm('确定删除?'))" executeScripts="true"
				targets="t1"><fmt:message key="button.delete" /></a>
		</display:column>
	</display:table>
</s:if>