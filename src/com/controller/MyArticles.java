package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyArticles extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyArticles() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = (HttpSession)request.getAttribute("session");
		if(session == null)
			request.getRequestDispatcher("/WEB-INF/jsp/member/login.jsp?action=myarticles").forward(request, response);

		request.getRequestDispatcher("/WEB-INF/jsp/member/myarticles.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
