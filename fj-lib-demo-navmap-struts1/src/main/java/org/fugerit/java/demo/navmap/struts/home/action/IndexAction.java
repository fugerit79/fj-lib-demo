package org.fugerit.java.demo.navmap.struts.home.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.fugerit.java.core.web.auth.model.AuthUser;
import org.fugerit.java.core.web.auth.model.AuthUserUtil;
import org.fugerit.java.core.web.navmap.model.NavMap;
import org.fugerit.java.core.web.navmap.servlet.NavFacade;
import org.fugerit.java.demo.navmap.struts.StrutsConstants;

public class IndexAction extends Action {

	private static String[] USERS = {
		"admim", "profile_1", "profile_2", "profile_3", 
	};
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forwardName = StrutsConstants.STANDARD_FORWARD_SUCCESS;
		String userType = request.getParameter( "userType" );
		if ( userType == null ) {
			userType = "1";
		}
		String type = USERS[ Integer.parseInt( userType ) ];
		AuthUser user = new AuthUser( type , type );
		NavMap map = NavFacade.getNavMapFromContext( this.getServlet() );
		user.getAuthList().addAll( map.getAuthMap().getDataList( type ) );
		AuthUserUtil.putUserInSession( user , request );
		return StrutsConstants.findForward( mapping , forwardName );
	}
	
}
