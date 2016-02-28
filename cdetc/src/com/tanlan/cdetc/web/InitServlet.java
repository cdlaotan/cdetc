package com.tanlan.cdetc.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.tanlan.cdetc.utils.AuthCodes;

public class InitServlet extends HttpServlet {

	public void init() throws ServletException {
		getServletContext().setAttribute("base",
				getServletContext().getContextPath());

		getServletContext().setAttribute("authcodes", AuthCodes.codes);
	}

}
