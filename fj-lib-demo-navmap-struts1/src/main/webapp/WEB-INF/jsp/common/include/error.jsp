<%@ taglib uri="/struts/tiles" prefix="tiles"%>
<%@ taglib uri="/struts/bean" prefix="bean"%>
<%@ taglib uri="/struts/logic" prefix="logic"%>
<%@ taglib uri="/struts/html" prefix="html"%>
<%@ taglib uri="/fugerit/navmap" prefix="nav"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<% if ( response.getStatus() == 403 ) { %>
	<bean:message key="common.response.status.403"/>
<% } else if ( response.getStatus() == 404 ) { %>
	<bean:message key="common.response.status.404"/>
<% } else { %>
	<%= response.getStatus() %> - <bean:message key="common.response.status.500"/>
<% } %>

