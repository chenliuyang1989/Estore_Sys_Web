<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
<title>系统维护</title>
<meta name="heading" content="系统维护" />
<script type="text/javascript"
	src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/scripts/selectbox.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/scripts/password.js'/>"></script>

	
</head>

<script>

function checkForm(){
	
	var host=document.getElementById("host").value;
	var command=document.getElementById("command").value;
	if(host.length<=0){
		alert("机器名不能为空");return false;
	}
	
	return confirm("是否确认需要【"+command+"】 机器【"+host+"】");
	
	
}

</script>


<body>

<s:form name="dataForm" action="/admin/systemManage!saveCommand.do" method="post" id="formIdThis"
	cssStyle="margin: 0 0 0 0;"  onsubmit="return checkForm()">
	
	<div class="title"><h3>系统维护</h3>
		
	</div>
	<div class="content">
		<table width="100%">
			<tr>
				<td class="desc"><strong>机器名<span class="fromrequired">*</span></strong></td>
				<td>
					<select id="host" name="host">
					<option value="esapp4">esapp4</option>
					<option value="esapp3">esapp3</option>
					<option value="esapp5">esapp5</option>
					<option value="stagapp">stagapp</option>
					</select>
				</td>
			</tr>
			<tr>
			<td class="desc"><strong>执行动作<span class="fromrequired">*</span></strong></td>
				<td>
				<select id="command" name="command"><option value="stop">停止</option></select>
				
				</td>
			</tr>
			<tr>
				<td </td>
				<td><strong>
				<a href="../system/downloadAction.do?fileName=/batchfile/incoming/hw/reloadSystem.out&xtype=1" class="down">下载日志</a>
				</strong></td>
				
			</tr>
		
		
			<tr>
				<td colspan="2"><s:submit align="center" key="button.save" method="save"
					cssClass="btn_save"  /></td>
				
			</tr>
		</table>
	</div>
</s:form>

<script>
		var message='${message}';
		if(message && message.length>0){
			alert(message);
		}
</script>

</body>










