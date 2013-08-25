<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<head>
<title><fmt:message key="userList.title" />
</title>
<meta name="heading" content="<fmt:message key="userList.heading"/>" />
<script type="text/javascript"
	src="<c:url value='/scripts/selectbox.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/scripts/jquery/dialog/base/jquery.ui.all.css'/>">
		<script type="text/javascript" src="<c:url value='/scripts/My97DatePicker/WdatePicker.js'/>"  ></script> 
	
<script type="text/javascript"
	src="<c:url value='/scripts/jquery/jquery-1.4.2.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/scripts/jquery/dialog/jquery-ui-1.8.2.custom.min.js'/>"></script>


<script type="text/javascript">
	$(function() {
		$("#statusId").val("${user.status}");
		$("#isPhoneCheckId").val("${user.isPhoneCheck}");
	});
	function selectAllRecord() {
		for ( var i = 0; i < document.getElementsByName("_chk").length; i++) {
			document.getElementsByName("_chk")[i].checked = document
					.getElementById("_chkall").checked;
		}
	}
	function openPhoneCheck() {
		var chk = $("[name=_chk]");
		var flag = false;
		for ( var i = 0; i < chk.length; i++) {
			if (chk[i].checked) {
				flag = true;
				break;
			}
		}
		if (flag) {
			if (confirm('确定要开启短信验证' + '?')) {
				$("#queryForm")[0].action = "userListAction!openPhoneCheck.do";
				$("#queryForm")[0].submit();
			}
		} else {
			alert('请选择用户');
			return false;
		}

	}
	function closePhoneCheck() {
		var chk = $("[name=_chk]");
		var flag = false;
		for ( var i = 0; i < chk.length; i++) {
			if (chk[i].checked) {
				flag = true;
				break;
			}
		}
		if (flag) {
			if (confirm('确定要关闭短信验证' + '?')) {
				$("#queryForm")[0].action = "userListAction!closePhoneCheck.do";
				$("#queryForm")[0].submit();
			}
		} else {
			alert('请选择用户');
			return false;
		}

	}
	function disEnableUser(id, batch) {
		var url = "userListAction!delete.do";
		if (batch == "0") {
			url = url + "?batch=0&id=" + id;
			if (confirm('确定要锁定用户' + '?')) {
				$("#queryForm")[0].action = url;
				$("#queryForm")[0].submit();
			}
		} else {
			var chk = $("[name=_chk]");
			var flag = false;
			for ( var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					flag = true;
					break;
				}
			}
			if (flag) {
				if (confirm('确定要锁定用户' + '?')) {
					$("#queryForm")[0].action = url;
					$("#queryForm")[0].submit();
				}
			} else {
				alert('请选择用户');
				return false;
			}
		}

	}
	function enableUser(id, batch) {
		var url = "userListAction!userEnabledAgain.do";
		if (batch == "0") {
			url = url + "?batch=0&id=" + id;
			if (confirm('确定要激活用户' + '?')) {
				$("#queryForm")[0].action = url;
				$("#queryForm")[0].submit();
			}
		} else {
			var chk = $("[name=_chk]");
			var flag = false;
			for ( var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					flag = true;
					break;
				}
			}
			if (flag) {
				if (confirm('确定要激活用户' + '?')) {
					$("#queryForm")[0].action = url;
					$("#queryForm")[0].submit();
				}
			} else {
				alert('请选择用户');
				return false;
			}
		}

	}

	function openDiv() {
		$("#parDiv")
				.dialog(
						{
							autoOpen : true,
							modal : true,
							height : 380,
							title : '请选择地市',
							width : 120,
							position : [ 284, 46 ],
							buttons : {

								"确定" : function() {
									var cityId = "";
									var cityName = "";
									objName = document
											.getElementsByName("cityId");
									var mark = true;
									for (i = 0; i < objName.length; i++) {
										if (objName[i].type == "checkbox"
												&& objName[i].checked) {
											var test = objName[i].nextSibling.nextSibling.innerText;

											if (mark) {
												cityName = cityName
														+ objName[i].nextSibling.nextSibling.innerText;
												cityId = cityId
														+ objName[i].value;
												mark = false;
											} else {
												cityName = cityName
														+ '+'
														+ objName[i].nextSibling.nextSibling.innerText;
												cityId = cityId + ','
														+ objName[i].value;
											}
										}
									}
									$("#city").val(cityId);
									$("#cityName").val(cityName);
									$('#parDiv').dialog('close');
								}
							}
						});
	}

	function openChannelDiv() {
		$("#parChannelDiv")
				.dialog(
						{
							autoOpen : true,
							modal : true,
							height : 200,
							title : '请选择渠道',
							width : 520,
							position : [ 284, 72 ],
							buttons : {

								"确定" : function() {

									var channelId = "";
									var channelName = "";
									objName = document
											.getElementsByName("channelbox");
									var mark = true;
									for (i = 0; i < objName.length; i++) {
										if (objName[i].type == "checkbox"
												&& objName[i].checked) {
											if (mark) {
												channelName = channelName
														+ objName[i].nextSibling.nextSibling.innerText;
												channelId = channelId
														+ objName[i].value;
												mark = false;
											} else {
												channelName = channelName
														+ '+'
														+ objName[i].nextSibling.nextSibling.innerText;
												channelId = channelId + ','
														+ objName[i].value;
											}
										}
									}
									$("#channelId").val(channelId);
									$("#channelName").val(channelName);
									$('#parChannelDiv').dialog('close');
								},
								"全选" : function() {
									objName = document
											.getElementsByName("channelbox");
									for (i = 0; i < objName.length; i++) {
										objName[i].checked = true;
									}
								},
								"取消" : function() {
									objName = document
											.getElementsByName("channelbox");
									for (i = 0; i < objName.length; i++) {
										objName[i].checked = false;
									}
									$("#channelId").val("");
									$("#channelName").val("");
									$('#parChannelDiv').dialog('close');
								}
							}
						});
	}

	function openRoleDiv() {
		$("#parRoleDiv")
				.dialog(
						{
							autoOpen : true,
							modal : true,
							height : 300,
							title : '请选择角色',
							width : 550,
							position : [ 284, 100 ],
							buttons : {

								"确定" : function() {
									var roleId = "";
									var roleName = "";
									objName = document
											.getElementsByName("rolebox");
									var mark = true;
									for (i = 0; i < objName.length; i++) {
										if (objName[i].type == "checkbox"
												&& objName[i].checked) {
											if (mark) {
												roleName = roleName
														+ objName[i].nextSibling.nextSibling.innerText;
												roleId = roleId
														+ objName[i].value;
												mark = false;
											} else {
												roleName = roleName
														+ '+'
														+ objName[i].nextSibling.nextSibling.innerText;
												roleId = roleId + ','
														+ objName[i].value;
											}
										}
									}
									$("#roleId").val(roleId);
									$("#roleName").val(roleName);
									$('#parRoleDiv').dialog('close');
								},
								"全选" : function() {
									objName = document
											.getElementsByName("rolebox");
									for (i = 0; i < objName.length; i++) {
										objName[i].checked = true;
									}
								},
								"取消" : function() {
									objName = document
											.getElementsByName("rolebox");
									for (i = 0; i < objName.length; i++) {
										objName[i].checked = false;
									}
									$("#roleId").val("");
									$("#roleName").val("");
									$('#parRoleDiv').dialog('close');

								}
							}
						});
	}

