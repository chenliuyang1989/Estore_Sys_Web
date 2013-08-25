<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>

<div id="setup"
	style="display: none; border: 1px solid #000000; position: absolute; background-color: #ffffff; padding: 8px; right:5px;">
	<div style="overflow-y:auto;max-height:200px;">
		<c:forEach var="cl" items="${collist}">
			<c:if test="${cl.status=='A'}">
				<input type="checkbox" name="columnlist" value="${cl.property}"
					checked="checked">
			</c:if>		
			<c:if test="${cl.status=='B'}">
				<input type="checkbox" name="columnlist" value="${cl.property}">
			</c:if>
			<fmt:message key="${cl.titleKey}" />
			<br>
		</c:forEach>
	</div>
	<input type="button" value="<fmt:message key='button.save' />" onclick="checkColumnList();" /> 
	<input type="button" value="<fmt:message key='button.cancel' />" onclick="popColumnList(0);" /> <input
	type="hidden" value="${currentUrl}" id="actionValue"> <input
	type="hidden" value="${readonly}" id="readonly"></div>

<script type="text/javascript">
	function mousePos(e)
	{ 
		var e=e||window.event;
		return {x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop};
	}
	function checkColumnList()
	{
		var el=document.getElementsByName("columnlist");
		var count=0;
		for(var i=0;i<el.length;i++)
		{
			if(el[i].checked)
				count++;
		}
		if(count==0)
		{
			alert("Please Select");
			return false;
		}
		var actionValue=document.getElementById("actionValue").value;
		var queryForm=document.getElementsByName("queryForm")[0];
		if(actionValue=="init")
			queryForm.submit();
		else if(actionValue=="query")
		{
			queryForm.submit();
			/*
			var inputlist=document.getElementsByTagName("input");
			for(var i=0;i<inputlist.length;i++)
				if(inputlist[i].type=="submit" && inputlist[i].name.indexOf("method:queryPage")!=-1)
				{
					inputlist[i].click();
					break;
				}*/
		}
		return true;
	}
	function popColumnList(type)
	{
		var coldiv=document.getElementById("setup");
		if(type==1 && coldiv.style["display"]=="none")
		{
			coldiv.style["display"]="inline";
			var pos=mousePos();
			coldiv.style["left"]=pos.x-'100'+"px";
			coldiv.style["top"]=pos.y+"px";
		}
		else
			coldiv.style["display"]="none";
  }
</script>