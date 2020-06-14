package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import com.beans.*;
import com.model.*;

@WebServlet("/MyOrders")
public class MyOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyOrders() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Member member = (Member)request.getSession().getAttribute("member");
		ArrayList<Order> orderlist = new OrderDAO().getOrders(member.getId());
		request.setAttribute("orderlist", orderlist);
		request.getRequestDispatcher("WEB-INF/jsp/member/myOrders.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
