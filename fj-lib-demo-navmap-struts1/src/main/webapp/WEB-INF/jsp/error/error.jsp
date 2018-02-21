<%@ taglib uri="/struts/bean" prefix="bean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="statusErrorMessage" scope="request"><bean:message key="common.response.status.error"/></c:set>
<jsp:include page="/WEB-INF/jsp/common/error.jsp"/>