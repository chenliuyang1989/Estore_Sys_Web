<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="jobList.title"/></title>
   	<meta name="heading" content="<fmt:message key="jobList.title"/>" />  
   	<link rel="stylesheet" type="text/css" href="<c:url value='/scripts/jquery/dialog/base/jquery.ui.all.css'/>">
    <script type="text/javascript" src="<c:url value='/scripts/jquery/jquery-1.4.2.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/dialog/jquery-ui-1.8.2.custom.min.js'/>"></script>
   	<script type="text/javascript">   
		$(function(){
   			$("#jobStatusId").val("${job.currentstatus}");
   		});
	    function selectAllRecord() {
	        for(var i=0; i<document.getElementsByName("_chk").length; i++){
	        	document.getElementsByName("_chk")[i].checked = document.getElementById("_chkall").checked;
	        }
	    }
	    function onBatchSubmit() {
	    	var flag = false;
	    	if(confirm('<fmt:message key="message.submit.confirm"/>?')){
		  		$(":input[name='_chk']").each(function(i){
		    		if(this.checked == true){
		    			flag = true;		    			
		    		}
		    	});
		  		if(!flag){		  			
		  			alert("请选择至少选择一条记录!");
		  			return false;
		  		}
		  		return true;
	    	}else{
	    		return false;
	    	}   	
		}
	    function runJob(id){
	    	if (confirm('<fmt:message key="job.open.confirm"/>?')) {
				$("#queryForm")[0].action = "jobListAction!runJob.do?id="+id;
				$("#queryForm")[0].submit();
			}
	    }
	    function closeJob(id){
	    	if (confirm('<fmt:message key="job.close.confirm"/>?')) {
				$("#queryForm")[0].action = "jobListAction!closeJob.do?id="+id;
				$("#queryForm")[0].submit();
			}
	    }
	    function pauseJob(id){
	    	if (confirm('<fmt:message key="job.pause.confirm"/>?')) {
				$("#queryForm")[0].action = "jobListAction!pauseJob.do?id="+id;
				$("#queryForm")[0].submit();
			}
	    }
	    function resumeJob(id){
	    	if (confirm('<fmt:message key="job.resume.confirm"/>?')) {
				$("#queryForm")[0].action = "jobListAction!resumeJob.do?id="+id;
				$("#queryForm")[0].submit();
			}
	    }
	</script>
</head>
<body>
	<s:form name="queryForm" id="queryForm" action="jobListAction" method="post" cssStyle="margin: 0 0 0 0;">
		<div class="search"><h3><fmt:message key="query.condition" /></h3>
			<table>
				<tr >
				
					<td rowspan="2"><fmt:message key="job.jobname" /></td>
					<td rowspan="2">
						<s:textarea name="job.jobname" rows="5"/>
					</td>
					
					<td rowspan="2"><fmt:message key="job.jobdesc" /></td>
					<td rowspan="2">
						<s:textarea name="job.jobdesc" rows="5"/>
					</td>
					<td><fmt:message key="job.currentstatus" /></td>
					<td>
						<select name="job.currentstatus" id="jobStatusId">
							<option value=""><fmt:message key="label.please.choice"/></option>
							<option value="1"><fmt:message key="job.currentstatus.run"/></option>
							<option value="0"><fmt:message key="job.currentstatus.end"/></option>
							<option value="3"><fmt:message key="job.currentstatus.open"/></option>
							<option value="4"><fmt:message key="job.currentstatus.close"/></option>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
				
					<td>
						<fmt:message key="job.runmachineip" />
					</td>
					<td >
						<s:textfield name="job.runmachineip" size="30"/>
					</td>	
					<td ><s:submit align="center" key="button.search"
					method="queryPage" cssClass="btn_search" /></td>
				</tr>
				<tr>
					
						
				</tr>
				<tr><td colspan="4"><span class="fromrequired" >注：调度名称，描述支持批量模糊查询,以回车分隔</span></td></tr>
			</table>
		</div>	
		<div class="searchBottomLine1"></div>
		<div class="ListTitle">
			<table>
				<tr>
					<td><s:submit  align="center" key="job.command.batchopen" action="jobListAction" method="batchRunJob" 
						cssClass="btn_start" onclick="return onBatchSubmit();" /></td>
						<td><s:submit  align="center" key="job.command.batchclose" action="jobListAction" method="batchCloseJob" 
						cssClass="btn_close" onclick="return onBatchSubmit();" /></td>				
					<td><s:submit align="center" key="button.add" method="add"
						cssClass="btn_add" /></td>
					<td><input value="<s:text name="button.setview"/>" type="button"
						onclick="popColumnList(1);" class="btn_Set"></td>
					<td></td>
				</tr>
			</table>
		</div>
		<%@ include file="/common/columnlist.jsp"%>
		<display:table name="resultList" cellspacing="0" cellpadding="0" decorator="checkboxDecorator" requestURI="jobListAction.do" partialList="true" size="totalRows" id="resultList" pagesize="${pageSize}" class="its" export="true">
		   	<display:column property="checkbox" media="html" title="<input type='checkbox' name='_chkall' id='_chkall' onclick='selectAllRecord();' />"/>
		    <c:forEach var="cl" items="${collist}">
				<c:if test="${cl.status=='A'}">
					<display:column property="${cl.property}" media="${cl.media}" 
					titleKey="${cl.titleKey}" sortable="${cl.sortable}" decorator="${cl.decorator}"					
					 />
				</c:if>
			</c:forEach>			
		   <display:column titleKey="querry.list.title" media="html" autolink="false">
		   		<c:if test="${resultList.currentstatus==null || resultList.currentstatus=='4'}">
		   			<a href="javascript:void(0);"
						onclick="runJob('${resultList.id}');"><fmt:message key="job.command.open"/>
					</a>
		   		</c:if>
		   		<c:if test="${resultList.currentstatus==null || resultList.currentstatus=='0' || resultList.currentstatus=='3'}">
		   			<a href="javascript:void(0);"
						onclick="closeJob('${resultList.id}');"><fmt:message key="job.command.close"/>
					</a>
		   		</c:if>
		   	  	<c:if test="${resultList.currentstatus==null || resultList.currentstatus=='1'}">
		   			<a href="javascript:void(0);"
						onclick="pauseJob('${resultList.id}');"><fmt:message key="job.command.pause"/>
					</a>
		   		</c:if>
		   		<c:if test="${resultList.currentstatus==null || resultList.currentstatus=='2'}">  
		   			<a href="javascript:void(0);"
						onclick="resumeJob('${resultList.id}');"><fmt:message key="job.command.resume"/>
					</a>
		   		</c:if>
				<a href="jobDataAction.do?job.id=${resultList.id}" ><fmt:message key="querry.list.operation.edit"/></a>   
			</display:column>
		</display:table>
	</s:form>
</body>