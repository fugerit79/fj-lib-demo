package org.fugerit.java.demo.navmap.struts;

import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * Library of constants to use with struts in this application.
 * 
 * @author Fugerit
 *
 */
public class StrutsConstants {

	/**
	 * Standard forward name for success
	 */
	public static final String STANDARD_FORWARD_SUCCESS = "success";
	
	/**
	 * Standard forward name for failure
	 */
	public static final String STANDARD_FORWARD_FAILURE = "failure";
	
	/**
	 * Delegate method (just in case you wanna add later some behaviour, like logging etc).
	 * 
	 * @param mapping		the mapping where to look
	 * @param forwardName	the forward name
	 * @return				the ActionForward or null
	 */
	public static ActionForward findForward( ActionMapping mapping, String forwardName ) {
		return mapping.findForward( forwardName );
	}
	
}
