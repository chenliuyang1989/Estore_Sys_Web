<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="jobData.title"/></title>
   	<meta name="heading" content="<fmt:message key="jobData.title"/>" /> 
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
	
   	<script type="text/javascript">
   	$(function(){
   		$("#currentstatusId").val("${job.currentstatus}");
   		$("#jobNameId").change(function(){
   			$.ajax({
			    type: "post", 
			    url: "${ctx}/job/jobDataAction!getJobByName.do", 
			    data:"jobName="+$(this).val(),
			    success: function(data){ 
			    	var obj="";
			    	if(data!=null && typeof(data)=="object"){
			    		obj=data;	
			    	}else if(typeof(data)=="string"){
			    		var obj = eval("(" + data + ")");
			    	}
			    	if(obj!=null && obj!=""){
			    		$("#jobidId").val(obj[0].id);
			    		$("#jobscheduleId").val(obj[0].jobschedule);
			    		$("#currentstatusId").val(obj[0].currentstatus);
			    		$("#runmachineipId").val(obj[0].runmachineip);
			    		$("#jobdescId").val(obj[0].jobdesc);
			    	}else{
			    		$("#jobidId").val($("#jobIdOld").val());
			    		$("#jobscheduleId").val("");
			    		$("#currentstatusId").val("3");
			    		$("#runmachineipId").val("");
			    		$("#jobdescId").val("");
			    	}
		    	}
		    	});
   		});
   	});
   	function addNew(){
		$("[name=job.id]").eq(0).val("");
		$("#jobIdOld").val("");
		window.location.href="jobDataAction!load.do";
		
	}
   	
   	</script>
</head>

<body>
 	
	<s:form name="dataForm" id="formIdThis" action="jobDataAction" method="post"  cssStyle="margin: 0 0 0 0;" validate="true" >
		<s:token/>
		<input type="hidden" name="" value="${job.id }" id="jobIdOld"/>
		<s:hidden name="job.id" id="jobidId"></s:hidden>
		<s:hidden name="job.currentstatus"></s:hidden>	
		 <div class="title">
	    	<h3><fmt:message key="jobData.title"/></h3>
	    	<table>
			<tr>			
			<td>
				<input type="button" align="center" value='<s:text name="button.add"/>' onclick="addNew();" class="btn_add"/>
			</td>
			<td>
				<s:submit  align="center" key="button.save" method="save" cssClass="btn_save"/>
			</td>
			<td>
				<s:submit  align="center" key="button.back" onclick="window.location.href='jobListAction.do';return false;" cssClass="btn_back" method="cancel"  />
			</td>
			</tr>
			</table>
		</div>
		 <div class="content">
			<table width="100%" >
				<tr>
					<td class="desc"><strong><fmt:message key="job.jobname" /></strong><span class="fromrequired" >*</span></td>
					<td><s:textfield name="job.jobname" size="50" id="jobNameId"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="job.jobschedule" /><span class="fromrequired" >*</strong></td>
					<td>
						<s:textfield name="job.jobschedule" id="jobscheduleId"/>
					</td>
				</tr>				
				<tr>
					<td class="desc"><strong><fmt:message key="job.runmachineip" /></strong><span class="fromrequired" >*</span></td>
					<td><s:textfield name="job.runmachineip" size="60" id="runmachineipId"/></td>
				</tr>				
				<tr>
					<td class="desc"><strong><fmt:message key="job.jobdesc" /><span class="fromrequired" >*</span></strong></td>
					<td><s:textarea name="job.jobdesc" id="jobdescId"></s:textarea></td>
				</tr>
				
			</table>
			</div>
			
	</s:form>
</body>
<script>

</script>
