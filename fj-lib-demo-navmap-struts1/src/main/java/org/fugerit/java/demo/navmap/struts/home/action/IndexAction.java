package org.fugerit.java.demo.navmap.struts.home.action;

import java.util.Arrays;
import java.util.Collection;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IndexAction extends Action {

	private static final Logger logger= LoggerFactory.getLogger(IndexAction.class);
	
	private static String[] USERS = {
		"admin", "profile_1", "profile_2", "profile_3", 
	};
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forwardName = StrutsConstants.STANDARD_FORWARD_SUCCESS;
		String userType = request.getParameter( "userType" );
		if ( userType == null ) {
			userType = "1";
		}
		String type = USERS[ Integer.parseInt( userType ) ];
		AuthUser user = new AuthUser( userType , type );
		NavMap map = NavFacade.getNavMapFromContext( this.getServlet() );
		Collection<String> authList = map.getAuthMap().getDataList( type );
		logger.info( "user type : "+type+" - auth:"+authList );
		user.getAuthList().addAll( authList );
		AuthUserUtil.putUserInSession( user , request );
		request.setAttribute( "USERS" , Arrays.asList( USERS ) );
		return StrutsConstants.findForward( mapping , forwardName );
	}
	
}
