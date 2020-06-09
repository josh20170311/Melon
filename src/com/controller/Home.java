package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.*;
import com.model.*;
import com.utilities.*;

public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Home() {
		super();
	}

	ArrayList<Product> productList = new ArrayList<>();
	ArrayList<String> manufList = new ArrayList<>();
	ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<Member> memberList = new ArrayList<>();

	HttpSession session; 

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		System.out.println();
		System.out.println("in Home");

		////test
		//GmailService g = (GmailService) getServletContext().getAttribute("emailService");
		//Member member = new Member();
		//member.setEmail("josh2013.880922@gmail.com");
		//member.setPassword("12345678");
		//g.validationLink(member);
		
		////
		
		
		String catalog = request.getParameter("catalog");
		try { 
			if(catalog == null ||catalog.equals("all"))
				productList = new ProductDAO().fetchProduct();
			else {
				productList = new ProductDAO().fetchProduct(catalog);
			}
			
			
			manufList = new ProductDAO().getManufList();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		session = request.getSession();

		session.setAttribute("cartlist", cartlist);
		session.setAttribute("list", productList);
		session.setAttribute("manuflist", manufList);

		
		
		if(page == null || page.equals("index")){
			request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);

			return;
		}
		System.out.println("page : "+page);
		switch(page) {
			case "login":
				request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);
				break;
			case "sign-up":
				request.getRequestDispatcher("WEB-INF/jsp/member/signup.jsp").forward(request, response);
				break;
			case "logout":
				session = request.getSession();
				session.invalidate();
				session = request.getSession();
				cartlist.clear();
				session.setAttribute("cartlist", cartlist);
				session.setAttribute("list", productList);
				request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
				break;
			case "showcart":
				request.getRequestDispatcher("WEB-INF/jsp/member/cart.jsp").forward(request, response);
				break;
			case "addtocart":
				String id = request.getParameter("id");
				String action = request.getParameter("action");
				Product p = new Product();
				boolean check = p.check(cartlist, id);
	
				if (check)
					request.setAttribute("message", "Product is 'already' added to Cart");
				else {
					cartlist.add(id);
					request.setAttribute("message", "Product successfully added to Cart");
				}
	
				if (action.equals("index"))
					request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
				break;
			case "price-sort":
				String price = request.getParameter("sort");

				if (price.equals("low-to-high"))
					productList = new Product().lowtohigh(productList);
				else
					productList = new Product().hightolow(productList);

				session.setAttribute("list", productList);
				request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
				break;
			case "remove":
				String itemId = request.getParameter("id");
				
				cartlist = new Product().remove(cartlist, itemId);

				session = request.getSession();
				session.setAttribute("cartlist", cartlist);
				request.getRequestDispatcher("WEB-INF/jsp/member/cart.jsp").forward(request, response);
				break;
			case "success":
				session = request.getSession();
				cartlist.clear();
				session.setAttribute("cartlist", cartlist );
				request.getRequestDispatcher("WEB-INF/jsp/member/success.jsp").forward(request, response);
				break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		
		switch(page) {
			case "sign-up-form":
				doSignUpForm(request, response);
				break;
			case "login-form":
				doLoginForm(request, response);
				break;
		}
	}

	private void doSignUpForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		String id 			= request.getParameter("id");
		String name 			= request.getParameter("name");
		String gender 		= request.getParameter("gender");
		String address 		= request.getParameter("address");
		String phone 		= request.getParameter("phone");
		String email 			= request.getParameter("email");
		String password_1 	= request.getParameter("password_1");
		String password_2 	= request.getParameter("password_2");

		if (password_1.equals(password_2)) {
			String[] temp = Password.hashPassword(password_1);
			String hashedP = temp[0];
			String salt = temp[1];
			
			Member member = new Member();
			member.setId(id);
			member.setName(name);
			member.setGender(gender);
			member.setAddress(address);
			member.setPhone(phone);
			member.setEmail(email);
			member.setPassword(hashedP);
			member.setSalt(salt);
			
			try {
				new MemberDAO().addMember(member);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			((GmailService)getServletContext().getAttribute("emailService")).validationLink(member);
			
			request.setAttribute("id", id);//要傳給login 預先填入帳號
			request.setAttribute("msg", "Account created successfully, Please Login!");
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);

		} else {
			request.setAttribute("msg", "The two passwords do not match");
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("gender", gender);
			request.setAttribute("address", address);
			request.setAttribute("phone", phone);
			request.setAttribute("email", email);//給signup預先填入
			request.getRequestDispatcher("WEB-INF/jsp/member/signup.jsp").forward(request, response);
		}

	}

	private void doLoginForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();
		System.out.println("in doLoginForm");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		if(new MemberDAO().isFrozed(id)) {
			request.setAttribute("msg", "Your Account has been Frozed");
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);
			return;
		}

		MemberDAO memberDAO = new MemberDAO();

		boolean status = false;
		try {
			status = memberDAO.checkMember(id, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (status) {//
			session = request.getSession();
			session.setAttribute("session", session);
			
			Member m = new Member();
			try {
				m = memberDAO.getMember(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("address", m.getAddress());
			session.setAttribute("email", 	m.getEmail());
			session.setAttribute("name", 	m.getName());
			session.setAttribute("memberId", 		id);
			request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
		} else {//
			new MemberDAO().countError(id);
			request.setAttribute("msg", "Invalid Crediantials");
			request.setAttribute("id", id);
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);
		}

	}
}
