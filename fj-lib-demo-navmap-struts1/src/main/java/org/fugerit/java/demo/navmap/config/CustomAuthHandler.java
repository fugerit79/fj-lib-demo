package org.fugerit.java.demo.navmap.config;

import javax.servlet.http.HttpServletRequest;

import org.fugerit.java.core.web.auth.handler.BasicAuthHandler;
import org.fugerit.java.core.web.auth.model.AuthUser;
import org.fugerit.java.core.web.auth.model.AuthUserUtil;

public class CustomAuthHandler extends BasicAuthHandler {

	public static final String AUTH_ALLOW = "allow";
	
	@Override
	public int checkAuth(HttpServletRequest request, String resource) {
		int status = AUTH_FORBIDDEN;
		if ( AUTH_ALLOW.equalsIgnoreCase( resource ) ) {
			status = AUTH_AUTHORIZED;
		} else {
			AuthUser user = AuthUserUtil.lookForUser( request );
			if ( user != null ) {
				String[] res = resource.split( "," );
				for ( int k=0; k<res.length; k++ ) {
					if ( user.getAuthList().contains( res [k] ) ) {
						status = AUTH_AUTHORIZED;
					}
				}				
			}
		}
		return status;
	}

	
	
}
