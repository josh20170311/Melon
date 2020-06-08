package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.*;
import com.beans.*;
import com.utilities.*;

@WebServlet("/Reset")
public class Reset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public Reset() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String token = request.getParameter("token");
		if(email==null || id == null || token == null) {
			response.sendRedirect("Home");
			return;
		}
		try {
			
			
			Member member = new MemberDAO().getMember(id);
			
			if(member.getEmail().equals(email) && member.getPassword().equals(token)) {
				request.getRequestDispatcher("WEB-INF/jsp/member/reset.jsp").forward(request, response);
			}else{
				response.getWriter().append("invalid link<br> <a href='Home'>Home</a>");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String newPassword = request.getParameter("newPassword");
		String[] temp = Password.hashPassword(newPassword);
		String hashedPassword = temp[0];
		String salt = temp[1];
		new MemberDAO().resetPassword(id, hashedPassword, salt);
		response.sendRedirect("Home");
		
		
	}

}
