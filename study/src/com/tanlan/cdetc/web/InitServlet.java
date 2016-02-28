package com.tanlan.cdetc.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;


public class InitServlet extends HttpServlet {

	public void init() throws ServletException {
		getServletContext().setAttribute("base",
				getServletContext().getContextPath());

	}

}
