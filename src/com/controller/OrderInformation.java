package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.*;
import com.model.*;

import java.util.*;
/**
 * Servlet implementation class OrderInfomation
 */
@WebServlet("/OrderInformation")
public class OrderInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		ArrayList<OrderDetail> detailList = new OrderDAO().getDetails(id);
		Order order = new OrderDAO().getOrder(id);
		Member member = new Member();
		try {
			
		member = new MemberDAO().getMember(order.getMemberId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("Recipient", member.getName());
		request.setAttribute("ShippingAddress", member.getAddress());
		request.setAttribute("Phone", member.getPhone());
		request.setAttribute("TotalAmount", order.getTotalPrice());
		
		request.setAttribute("detailList", detailList);
		request.getRequestDispatcher("WEB-INF/jsp/member/orderInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
