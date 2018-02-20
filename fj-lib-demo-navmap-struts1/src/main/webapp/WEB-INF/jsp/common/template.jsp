<%@ page errorPage="/WEB-INF/jsp/common/error.jsp"%>
<%@ taglib uri="/struts/tiles" prefix="tiles"%>
<%@ taglib uri="/struts/bean" prefix="bean"%>
<%@ taglib uri="/struts/logic" prefix="logic"%>
<%@ taglib uri="/struts/html" prefix="html"%>
<%@ taglib uri="/fugerit/navmap" prefix="nav"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<nav:data id="CurrentNavData"/>
<c:set var="navMenu1" value="${CurrentNavData.navMenu1}" scope="request" />
<c:set var="navMenu2" value="${CurrentNavData.navMenu2}" scope="request" />

<c:choose>
	<c:when test="${CurrentNavData != null}"><c:set var="pageTitle"><bean:message key="${CurrentNavData.entry.label}" bundle="menu"/></c:set></c:when>
	<c:otherwise><c:set var="pageTitle"><bean:message key="menu.page.title.default" bundle="menu"/></c:set></c:otherwise>
</c:choose>
<html>

	<head>
		<title>A ${pageTitle}</title>
		<link type="text/css" rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/html/style/main.css">
	</head>
	
	<body>
		<div class="container" id="header">
			<h3>${pageTitle}</h3>
		</div>
		<c:if test="${navMenu1 != null && fn:length(navMenu1.entries) > 0}">
		<div class="container" id="menu1">
			<c:forEach items="${navMenu1.entries}" var="menu1item">
				<span class="menu1item"><bean:message key="${menu1item.label}"  bundle="menu"/></span>
			</c:forEach>
		</div>
		</c:if>
		<c:if test="${navMenu2 != null && fn:length(navMenu2.entries) > 0}">
		<div class="container" id="menu2">
			<c:forEach items="${navMenu2.entries}" var="menu2item">
				<span class="menu2item"><bean:message key="${menu1item.label}"  bundle="menu"/></span>
			</c:forEach>
		</div>				
		</c:if>
		<div class="container" id="content">
			<tiles:get name="content" />
		</div>
	</body>

</html>