<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="system.notice.titlevis" /></title>
	<meta name="heading" content="<fmt:message key="system.notice.titlevis"/>" />
	<script type="text/javascript" src="<c:url value='/scripts/goodsSupplyHand.js'/>"></script>
   	<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/scripts/jquery/jquery.autocomplete.css'/>" />
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.bgiframe.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.ajaxQueue.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/thickbox-compressed.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/jquery/jquery.autocomplete.js'/>"></script> 
	<script language="javascript" type="text/javascript" src="<c:url value='/scripts/My97DatePicker/WdatePicker.js'/>" ></script>
   	<script type="text/javascript">
	    function selectAllRecord() {
	        for(var i=0; i<document.getElementsByName("_chk").length; i++){
	        	document.getElementsByName("_chk")[i].checked = document.getElementById("_chkall").checked;
	        }
	    }
	    
		function chkd() {
			if(document.getElementById("startTime").value==''||document.getElementById("endTime").value=='') {
				alert('时间为空，请重新选取时间！');
				return false;
			}

			if(!checkDate(document.getElementById("startTime").value)||!checkDate(document.getElementById("endTime").value)) {
				alert('时间格式不正确，请重新选取时间！');
				return false;
			}
			return true;
		}
	    
	    function checkDate(str) {
	    	//匹配yyyy-MM-dd
	    	return /^((((1[6-9]|[2-9]\d)\d{2})-(0[13578]|1[02])-(0[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0[13456789]|1[012])-(0[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-02-(0[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-02-29))$/g.test(str);
	    }

		function opennotice(id) {
			//window.open('verNoticeAct!findVerNoticeShow.do?versionnotice.id='+id, 'showwindows', 'location=0,status=0,scrollbars=1,resizable=0,width=700,height=710,left=' + (screen.width/2-350) + ',top=' + (screen.height/2-400));
			window.showModelessDialog('verNoticeAct!findVerNoticeShow.do?versionnotice.id='+id,"a",
			"center:yes;scroll:auto;status:no;help:no;resizable:yes;dialogWidth:auto;dialogHeight:500px;"); 
		}
	    
	    
	</script>
	
</head>
<body>
<s:form name="queryForm" action="verNoticeAct" method="post">
	<div class="search"><h3><fmt:message key="query.condition" /></h3>
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td><strong><fmt:message key="system.notice.title" /></strong><font color="red"></font></td>
				<td><input type="text" id="note" name="versionnotice.note" value="${versionnotice.note }" /></td>
				<td><strong><fmt:message key="system.notice.priority" /></strong></td>
				<td><s:select list="priority" listKey="id" listValue="eleName" name="versionnotice.priority" cssStyle="width:130px" headerKey="-1" headerValue="全部" /></td>
				<td><strong><fmt:message key="system.notice.enabled" /></strong></td>
				<td>
					<s:select list="enabled" listKey="id" listValue="eleName" name="versionnotice.enabled" cssStyle="width:130px" headerKey="-1" headerValue="全部" />
				</td>
			</tr>
			<tr>
			<td><strong><fmt:message key="system.notice.noticetype" /></strong></td>
				<td><s:select list="sysNoticeTypeList" listKey="id" listValue="eleName" name="versionnotice.notetype" cssStyle="width:130px" headerKey="-1" headerValue="全部" /></td>
				<td><strong><fmt:message key="system.notice.displaybeg" /></strong></td>
				<td>
					<input type="text" class="Wdate" id="startTime" name="versionnotice.visibletime1" value="${versionnotice.visibletime1 }" onclick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,maxDate:'#F{$dp.$D(\'endTime\')||\'2020-10-01\'}'})"/>
				</td>
				<td><strong><fmt:message key="system.notice.displayend" /></strong></td>
				<td>
					<input type="text" class="Wdate" id="endTime" name="versionnotice.visibletime2" value="${versionnotice.visibletime2 }" onclick="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,minDate:'#F{$dp.$D(\'startTime\')}',maxDate:'2020-10-01'})"/>
				</td>
				<td><s:submit align="center" key="button.search" cssClass="btn_search" method="findVersionnotices" /></td>
			</tr>
		</table>
	</div>
	<div class="searchBottomLine1"></div>
	<div class="ListTitle"></div>
	<display:table name="resultList" cellspacing="0" cellpadding="0"
			requestURI="verNoticeAct!findVersionnotices.do" sort="external"
			partialList="true" size="totalRows" defaultsort="1" id="resultList"
			pagesize="${pageSize}" class="its" export="true">
	  	
	    <display:column titleKey="system.notice.title">
	    	<a href="javascript: opennotice(${resultList.id });">${resultList.note }</a>
	    </display:column>
	    <display:column property="visibletime" titleKey="system.notice.displaybeg" format="{0,date,yyyy-MM-dd HH:mm}" />
	    <display:column property="deadline" titleKey="system.notice.displayend" format="{0,date,yyyy-MM-dd HH:mm}" />
	    <display:column property="notetype" titleKey="system.notice.noticetype" />
	    <display:column titleKey="system.notice.priority">
	    	<c:if test="${resultList.priority==0 }">
	    		低
	    	</c:if>
	    	<c:if test="${resultList.priority==1 }">
	    		中
	    	</c:if>
	    	<c:if test="${resultList.priority==2 }">
	    		高
	    	</c:if>
	    </display:column>
	    <display:column titleKey="system.notice.enabled">
	    	<c:if test="${resultList.enabled==1 }">
	    		是
	    	</c:if>
	    	<c:if test="${resultList.enabled==0 }">
	    		否
	    	</c:if>
	    </display:column>
	    <display:column titleKey="querry.list.title">
	    	<a href="verNoticeAct!findVerNotice.do?versionnotice.id=${resultList.id }"><fmt:message key="querry.list.operation.edit" /></a>
	    </display:column>
	</display:table>
</s:form>
</body>