</script>
</head>
<body>
	<s:form name="queryForm" id="queryForm" action="userListAction"
		method="post" cssStyle="margin: 0 0 0 0;">
		<div class="search">
			<h3>
				<fmt:message key="query.condition" />
			</h3>
			<table>
				<tr>
					<td><fmt:message key="user.fullname" />
					</td>
					<td><s:textfield name="user.fullname"></s:textfield>
					</td>
					<td><fmt:message key="field.cityName" />
					</td>
					<td><s:textfield id="cityName" name="user.cityName" size="40" cssClass="blueBorder"
							onclick="openDiv();"></s:textfield> <s:hidden
							name="user.citySysID" id="city"></s:hidden></td>
												<td>更新时间</td>
					<td>
						<input type="text" class="Wdate" value="${user.updateTimeStart}" name="user.updateTimeStart"  
						onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"/>
					</td>
					<td><fmt:message key="label.date.to"/></td>
					<td>
					     <input type="text" class="Wdate" value="${user.updateTimeEnd}" name="user.updateTimeEnd"  
						onclick="WdatePicker({endDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"/>
                    </td>
				
				</tr>
			
				<tr>

					<td><fmt:message key="user.enabled" />
					</td>
					<td><select name="user.status" id="statusId">
							<option value="">
								<fmt:message key='label.please.choice' />
							</option>
							<option value="1" selected="selected">
								<fmt:message key='label.isenable' />
							</option>
							<option value="0">
								<fmt:message key='label.noenable' />
							</option>
					</select></td>
					<td><fmt:message key="field.channel" />
					</td>
					<td>
						<s:textfield id="channelName" name="user.channelName" size="40" cssClass="blueBorder"
							onclick="openChannelDiv();"></s:textfield> <s:hidden
							name="user.channel" id="channelId"></s:hidden></td>
							
																<td>最近登录时间</td>
					<td>
						<input type="text" class="Wdate" value="${user.loginTimeStart}" name="user.loginTimeStart"  
						onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"/>
					</td>
					<td><fmt:message key="label.date.to"/></td>
					<td>
					     <input type="text" class="Wdate" value="${user.loginTimeEnd}" name="user.loginTimeEnd"  
						onclick="WdatePicker({endDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"/>
                    </td>
					
					
		
				</tr>
				<tr>
					<td><fmt:message key="user.comp" />
					</td>
					<td><s:select list="allCompList" listKey="id" listValue="name"
							name="user.compId" headerKey=""
							headerValue="%{getText('label.please.choice')}" /></td>

					<td><fmt:message key="user.role" />
					</td>
					<td>

						<s:textfield id="roleName" name="user.roleMark" size="40" cssClass="blueBorder"
							onclick="openRoleDiv();"></s:textfield> <s:hidden name="roleId"
							id="roleId"></s:hidden></td>
														<td>创建时间</td>
					<td>
						<input type="text" class="Wdate" value="${user.createTimeStart}" name="user.createTimeStart"  
						onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"/>
					</td>
					<td><fmt:message key="label.date.to"/></td>
					<td>
					     <input type="text" class="Wdate" value="${user.createTimeEnd}" name="user.createTimeEnd"  
						onclick="WdatePicker({endDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"/>
                    </td>
					
				</tr>
				
				<tr>
						<td><fmt:message key="user.type" />
					</td>
					<td><s:select list="allUserTypeList" listKey="id"
							listValue="eleName" name="user.userType.id" headerKey=""
							headerValue="%{getText('label.please.choice')}" /></td>
							
	                <td><fmt:message key="field.lastUpdatedBy"/></td>
	                <td><s:textfield name="user.lastUpdatedBy" ></s:textfield></td>
	                <td><fmt:message key="user.isPhoneCheck" />
					</td>
					
					<td><select name="user.isPhoneCheck" id="isPhoneCheckId">
							<option value="">
								<fmt:message key='label.please.choice' />
							</option>
							<option value="1" selected="selected">
								<fmt:message key='label.isenable' />
							</option>
							<option value="0">
								<fmt:message key='label.noenable' />
							</option>
					</select></td>
	                <td><fmt:message key="user.username" />
					</td>
					<td><s:textarea name="username" cols="22" rows="4"></s:textarea>
					</td>
                    
				    <td><s:submit key="button.search" cssClass="btn_search" method="queryPage" /></td>
				</tr>


			</table>
		</div>
		<div class="searchBottomLine1"></div>
		<div class="ListTitle">
			<table>
				<tr>
					<td><input type="button" value="开启短信验证" class="btn_start"
						onclick="openPhoneCheck();" />
					</td>
					<td><input type="button" value="关闭短信验证" class="btn_close"
						onclick="closePhoneCheck();" />
					</td>
					<td><input type="button" value="激活用户" class="btn_start"
						onclick="enableUser();" />
					</td>
					<td><input type="button" value="锁定用户" class="btn_close"
						onclick="disEnableUser();" />
					</td>
					<td><s:submit align="center" key="user.button.add"
							method="add" cssClass="btn_add" />
					</td>
					<td><s:submit align="center" value="批量添加" method="bassAdd"
							cssClass="btn_add" />
					</td>
					<td><input value="<s:text name="button.setview"/>"
						type="button" onclick="popColumnList(1);" class="btn_Set">
					</td>
				</tr>
			</table>
		</div>
		<%@ include file="/common/columnlist.jsp"%>


		<display:table name="resultList" cellspacing="0" cellpadding="0"
			decorator="checkboxDecorator" requestURI="userListAction.do"
			partialList="true" size="totalRows" id="resultList"
			pagesize="${pageSize}" class="its" export="true">
			<display:column property="checkbox" media="html"
				title="<input type='checkbox' name='_chkall' id='_chkall' onclick='selectAllRecord();' />" />
			<c:forEach var="cl" items="${collist}">
				<c:if test="${cl.status=='A'}">
					<display:column property="${cl.property}" media="html excel csv"
						titleKey="${cl.titleKey}" decorator="${cl.decorator}"
						format="${cl.format}" />
				</c:if>
			</c:forEach>
			<display:column titleKey="query.list.title" media="html"
				autolink="false">

				<c:if test="${resultList.status=='1' }">
					<a href="userDataAction.do?id=${resultList.id}"><fmt:message
							key="button.edit" />
					</a>
					<a href="javascript:void(0);"
						onclick="disEnableUser('${resultList.id}','0');"><fmt:message
							key="button.disenable" />
					</a>
				</c:if>
				<c:if test="${resultList.status=='0' }">
					<a href="javascript:void(0);"
						onclick="enableUser('${resultList.id}','0');"><fmt:message
							key="button.enabled" />
					</a>
				</c:if>
			</display:column>
		</display:table>

		<div id="parDiv" style="width: 60px; margin: 0 auto; display: none;">
			<div style="width: 70px; margin: 0 auto;">
				<s:checkboxlist list="allCityList" id="cityId" name="cityId"
					listKey="eleCode" listValue="eleName" />
			</div>
		</div>
		<div id="parChannelDiv" style="margin: 0 0; display: none;">
			<s:checkboxlist list="allChannelList" id="channelbox"
				name="channelbox" listKey="eleCode" listValue="eleName"
				templateDir="template" theme="simple" template="checkboxlistc.ftl" />
		</div>

		<div id="parRoleDiv" style="margin: 0 0; display: none;">
			<s:checkboxlist list="allRoleList" id="rolebox" name="rolebox"
				listKey="roleId" listValue="name" templateDir="template"
				theme="simple" template="checkboxlistc.ftl" />
		</div>

	</s:form>


</body>