
<% if (request.getAttribute("struts.valueStack") != null) { %>
<%-- ActionError Messages - usually set in Actions --%>
<s:if test="hasActionErrors()">
	<div  id="errorMessages" style="display:none"><s:iterator
		value="actionErrors">
		<s:property />
		<br />
	</s:iterator>
	</div>
	<script language="JavaScript"> 
	 		alert($("#errorMessages").text());
       </script> 
</s:if>

<%-- FieldError Messages - usually set by validation rules --%>
<s:if test="hasFieldErrors()">
	<div  id="errorMessages" style="display:none"><s:iterator
		value="fieldErrors">
		<s:iterator value="value">
			<s:property />
			<br />
		</s:iterator>
	</s:iterator></div>
	<script language="JavaScript"> 
	 		alert($("#errorMessages").text());
       </script> 
</s:if>
<% } %>

<%-- Messages - usually  --%>
<s:if test="hasActionMessages()">
	<div  id="actionMessages" style="display:none">		
		<s:actionmessage/>	
	</div>
	 <script language="JavaScript"> 
	 	alert($("#actionMessages").text());
       </script> 
 </s:if>

<%-- Success Messages --%>
<c:if test="${not empty messages}">
	<div  id="successMessages"><c:forEach var="msg"
		items="${messages}">
		
		<script>
			alert("${msg}");
		</script>
	</c:forEach></div>
	<c:remove var="messages" scope="session" />
</c:if>

<%-- Error Messages (on JSPs, not through Struts --%>
<c:if test="${not empty errors}">
	<div  id="errorMessages"><c:forEach var="error"
		items="${errors}">
		
		<script>
			alert("${error}");
		</script>
	</c:forEach></div>
	<c:remove var="errors" scope="session" />
</c:if>
<div style="display: block" id="validatErrorMessages"></div>