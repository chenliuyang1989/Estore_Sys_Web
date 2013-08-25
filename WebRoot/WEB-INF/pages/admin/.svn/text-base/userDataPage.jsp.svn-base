<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<% 
  response.setHeader("Cache-Control","no-cache"); 
  response.setHeader("Pragma","no-cache"); 
  response.setDateHeader("Expires",0); 
%>
<head>
<title><fmt:message key="userData.title" /></title>
<meta name="heading" content="<fmt:message key="userData.heading"/>" />
<script type="text/javascript"
	src="<c:url value='/scripts/selectbox.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/jquerytreeview/jquery.treeview.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/jquerytreeview/jquery.treeview.async.js'/>"></script>
<script type="text/javascript">

    $(function(){
    	$("#cityId").val("${user.citySysID}");
    	$("#channelId").val("${user.channel}");
    	$("#userTypeId").val("${user.userType.id}");
       $("#roleTree").treeview({          
           url: "${ctx}/admin/userDataAction!loadRoles.do?id=${user.userId}&roleStr="+$("#roleStr").val()
           
       });
     //  $("#compTree1").treeview({          
    //	   animated: "fast",
    //	   collapsed: true,
    //	   unique: true,
    //	   persist: "location",
    //	           url:"${ctx}/admin/userDataAction!loadHrCompanys2.do?id=${user.userId}&viewBox=1&compStr="+$("#compStr").val()
    //	     }); 
       $("#compTree").treeview({          
           url: "${ctx}/admin/userDataAction!loadHrCompanys.do?id=${user.userId}&compStr="+$("#compStr").val()
           
       });
       $("#userNameId").change(function(){
    	   var flag=false;
    	   var userId=0;
    	   $.ajax({
			    type: "post", 
			    async: false,
			    url: "${ctx}/admin/userDataAction!getUserByName.do", 
			    data:"userName="+$(this).val(),
			    success: function(data){ 
			    	if(data!=null && data!=""){
			    		flag=true;
			    		userId=data;
			    	}
		    	}
		    	});
			if(flag){
				if(confirm("<fmt:message key='user.enabled.confirm'/>?")){
					window.location.href="${ctx}/admin/userDataAction!load.do?id="+userId+"&enable=true";
				}
			}
       });
    });
    function selParAndChild(obj){
    	if($(obj).next().attr("name")=="typeName" && $(obj).next().val()==""){
    		alert("<fmt:message key='role.type.norole.error'/>");
    		obj.checked=false;
    		return false;
    	}
    	var type=$("[name=typeName]");
    	if($(obj).next().attr("name")=="typeName" && obj.checked){
    		for(var i=0;i<type.length;i++){
    			var chk=$(type[i]).prev();
    			var par=$(type[i]).prev().prev();
    			if(chk[0].checked  && obj!=chk[0] &&  $(obj).next().val()!=type[i].value){
    				alert("<fmt:message key='role.type.error'/>");
    				obj.checked=false;
    				return false;
    			}
    		}
    	}
    	else if($(obj).attr("name")=="role_type_tree_chk"){
	    	var childName=$("[name="+"role_tree_chk"+$(obj).attr("value")+"]");
	    	for(var j=0;j<childName.length;j++){
	    		var child=childName[j];
	    		$(child).next().get(0).checked=obj.checked;
	    		selParAndChild($(child).next().get(0));
	    	}
    	}else if($(obj).attr("name")=="comp_tree_chk"){
    		var childName=$("[name="+$(obj).attr("name")+$(obj).attr("value")+"]");
    		for(var j=0;j<childName.length;j++){
    			var child=childName[j];
    			$(child).next().get(0).checked=obj.checked;
    			selParAndChild($(child).next().get(0));
    		}
    	}
    }
</script>
</head>
<body>

