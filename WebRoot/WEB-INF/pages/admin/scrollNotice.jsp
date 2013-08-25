<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>

    <title><fmt:message key="system.notice.input"/></title>
   	<meta name="heading" content="<fmt:message key="system.notice.input"/>" /> 
   	<script type="text/javascript" src="<c:url value='/scripts/lhdialog/lhgcore.min.js'/>"></script>
   	<script type="text/javascript" src="<c:url value='/scripts/lhdialog/lhgdialog.js'/>"></script>
	<script type="text/javascript">
		function opennotice(id) {
			//window.open('verNoticeAct!findVerNoticeShow.do?versionnotice.id='+id, 'showwindows', 'location=0,status=0,scrollbars=1,resizable=0,width=700,height=710,left=' + (screen.width/2-350) + ',top=' + (screen.height/2-400));
			//window.showModelessDialog  window.showModalDialog
			//window.showModelessDialog('verNoticeAct!findVerNoticeShow.do?versionnotice.id='+id,"a",
				//	"center:yes;scroll:auto;status:no;help:yes;resizable:yes;dialogWidth:auto;dialogHeight:500px;");
			//J.dialog.get( id, { page: "verNoticeAct!findVerNoticeShow.do?versionnotice.id="+id } );
			//lhgdialog.opendlg('aa','verNoticeAct!findVerNoticeShow.do?versionnotice.id='+id);
			
			 var dg = new J.dialog({ id:id, autoSize:true,rang:true,iconTitle:false,btnBar:false,autoPos:true,resize:true,cover:true,
				  title:"系统通告", page: "${ctx}/admin/verNoticeAct!findVerNoticeShow.do?versionnotice.id="+id }); 
			 dg.ShowDialog(); 

		}
	</script>
	</head>
	<div align="center" style="margin-left: 5px;margin-top:5px;">
      <table cellspacing=0 cellpadding=0 width=260 align=center border=0>
        <tbody>
        	<s:iterator value="resultList" id="resultList" status="status" var="resu">
        	<s:if test="#status.index<4">
	        	<tr>
	            	<td height=30 align="left">
		            	<div style="overflow-x: hidden;white-space:nowrap;width:150px;padding: .5em 0em 0em 0em;">
		            		<a style="color: none" href="javascript: opennotice('${resu.id }');" style="border: none">${resu.note }</a>
		            	</div>
	            	</td>
	            	
	            	<td align="left">
	            		<div>
	            			<a style="color: none" href="javascript: opennotice('resu.id');" style="border: none"><fmt:formatDate value="${resu.deadline}" pattern="MM-dd"/></a>
	            		</div>
	            	</td>
	          	</tr>
	        </s:if>
         	</s:iterator>
        </tbody>
        
      </table>
      
    </div>
    <div style="margin-left: 220px;margin-top:5px">
    	<a  style="color: none" href="javascript:void(0);" 
    		onclick="window.parent.addNewTabForA('${ctx }/admin/verNoticeAct!findNotices.do','系统通告','true')" style="border: none">更多...</a>
    </div>
