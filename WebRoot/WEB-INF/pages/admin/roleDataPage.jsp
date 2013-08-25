<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<% 
  response.setHeader("Cache-Control","no-cache"); 
  response.setHeader("Pragma","no-cache"); 
  response.setDateHeader("Expires",0); 
%>
<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/jquerytreeview/jquery.treeview.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/jquerytreeview/jquery.treeview.async.js'/>"></script>
<script type="text/javascript">	
    $(function(){    	
    	$("#roleTree").treeview({          
            url: "../admin/roleDataAction!loadMenus.do?id=${role.roleId}"
        });
    	$("#compTree").treeview({          
            url: "../admin/roleDataAction!loadAuthoritys.do?id=${role.roleId}"
        }) ;    	
    });
    function formSub(){
    	if(validateForm_formIdThis()){
			if($("#roleTypeId").val()=="-1"){
				alert("<fmt:message key='role.type.no.error'/>");
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}
}
</script>
<head>
<title><fmt:message key="roleData.title" /></title>
<meta name="heading" content="<fmt:message key="roleData.heading"/>" />
</head>
<body >
<div id="noname" style="display:none"></div>
<s:form name="dataForm" action="roleDataAction" method="post" id="formIdThis"
	cssStyle="margin: 0 0 0 0;" validate="true" onsubmit="return formSub();">
	<s:hidden name="role.roleId"></s:hidden>
	<div class="title"><h3><fmt:message key="roleData.title" /></h3>
		<table align="center">
			<tr>
				<td><s:submit align="center" key="button.save" method="save"
					cssClass="btn_save" /></td>
				<td><s:submit align="center" key="button.back"
					cssClass="btn_back" method="cancel"
					onclick="window.location.href='roleListAction.do';return false;" /></td>
			</tr>
		</table>
	</div>
	<div class="content">
		<table width="100%">
			<tr>
				<td class="desc"><strong><fmt:message key="role.name" /><span
					class="fromrequired">*</span></strong></td>
				<td><s:textfield name="role.name" required="true"
					maxlength="20" /></td>
				<td class="desc"><strong><fmt:message
					key="role.description" /></strong></td>
				<td><s:textfield name="role.description" maxlength="64"></s:textfield></td>
				<td class="desc"><strong><fmt:message
					key="role.roleType" /><span
					class="fromrequired">*</span></strong></td>
				<td><s:select list="allRoleTypes" listKey="id" id="roleTypeId"
					listValue="eleName" name="role.roleType.id" headerKey="-1"
					headerValue="%{getText('label.please.choice')}" /></td>
			</tr>
		</table>
	
	<fieldset>
		<table >
			<tr>
				<th width="50%" class="pickLabel"><fmt:message
					key="roleProfile.selMenus" /><input type="checkbox" onclick="selAll(this,'menu_tree_chk')"/><fmt:message key="label.check.all"/></th>
				<th width="50%" class="pickLabel"><label class="required"><fmt:message
					key="roleProfile.selAuthoritys" /><input type="checkbox" onclick="selAll(this,'auth_tree_chk')"/><fmt:message key="label.check.all"/></label></th>
			</tr>
			<tr>
				<td valign="top"><ul id="roleTree" class="treeview-black"></ul></td>
				<td valign="top"><ul id="compTree" class="treeview-black"></ul></td>
			</tr>
		</table>
		</fieldset>
		</div>
</s:form>

<%@ include file="/common/overlay.jsp"%>

</body>