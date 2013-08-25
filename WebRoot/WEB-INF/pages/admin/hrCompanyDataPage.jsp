<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="hrCompanyData.title"/></title>
   	<meta name="heading" content="<fmt:message key="hrCompanyData.title"/>" /> 
   	<link rel="stylesheet" type="text/css" href="<c:url value='/scripts/jquery/dialog/base/jquery.ui.all.css'/>">
   <script type="text/javascript" src="<c:url value='/scripts/jquery/jquery-1.4.2.min.js'/>"></script>
   <script type="text/javascript" src="<c:url value='/scripts/jquery/dialog/jquery-ui-1.8.2.custom.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/jquerytreeview/jquery.treeview.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/jquerytreeview/jquery.treeview.async.org.js'/>"></script>
   	<script type="text/javascript">
   		$(function(){
   			$("#orgPropertiesId").val("${hrCompany.orgProperties}");
   			$("#orgTypeId").val("${hrCompany.orgType.id}");
   			if("${hrCompany.id}"==""){
   				$("#levelId").val("1");
   			}else{
   				$("#levelId").val("${hrCompany.compLevel}");
   			}
   			
   		 $("#compTree").treeview({          
             url: "${ctx}/admin/userDataAction!loadHrCompanys.do?id=${user.userId}"
             
         });
   		 $("#compNameId").change(function(){
   			
   			$.ajax({
			    type: "post", 
			    url: "${ctx}/admin/hrCompanyDataAction!getHrCompanyByName.do", 
			    data:"companyName="+$(this).val(),
			    success: function(data){ 
			    	var obj="";
			    	if(data!=null && typeof(data)=="object"){
			    		obj=data;	
			    	}else if(typeof(data)=="string"){
			    		var obj = eval("(" + data + ")");
			    	}
			    	if(obj!=null && obj!=""){
			    		$("#hrCompanyId").val(obj[0].id);
			    		$("#orgTypeId").val(obj[0].orgTypeId);
			    		$("#enabledId").val(obj[0].enabled);
			    		$("#orgSysIdId").val(obj[0].orgSysId);
			    		$("#compCodeId").val(obj[0].compCode);
			    		if(obj[0].parId==null || obj[0].parId==0){
			    			$("#parentId").val("");
			    		}
			    		$("#parName").text(obj[0].parName);
			    		$("#levelId").val(obj[0].compLevel);
			    		$("#compSubnameId").val(obj[0].compSubname);
			    		$("#compFullnameId").val(obj[0].compFullname);
			    		$("#orgPropertiesId").val(obj[0].orgProperties);
			    		$("#telId").val(obj[0].tel);
			    		$("#faxId").val(obj[0].fax);
			    		$("#addrId").val(obj[0].addr);
			    		$("#noteId").val(obj[0].note);
			    		if(obj[0].isWareHouse!=null && obj[0].isWareHouse=="1"){
			    			$("#isWareHouseId")[0].checked=true;
			    		}else{
			    			$("#isWareHouseId")[0].checked=false;
			    		}
			    		if(obj[0].isPurchase!=null && obj[0].isPurchase=="1"){
		    				$("#isPurchaseId")[0].checked=true;
			    		}else{
			    			$("#isPurchaseId")[0].checked=false;
			    		}
				    	if(obj[0].isSales!=null && obj[0].isSales=="1"){
			    			$("#isSalesId")[0].checked=true;
			    		}else{
			    			$("#isSalesId")[0].checked=false;
			    		}
				    	if(obj[0].isLogistics!=null && obj[0].isLogistics=="1"){
			    			$("#isLogisticsId")[0].checked=true;
			    		}else{
			    			$("#isLogisticsId")[0].checked=false;
			    		}
			    	}else{
			    		$("#hrCompanyId").val($("#hrCompanyIdOld").val());
			    	//	$("#orgTypeId").val(obj[0].orgTypeId);
			    		$("#enabledId").val("1");
			    		$("#orgSysIdId").val("");
			    		$("#compCodeId").val("");
			    		$("#parentId").val("");
			    		$("#parName").text("");
			    		$("#levelId").val("1");
			    		$("#compSubnameId").val("");
			    		$("#compFullnameId").val("");
			    		$("#orgPropertiesId").val("1");
			    		$("#telId").val("");
			    		$("#faxId").val("");
			    		$("#addrId").val("");
			    		$("#noteId").val("");
			    		$("#isWareHouseId")[0].checked=false;
			    		$("#isPurchaseId")[0].checked=false;
			    		$("#isSalesId")[0].checked=false;
			    		$("#isLogisticsId")[0].checked=false;
			    		
			    	}
		    	}
		    	});
   		 });
   		});
   		function addNew(){
   			$("[name=hrCompany.id]").eq(0).val("");
   			window.location.href='hrCompanyDataAction!load.do';
   		}
   		function openDiv(){
   			$("#parDiv").dialog({
				autoOpen: true,
				modal: true,
				height:300,
				buttons:{
					
					"<fmt:message key='button.cancel'/>":function(){$('#parDiv').dialog('close');},
   					"<fmt:message key='button.confirm' />":function(){getPar();}
				}
			});
			//$("#parDiv").dialog('open');
   		}
   		function getPar(){
   			var pars=$("[name=comp_tree_chk]");
   			for(var i=0;i<pars.length;i++){
   				if(pars[i].checked){
   					$("#levelId").val(parseInt($(pars[i]).next().val())+1);
   					$("#parentId").val(pars[i].value);
   					$("#parName").text($(pars[i]).parent().text());
   					$("#parDiv").dialog('close');
   				}
   			}
   		}
   		function getHrCompanyLevelByType(){
   			var flag=true;
   			$.ajax({
			    type: "post", 
			    async: false,
			    url: "${ctx}/admin/hrCompanyDataAction!getHrCompanyLevelByType.do", 
			    data:"orgTypeId="+$("#orgTypeId").val()+"&parentId="+$("#parentId").val()+"&compLevel="+$("#levelId").val(),
			    success: function(data){ 
			    	if(data=="1"){
			    		alert("<fmt:message key='company.typelevel.error'/>");
			    		flag=false;
			    	}else if(data=="2"){
			    		alert("<fmt:message key='company.type.error'/>");
			    		flag=false;
			    	}else if(data=="-1"){
			    		alert("<fmt:message key='error.query'/>");
			    		flag=false;
			    	}
		    	}
		    	});
   			return flag;
   		}
   		function checkInput(){
   			if($("#compNameId").val()==""){
   				alert("<fmt:message key='company.compname.no.error'/>");
   				return false;
   			}else{
   				return getHrCompanyLevelByType();
   			}
   		}
   	</script>
   	
