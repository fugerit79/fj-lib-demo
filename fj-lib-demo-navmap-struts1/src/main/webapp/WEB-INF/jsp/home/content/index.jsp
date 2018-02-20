<%@ page errorPage="/WEB-INF/jsp/common/error.jsp"%>
<%@ taglib uri="/struts/tiles" prefix="tiles"%>
<%@ taglib uri="/struts/bean" prefix="bean"%>
<%@ taglib uri="/struts/logic" prefix="logic"%>
<%@ taglib uri="/struts/html" prefix="html"%>
<%@ taglib uri="/fugerit/navmap" prefix="nav"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

Currently logged with profile : ${AuthUser.username}

<form action="#">
	Choose profile :
	<select name="userType">
		<% try { %>
		<c:forTokens items="0,1,2,3" delims="," var="current">
			${current}
		</c:forTokens>
		<% } catch (Throwable e) { e.printStackTrace(); } %>
	</select>
</form>