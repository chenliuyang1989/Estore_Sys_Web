<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="system.notice.titlevis"/><fmt:message key="querry.list.operation.edit"/></title>
   	<meta name="heading" content="<fmt:message key="system.notice.titlevis"/><fmt:message key="querry.list.operation.edit"/>" /> 
   	<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/scripts/jquery/jquery.autocomplete.css'/>" />
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery-1.4.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.bgiframe.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.ajaxQueue.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/thickbox-compressed.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.autocomplete.js'/>"></script> 
	<script language="javascript" type="text/javascript" src="<c:url value='/scripts/My97DatePicker/WdatePicker.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/scripts/fckeditor/fckeditor.js' />"></script>
   		<script type="text/javascript">
		function checkFormSub(){
			if(confirm("确定保存吗?")) {
				if($("#note").val()==""){
		   				alert('通告标题不能为空!');
		   				return false;
		   			}
	   	   			return true;
			} else {
				return false;
			}
		}

	    function goBack(){
    		window.location.href="verNoticeAct!findVersionnotice.do";
    	}
   	</script>
</head>
<body>
	<s:form name="dataForm" id="dataFormId" action="verNoticeAct" method="post"  cssStyle="margin: 0 0 0 0;"  validate="true" onsubmit="return checkFormSub();">
		<s:token/>
		<div style="color:red;font-weight:bolder;font-size:12px">${saveFlag }</div>
	    <div class="title">
	    	<h3><fmt:message key="system.notice.titlevis"/><fmt:message key="querry.list.operation.edit"/></h3>
	    	<table align="center" >
			<tr>
				<td>
					<s:submit id="subButId" align="center" key="button.save" method="updVersionnotice" cssClass="btn_save" />
				</td>
			<td>
				<s:submit align="center" key="button.back" onclick="goBack();return false;"  cssClass="btn_back" method="cancel"  />
			</td>
			</tr>
			</table>
		</div>
	<div class="content">
	<table width="100%" border="0" cellspacing="1" cellpadding="2">
		<tr>
			<input type="hidden" id="id" name="versionnotice.id" value="${versionnotice.id }" />
			<td class="desc"><strong><fmt:message key="system.notice.title" /></strong><font color="red"></font></td>
			<td><input type="text" id="note" name="versionnotice.note" value="${versionnotice.note }" /></td>
			<td class="desc"><strong><fmt:message key="system.notice.enabled" /></strong></td>
			<td>
				<s:select list="enabled" listKey="id" listValue="eleName" name="versionnotice.enabled" cssStyle="width:130px" />
			</td>
		</tr>
		<tr>
			<td class="desc"><strong><fmt:message key="system.notice.priority" /></strong></td>
			<td><s:select list="priority" listKey="id" listValue="eleName" name="versionnotice.priority" cssStyle="width:130px" /></td>
			<td class="desc"><strong><fmt:message key="system.notice.noticetype" /></strong></td>
			<td><s:select list="sysNoticeTypeList" listKey="id" listValue="eleName" name="versionnotice.notetype" cssStyle="width:130px" /></td>
		</tr>
		<tr>
			<td class="desc"><strong><fmt:message key="system.notice.displaybeg" /></strong></td>
			<td>
				<input type="text" class="Wdate" id="startTime" name="versionnotice.visibletime1" value="${versionnotice.visibletime1 }" onclick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01\'}'})"/>
			</td>
			<td class="desc"><strong><fmt:message key="system.notice.displayend" /></strong></td>
			<td>
				<input type="text" class="Wdate" id="endTime" name="versionnotice.deadline1" value="${versionnotice.deadline1 }" onclick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,minDate:'#F{$dp.$D(\'startTime\')}',maxDate:'2020-10-01'})"/>
			</td>
		</tr>
		<tr>
			<td class="desc"><strong><fmt:message key="system.notice.content" /></strong></td>
			<td colspan="3">
				<textarea id="content" name="versionnotice.description" style="WIDTH: 100%; HEIGHT: 300px">
					${versionnotice.description }
				</textarea>
				<script type="text/javascript" >
				var o = new FCKeditor('content');
					    o.Height = "400";
					    o.BasePath = "../scripts/fckeditor/";
					    o.Config['ToolbarStartExpanded'] = 'true';
					    o.Config['ToolbarCanCollapse'] = 'false';
					    o.Config['LinkUpload'] = 'true';
					    o.Config['ImageUpload'] = 'true';
					    o.Config['FlashUpload'] = 'true';
					    o.ReplaceTextarea();
				</script>
			</td>
		</tr>
	</table>
	</s:form>	
</body>
