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
				if ( user.getAuthList().contains( resource ) ) {
					status = AUTH_AUTHORIZED;
				}
			}
		}
		return status;
	}

	
	
}
