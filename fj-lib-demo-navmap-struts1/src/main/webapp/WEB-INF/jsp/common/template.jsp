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
		<!-- main menu -->
		<c:set var="navMenuFun" scope="request" value="${navMenu1}"/>
		<jsp:include page="/WEB-INF/jsp/common/include/menu_fun.jsp"/>
		<!-- sec menu -->
		<c:set var="navMenuFun" scope="request" value="${navMenu2}"/>
		<jsp:include page="/WEB-INF/jsp/common/include/menu_fun.jsp"/>
		<!-- breadcrumb -->
		<div class="container" id="menu1">
			<bean:message key="menu.page.breadcrumb" bundle="menu" /> 
				<c:forEach items="${CurrentNavData.basicBreadCrumb}" var="bcItem">
					<c:choose>
						<c:when test="${bcItem.last}"><bean:message key="${bcItem.label}" bundle="menu" /></c:when>
						<c:otherwise><a href="${pageContext.request.contextPath}${bcItem.url}"><bean:message key="${bcItem.label}" bundle="menu" /></a> - </c:otherwise>
						</c:choose>
					</c:forEach>
		</div>
		<!-- page content -->
		<div class="container" id="content">
			<tiles:get name="content" />
		</div>
	</body>

</html>