<%@ page errorPage="/WEB-INF/jsp/common/error.jsp"%>
<%@ taglib uri="/struts/tiles" prefix="tiles"%>
<%@ taglib uri="/struts/bean" prefix="bean"%>
<%@ taglib uri="/struts/logic" prefix="logic"%>
<%@ taglib uri="/struts/html" prefix="html"%>
<%@ taglib uri="/fugerit/navmap" prefix="nav"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<p><bean:message key="menu.home.index.loggedProfile" bundle="home"/> ${AuthUser.displayName}</p>

<form action="#">
	<bean:message key="menu.home.index.chooseProfile" bundle="home"/>
	<select name="userType">
		<c:forEach items="${USERS}" var="current" varStatus="status">
			<c:choose>
				<c:when test="${AuthUser.displayName eq current}"><c:set var="sel"> selected="selected" </c:set></c:when>
				<c:otherwise><c:set var="sel"></c:set></c:otherwise>
			</c:choose>
			<option value="${status.index}" ${sel}>${current}</option>
		</c:forEach>
	</select>
	<input type="submit" name="choose" value="GO"/>
</form>