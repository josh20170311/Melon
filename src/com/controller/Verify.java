package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import com.model.MemberDAO;

@WebServlet("/Verify")
public class Verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Verify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String token = request.getParameter("token");
		if(email != null && token != null)
			new MemberDAO().verify(email, token);
			PrintWriter out = response.getWriter();
			out.println("account is verified<br>");
			out.println("<a href='Home'>home</a>");
		response.sendRedirect("Home");
	}
}
