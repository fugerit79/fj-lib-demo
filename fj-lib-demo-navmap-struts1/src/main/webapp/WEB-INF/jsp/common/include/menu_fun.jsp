<%@ page errorPage="/WEB-INF/jsp/common/error.jsp"%>
<%@ taglib uri="/struts/tiles" prefix="tiles"%>
<%@ taglib uri="/struts/bean" prefix="bean"%>
<%@ taglib uri="/struts/logic" prefix="logic"%>
<%@ taglib uri="/struts/html" prefix="html"%>
<%@ taglib uri="/fugerit/navmap" prefix="nav"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
		
		<c:if test="${navMenuFun != null && fn:length(navMenuFun.entries) > 0}">
		<div class="container" id="menu1"> |
			<c:forEach items="${navMenuFun.entries}" var="menuItem">
				<nav:isBranch id="currentBranchCheck" branchUrl="${menuItem.url}" checkUrl="${CurrentNavData.entry.url}"/>
				<span class="menu1item">
					<c:choose>
						<c:when test="${currentBranchCheck}"><bean:message key="${menuItem.label}"  bundle="menu"/></c:when>
						<c:otherwise>
							<a class="menu1link" href="${menuItem.url}"><bean:message key="${menuItem.label}"  bundle="menu"/></a>
						</c:otherwise>
					</c:choose>
				</span> |
			</c:forEach>
		</div>
		</c:if>