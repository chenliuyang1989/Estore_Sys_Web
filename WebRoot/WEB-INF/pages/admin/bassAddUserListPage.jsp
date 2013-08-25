<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="userList.title"/></title>
    
   	<meta name="heading" content="<fmt:message key="userList.title"/>" /> 
<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
<script type="text/javascript" >
	function query(){
		
   		$("#div_wait_id").show();
   		$("#queryForm").submit();
   	}
	</script>
</head>
<body>

	<div class="title"><h3><fmt:message key="userData.title" /></h3>
		<table align="center">
		<tr>

			<td><s:submit align="center" key="button.back"
				onclick="window.location.href='userListAction.do';return false;"
				cssClass="btn_back" method="cancel" /></td>
		</tr>
		</table>
	</div>
<div class="content">
<s:form id="queryForm" name="queryForm" action="userExcelProcessAction!bassAddUser.do" method="post"  enctype="multipart/form-data">
<table cellspacing="1" cellpadding="0" border="0">
		<tr>
			<td class="desc" style="width:20%" ><strong>请选择上传文件：</strong></td>
			<td>  <s:file name="myFile" label ="Image File" theme="simple"/><input name="" value="导入" type="button" onclick="return query();" > </td>
		</tr>
		
		<tr>
		
		<td colspan="2">
		<div> &nbsp;</div>
		<div>
	<a href="userExcelProcessAction.do" class="down" style="color: red;text-decoration: none;">下载模版</a>
</div>

<div id="div_wait_id" style="z-index:2;display:none;position:absolute;border-style:solid;border-width:1px;border-color:#ffffff;width:100%;height:100%;filter:alpha(opacity=85);">
              <table border=0 bgcolor="#FFFFFF" style='width:100%; height:100%;  text-align:center;'>
                  <tr >  
                       <td height="100" vlign="center" >
                         <img id='meesageimg' src='${ctx}/images/loading.gif' border=0 />
                                                                      操作进行中,请稍后....
                       </td>
                   </tr>
               </table>
         </div>
<ul class="ul1">
<li>上传数据操作提示：</li>
<li class="C1">1、建议使用导入模板，并进行编辑、保存后上传至系统。 </li>
<li class="C1">2、导入模板文件格式为excel,请注意必填项标示,带*的列为必填列，请仔细检查后导入，避免导入失败。</li>
<li class="C1">3、下列项导入不能为空：用户密码，用户名，真实姓名，角色名称，联系电话，用户类型，否则会导致添加用户失败</li>
<li class="C1">4、是否激活项，默认为激活，不激活输入：0 是否短信验证，默认为不验证，验证需要输入：1</li>
<li class="C1">5、地市项默认为全省用户，渠道默认为全渠道</li>
<li class="C1">6、角色和机构为多个时，中间以中文"，"分开，如：埃瑞普移动仓库，EMS</li>
</ul>
		
		
		</td>
		</tr>
		
		
</table>

</s:form>


</div>


</body>