<s:form name="dataForm" action="userDataAction" method="post"
	cssStyle="margin: 0 0 0 0;" validate="true">
	<s:hidden name="user.userId"></s:hidden>
	<s:hidden name="psw"></s:hidden>
	<input type="hidden" id="compStr" value="${compStr }"/>
	<input type="hidden" id="roleStr" value="${roleStr }"/>
	<div class="title"><h3><fmt:message key="userData.title" /></h3>
		<table align="center">
		<tr>
			<td><s:submit align="center" key="button.save" method="save"
				cssClass="btn_save" onclick="return onFormSubmit(this.form)" /></td>
			<td><s:submit align="center" key="button.back"
				onclick="window.location.href='userListAction.do';return false;"
				cssClass="btn_back" method="cancel" /></td>
		</tr>
		</table>
	</div>
	<div class="content">
		<table width="100%">
			<tr>
				<td class="desc"><strong><fmt:message
					key="user.username" /><span class="fromrequired">*</span></strong></td>
				<td><s:if test="user.userId==null">
					<s:textfield name="user.username" required="true" id="userNameId"/>
				</s:if> <s:if test="user.userId!=null">
					<s:textfield name="user.username" readonly="true" required="true" />
				</s:if></td>
				<td class="desc"><strong><fmt:message
					key="user.fullname" /><span class="fromrequired">*</span></strong></td>
				<td><s:textfield name="user.fullname"></s:textfield></td>
	
				<td class="desc"><strong><fmt:message
					key="user.identifyNumber" /><span class="fromrequired"></span></strong></td>
				<td><s:textfield name="user.identifyNumber" required="true" /></td>
			</tr>
			<tr>
				<td class="desc"><strong><fmt:message
					key="user.password" /></strong> <s:if test="user.userId==null">
					<span class="fromrequired">*</span>
				</s:if></td>
				<td><s:password name="user.password" size="22"></s:password></td>
				<td class="desc"><strong><fmt:message
					key="user.confirmPassword" /></strong></td>
				<td><s:password name="user.confirmPassword" size="22"></s:password></td>
				<td class="desc"><strong><fmt:message
					key="user.phoneNumber" /><span class="fromrequired">*</span></strong></td>
				<td><s:textfield name="user.phoneNumber" id="phoneNumberId"></s:textfield></td>
			</tr>
			<tr>
				<td class="desc"><strong><fmt:message
					key="user.enabled" /></strong></td>
				<td>
				<s:checkbox name="user.enabled" />				
				</td>
				<td class="desc"><strong><fmt:message key="field.city" /></strong><span class="fromrequired" >*</span></td>
				<td><select id="cityId" name="user.citySysID">
							<s:iterator value="#request.cityList">
								<s:if test="%{eleCode==-1 }">
									<option value="${eleCode }" selected="selected">${eleName }</option>
								</s:if>
								<s:else>
									<option value="${eleCode }">${eleName }</option>
								</s:else>
							</s:iterator>
						</select>
					</td>
				<td class="desc"><strong><fmt:message key="field.channel" /></strong><span class="fromrequired" >*</span></td>
				<td><select id="channelId" name="user.channel">
							<s:iterator value="#request.channelList">
								<s:if test="%{eleCode=='-1' }">
									<!-- <option value="${eleCode }" selected="selected">${eleName }</option>  -->
								</s:if>
								<s:else>
									<option value="${eleCode }">${eleName }</option>
								</s:else>
							</s:iterator>
						</select>
					</td>
			</tr>
			<tr>
				<td class="desc"><strong>是否短信验证</strong></td>
				<td >
						<input type="checkbox" name="user.isPhoneCheck" value="1" <s:if test='%{user.isPhoneCheck==1}'>checked </s:if>/>
				</td>
				<td class="desc"><strong><fmt:message key="user.type" /></strong><span class="fromrequired" >*</span></td>
				<td colspan="5">
						<select id="userTypeId" name="user.userType.id">
							<option value="">请选择</option>
							<s:iterator value="#request.userTypeList">
								<option value="${id }">${eleName }</option>
							</s:iterator>
						</select>
				</td>
			</tr>
			<tr>
				<td class="desc"><strong><fmt:message key="user.remark" /></strong></td>
				<td colspan="5"><s:textarea rows="2" cols="60" name="user.remark"></s:textarea></td>
			</tr>
		</table>
		
		<fieldset>
		<table >
			<tr>
				<th width="50%" class="pickLabel"><label class="required"><fmt:message
					key="userProfile.selRoles" /></label></th>
				<th width="50%" class="pickLabel"><label class="required"><fmt:message
					key="userProfile.selCompany" /></label></th>
			</tr>
			<tr>
				<td valign="top"><ul id="roleTree" class="treeview-black"></ul></td>
				<td valign="top"><ul id="compTree" class="treeview-black"></ul></td>
			</tr>
		</table>
		</fieldset>
		</div>
</s:form>
<script type="text/javascript">
	function onFormSubmit(theForm) {
		var flag=false;
 	   var userId=0;
 	   $.ajax({
			    type: "post", 
			    async: false,
			    url: "${ctx}/admin/userDataAction!getUserByName.do", 
			    data:"userName="+$("#userNameId").val(),
			    success: function(data){ 
			    	if(data!=null && data!=""){
			    		flag=true;
			    		userId=data;
			    	}
		    	}
		    	});
			if(flag){
				if(confirm("<fmt:message key='user.enabled.confirm'/>?")){
					window.location.href="${ctx}/admin/userDataAction!load.do?id="+userId+"&enable=true";
					flag=false;
				}else{
					flag=false;
				}
			}else{
				flag=true;
			}
			if($("#phoneNumberId").val()==""){
				alert("联系电话不能为空");
				$("#phoneNumberId").focus();
				flag=false;
			}else if(!(/^1[3|4|5|8][0-9]\d{8}$/.test($("#phoneNumberId").val()))){ 
				alert("联系电话不正确");
				$("#phoneNumberId").focus();
				flag=false;
			}else if($("#userTypeId").val()==""){
				alert("用户类型不能为空");
				$("#userTypeId").focus();
				flag=false;
			}
			return flag;
	}
	</script>
   
</body>