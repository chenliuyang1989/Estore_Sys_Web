<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="roleList.title" /></title>
<meta name="heading" content="<fmt:message key="roleList.heading"/>" />

<script type="text/javascript"
	src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/scripts/jquery.displaytag.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/json.js'/>" /></script>
		<script type="text/javascript" src="<c:url value='/scripts/menuDisplay.js'/>" /></script>
				<script type="text/javascript" src="<c:url value='/scripts/jquery.TableExcel.js'/>" /></script>
		
<script type="text/javascript">

function loadRoleMenu()
{
   	$.post("roleMenuListAction!queryRoleMenuList.do",$("#queryForm").serialize(),
   	 function(responseText)
   	{
   		var data = responseText.split("|");
   		var datas = new Array(data.length);
   		for( var i=0 ; i< data.length ; i++)
   			{
   			datas[i] = data[i].split(",");
   			}
   		   if(data.length >1)
   			{
   		      create (datas);
   			}
      	},"text"
   	);
}

function exportTable() {

	var tableData = $('#rep').exportTableData({
		callback: function(tr, td, row, col, val) {
				return val;
		}
	});
	tableData.name = "角色权限";
	
	$('#tableData').val(JSON.encode(tableData));
	$('#exportExcel').submit();
} 
</script>


</head>
<body>
<s:form id ="queryForm" name="queryForm" action="roleMenuListAction" method="post"
	cssStyle="margin: 0 0 0 0;">
	<div class="search"><h3><fmt:message key="query.condition" /></h3>
		<table>
			<tr>
				<td><fmt:message key="role.name" /></td>
				<td><s:textfield name="role.name"></s:textfield></td>
				
								<td class="desc"><strong><fmt:message
					key="role.roleType" /><span
					class="fromrequired">*</span></strong></td>
					
				<td><s:select list="allRoleTypes" listKey="id" id="roleTypeId"
					listValue="eleName" name="role.roleType.id" headerKey="-1"
					headerValue="%{getText('label.please.choice')}" /></td>
				<td></td>
				<td><s:submit align="center" key="button.search" onclick="loadRoleMenu();return false;"
					cssClass="btn_search" method="queryRoleMenuList" /></td>
			</tr>
		</table>
	</div>
	<div class="searchBottomLine1"></div>
	<%@ include file="/common/columnlist.jsp"%>
<div class="title">

        <h3 align="center">角色权限查询</h3>
</div>

<div class="exportlinks">导出选项: 
   <a href="javascript:exportTable();"><span class="export excel">Excel </span></a></div>

<div id="report" class="content">

</div>

	
</s:form>

<form id="exportExcel" name="exportExcel" method="post" action="servlet/ExportServlet" >
    <input id="method" type="hidden" name="method" value="exportExcel"/>
    <input id="tableData" type="hidden" name="tableData"/>
</form>
</body>