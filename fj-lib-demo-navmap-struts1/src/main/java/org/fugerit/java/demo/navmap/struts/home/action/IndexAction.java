package org.fugerit.java.demo.navmap.struts.home.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.fugerit.java.demo.navmap.struts.StrutsConstants;

public class IndexAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forwardName = StrutsConstants.STANDARD_FORWARD_SUCCESS;
		return StrutsConstants.findForward( mapping , forwardName );
	}
	
}
