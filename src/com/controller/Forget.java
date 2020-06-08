package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.utilities.*;
import com.beans.*;

@WebServlet("/Forget")
public class Forget extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Forget() {
        super();

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.getRequestDispatcher("WEB-INF/jsp/member/forget.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		try {
			Member member = new MemberDAO().getMember(id);
			if(member.getEmail().equals(email)) {
				((GmailService)request.getServletContext().getAttribute("emailService")).forgetPasswordLink(member);
				
			}

			response.getWriter().append("link is already sent to  "+email);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
