<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<head>
<title><fmt:message key="elementData.title" /></title>
<meta name="heading" content="<fmt:message key="elementData.heading"/>" />
<script type="text/javascript"
	src="<c:url value='/scripts/selectbox.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
<sx:head />

</head>

<body>
<s:form name="dataForm" action="elementGroupDataAction" method="post"
	validate="true">
	<s:hidden name="id"></s:hidden>
	<input type="hidden" value="${ eleGroup.eleGroupName}" id="gnid"/>
	<s:hidden name="eleGroup.id" id="gid"></s:hidden>
	<s:hidden name="groupname" id="groupname"></s:hidden>
	<s:hidden name="remarks" id="remarks"></s:hidden>
	<s:hidden name="ttype" id="ttype"></s:hidden>
	<s:hidden name="eleGroup.ttype" id="ttypes"></s:hidden>
	<s:hidden name="eleGroup.version" id="version"></s:hidden>
	<s:hidden name="eleGroup.keyFlag" id="keyFlag"></s:hidden>
	<div class="content">
	<fieldset><legend> <fmt:message
		key="elementData.title" /> </legend>
	<table width="100%">
		<tr>
			<td class="desc"><strong><fmt:message
				key="element.groupName" /><span class="fromrequired">*</span></strong></td>
			<td><s:textfield name="eleGroup.eleGroupName" required="true" id="eleGroupNameId"></s:textfield>
			</td>
			<td class="desc"><strong><fmt:message
				key="element.remarks" /></strong></td>
			<td><s:textfield name="eleGroup.eleGroupRemark"></s:textfield></td>
		</tr>
	</table>
	</fieldset>
	</div>
	<table align="center">
		<tr>
			<td><s:submit align="center" key="button.save"
				cssClass="btn_save" method="save" /></td>
			
			<td><s:url id="backButton" action="elementGroupListAction">
				<s:param name="ttype">${eleGroup.ttype}</s:param>
			</s:url> <s:submit align="center" key="button.back"
				onclick="window.location.href='%{backButton}';return false;"
				cssClass="btn_back" method="cancel" /></td>
		</tr>
	</table>
</s:form>
<c:if test="${eleGroup.id>0}">
	<sx:div id="t1" executeScripts="true"></sx:div>
	<div id="editSubForm"><s:url id="detail_element"
		action="elementDataAction">
		<s:param name="ajax" value="true"></s:param>
		<s:param name="gid" value="eleGroup.id"></s:param>
	</s:url> <sx:div id="element" href="%{detail_element}" theme="ajax"
		executeScripts="true" listenTopics="/detail">
	</sx:div></div>
	<div><s:url id="d_url" action="elementListAction!queryPage.do">
		<s:param name="gid" value="eleGroup.id"></s:param>
		<s:param name="ajax" value="true"></s:param>
	</s:url> <sx:div id="element_list" executeScripts="true" href="%{d_url}"
		listenTopics="/refresh">
	</sx:div></div>

	<script>
		var controller = {
			refresh : function() {}
		};
		dojo.event.topic.registerPublisher("/refresh", controller, "refresh");

</script>
</c:if>
<script type="text/javascript">
function elementCheck(){
	if($("#editCode").val()==""){
		alert("<fmt:message key='element.code.error'/>");
		return false;
	}else if($("#editName").val()==""){
		alert("<fmt:message key='element.name.error'/>");
		return false;
	}else if($("#editNum").val()==""){
		alert("<fmt:message key='element.orderNum.error'/>");
		return false;
	}
	return true;
}
function editCodeChange(obj){
	if($("#editCodeOld").val()=="" || $("#editCodeOld").val()!=$(this).val() ){
		$.ajax({
		    type: "post", 
		    url: "${ctx}/admin/elementGroupDataAction!getElementByCode.do", 
		    data:"eleCode="+$(obj).val()+"&groupName="+$("#gnid").val(),
		    success: function(data){ 
		    	if(data=="1"){
		    		alert("<fmt:message key='element.eleCode.exist'/>");
		    		$(obj).val("");
		    		$(obj).focus();
		    		return false;
		    	}else if(data=="-1"){
		    		alert("<fmt:message key='error.query'/>");
		    		$(obj).val("");
		    		$(obj).focus();
	    			return false;
		    	}
	    	}
	    	});
	}
}
$(function(){
	$("#eleGroupNameId").change(function(){
		
		if($("#gnid").val()=="" || $("#gnid").val()!=$(this).val() ){
			$.ajax({
			    type: "post", 
			    url: "${ctx}/admin/elementGroupDataAction!getEleGroupByName.do", 
			    data:"eleGroupName="+$(this).val()+"&eleGroupId="+$("#gid").val(),
			    success: function(data){ 
			    	if(data=="1"){
			    		alert("<fmt:message key='element.eleGroupName.exist'/>");
			    		$(this).val("");
			    		$(this).focus();
			    		return false;
			    	}else if(data=="-1"){
			    		alert("<fmt:message key='error.query'/>");
			    		$(this).val("");
			    		$(this).focus();
		    			return false;
			    	}
		    	}
		    	});
		}
	});
});
</script> 
</body>