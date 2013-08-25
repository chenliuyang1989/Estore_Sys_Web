<%@ include file="/common/taglibs.jsp"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="com.gmcc.sso.TokenUtils"%>
<%@ page import="com.ibm.util.AppUtil"%>
<%@ page import="com.gmcc.service.AuthorityManager"%>
<%@ page import="com.gmcc.model.Authority"%>
<%@ page import="com.gmcc.util.SpringSecurityUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.security.ui.rememberme.TokenBasedRememberMeServices" %>
<%@ page import="com.gmcc.util.AppContentGmcc" %>
<%
if (request.getSession(false) != null) {
    session.invalidate();
}

AuthorityManager authorityManager = (AuthorityManager)AppUtil.getBean("authorityManager");
String userId=request.getParameter("defalutUser");
System.out.println("SpringSecurityUtils.getCurrentUserName()->"+userId);
List<Authority> appUserAuthorityList = authorityManager.getAllAppAuthoritys(userId);
HashMap<String, String> tempMap = new HashMap<String, String>();
for(Authority au : appUserAuthorityList){
	String appUrl = au.getMenuApp();
	appUrl = appUrl.substring(appUrl.lastIndexOf("/"));
	if(!tempMap.containsKey(appUrl)){
		Cookie cookie = new Cookie(TokenUtils.TOKEN_PARAMETER_KEY+"_"+userId, null);
    	cookie.setPath(appUrl);
    	cookie.setMaxAge(0);
    	response.addCookie(cookie);
    	
    	Cookie terminate = new Cookie(TokenBasedRememberMeServices.SPRING_SECURITY_REMEMBER_ME_COOKIE_KEY, null);
    	terminate.setPath(appUrl);
    	terminate.setMaxAge(0);
    	response.addCookie(terminate);
    	
    	//Cookie terminateCode = new Cookie(AppContentGmcc.COOKIE_VERIFICATIONCODE_NAME+"_"+userId, null);
    	//terminateCode.setPath(appUrl);
    	//terminateCode.setMaxAge(0);
    	//response.addCookie(terminateCode);
    	
    	//Cookie cookieYet = new Cookie("codeCheckYet_"+userId, null);
    	//cookieYet.setMaxAge(0);
    	//cookieYet.setPath(appUrl);
    	//response.addCookie(cookieYet);
    	
    	tempMap.put(appUrl, appUrl);
    	System.out.println("destroyed->"+appUrl);
	}
}
TokenUtils tu = new TokenUtils();
System.out.println("destroyed");
//System.out.println(request.getParameter("phoneCheck"));
//request.setAttribute("phoneCheck",request.getParameter("phoneCheck"));
%>

<c:redirect url="<%=tu.getParamsByCode(TokenUtils.TOKEN_LOGIN_URL).getValue() %>">
<c:if test="${param.phoneCheck eq 'false'}">
<c:param name="phoneCheck" value="${param.phoneCheck }" ></c:param>
</c:if>
</c:redirect>

