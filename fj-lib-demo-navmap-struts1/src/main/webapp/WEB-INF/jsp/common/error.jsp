<%@ taglib uri="/struts/tiles" prefix="tiles"%>
<%@ taglib uri="/struts/bean" prefix="bean"%>
<%@ taglib uri="/struts/logic" prefix="logic"%>
<%@ taglib uri="/struts/html" prefix="html"%>
<%@ taglib uri="/fugerit/navmap" prefix="nav"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% try { %>
<nav:entry url="/WEB-INF/jsp/common/include/error.jsp" setCurrentEntry="1" id="errorEntry" toScope="page" />
<tiles:insert page="/WEB-INF/jsp/common/template.jsp" flush="true">
	<tiles:put name="content" value="/WEB-INF/jsp/common/include/error.jsp" />
</tiles:insert>
<% } catch (Exception e) {
	e.printStackTrace(); %>
<html>
	<head>
		<title>Error page</title>
	</head>
	<body>
		Status code : <%= response.getStatus() %>
	</body>
</html>
<% } %>