</head>

<body>
 	
	<s:form name="dataForm" id="formIdThis" action="hrCompanyDataAction" method="post"  cssStyle="margin: 0 0 0 0;" 
		onsubmit="return checkInput();">
		<s:token/>
		<input type="hidden" name="" value="${hrCompany.id}" id="hrCompanyIdOld"/>
		<s:hidden  name="hrCompany.id" id="hrCompanyId"></s:hidden>		
		<s:hidden name="hrCompany.enabled" id="enabledId"></s:hidden>
		<s:hidden name="hrCompany.orgSysId" id="orgSysIdId"></s:hidden>
		 <div class="title">
	    	<h3><fmt:message key="hrCompanyData.title"/></h3>
	    	<table>
			<tr>			
			<td>
				<input type="button" align="center" value='<s:text name="button.add"/>' onclick="addNew();" class="btn_add"/>
			</td>
			<td>
				<s:submit  align="center" key="button.save" method="save" cssClass="btn_save"/>
			</td>
			<td>
				<s:submit  align="center" key="button.back" onclick="window.location.href='hrCompanyListAction.do';return false;" cssClass="btn_back" method="cancel"  />
			</td>
			</tr>
			</table>
		</div>
		 <div class="content">
			<table width="100%" >
				<tr>
					<td class="desc"><strong><fmt:message key="company.compCode" /></strong><span class="fromrequired" >*</span></td>
					<td><s:textfield name="hrCompany.compCode" readonly="true" id="compCodeId" cssClass="grayBg"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.parent" /></strong></td>
					<td nowrap="nowrap">
						<s:hidden name="hrCompany.parentId.id" id="parentId"/>
						<span id="parName">${hrCompany.parentId.compName}</span>
						<a href="javascript:openDiv();"><fmt:message key="company.parent.select"/></a>(<fmt:message key="message.companyLevel.default"/>)
						
					</td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.companyLevel" /></strong></td>
					<td><s:textfield name="hrCompany.compLevel" readonly="true" id="levelId"  cssClass="grayBg"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.companyname" /></strong><span class="fromrequired" >*</span></td>
					<td><s:textfield name="hrCompany.compName" id="compNameId"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.compsubname" /></strong></td>
					<td><s:textfield name="hrCompany.compSubname" id="compSubnameId"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.compFullname" /></strong></td>
					<td><s:textfield name="hrCompany.compFullname" id="compFullnameId"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.orgProperties" /></strong></td>
					<td>
						<select id="orgPropertiesId" name="hrCompany.orgProperties">
							<option value="1"><fmt:message key="company.orgProperties.inner" /></option>
							<option value="2"><fmt:message key="company.orgProperties.outer" /></option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.orgType.eleName" /></strong></td>
					<td><select id="orgTypeId" name="hrCompany.orgType.id">
							<s:iterator value="#request.orgTypeList">
								<s:if test="%{eleCode==@com.gmcc.util.AppContentGmcc@ORG_TYPE_HR }">
									<option value="${id }" selected="selected">${eleName }</option>
								</s:if>
								<s:else>
									<option value="${id }">${eleName }</option>
								</s:else>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.orgCategory" /></strong></td>
					<td>
						<input type="checkbox" id="isWareHouseId" name="hrCompany.isWareHouse" value="1" <s:if test='%{hrCompany.isWareHouse=="1"}'>checked </s:if>/><fmt:message key="company.isWareHouse" />
						<input type="checkbox" id="isPurchaseId" name="hrCompany.isPurchase" value="1" <s:if test='%{hrCompany.isPurchase=="1"}'>checked</s:if>/><fmt:message key="company.isPurchase" />
						<input type="checkbox" id="isSalesId" name="hrCompany.isSales" value="1" <s:if test='%{ hrCompany.isSales=="1"}'>checked</s:if> /><fmt:message key="company.isSales" />
						<input type="checkbox" id="isLogisticsId" name="hrCompany.isLogistics" value="1" <s:if test='%{hrCompany.isLogistics=="1"}'>checked</s:if>/><fmt:message key="company.isLogistics" />
					</td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.tel" /></strong></td>
					<td><s:textfield name="hrCompany.tel" id="telId"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.fax" /></strong></td>
					<td><s:textfield name="hrCompany.fax" id="faxId"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.addr" /></strong></td>
					<td><s:textarea name="hrCompany.addr" id="addrId"/></td>
				</tr>
				<tr>
					<td class="desc"><strong><fmt:message key="company.note" /></strong></td>
					<td><s:textarea name="hrCompany.note" id="noteId"/></td>
				</tr>
			</table>
			</div>
			<div id="parDiv" class="content" style="display:none;margin-top:0;text-align:left;height:300px;overflow:auto;" >
			<table >
			
			<tr>
				<td>
					<ul id="compTree" class="treeview-black"></ul>
				</td>
				
			</tr>
			
			</table>
		</div>
	</s:form>
</body>
<script>

</script>
