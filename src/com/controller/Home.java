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
import com.utilities.Password;

public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Home() {
		super();
	}

	ArrayList<Product> productList = new ArrayList<>();
	ArrayList<String> manufList = new ArrayList<>();
	ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<String> amountlist = new ArrayList<>();
	ArrayList<Member> memberList = new ArrayList<>();

	HttpSession session; 

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
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
		session.setAttribute("amountlist", amountlist);
		session.setAttribute("list", productList);
		session.setAttribute("manuflist", manufList);

		
		String page = request.getParameter("page");
		System.out.println();
		System.out.println("in Home");
		System.out.println("page : "+page);
		if(page == null || page.equals("index")){
			request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
			return;
		}
		
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
				amountlist.clear();
				session.setAttribute("cartlist", cartlist);
				session.setAttribute("amountlist", amountlist);
				session.setAttribute("list", productList);
				request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
				break;
			case "showcart":
				request.getRequestDispatcher("WEB-INF/jsp/member/cart.jsp").forward(request, response);
				break;
			case "addtocart":
				String id = request.getParameter("id");
				String action = request.getParameter("action");
				Boolean check = false;
				
				if(cartlist.indexOf(id) == -1) {
					cartlist.add(id);
					amountlist.add("1");
				}else {
					check = true;
				}
				

				request.setAttribute("message", check?"Product is already added to Cart":"Product is successfully added to Cart");
	
				if (action.equals("index"))
					request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
				break;
			case "remove":
				String itemId = request.getParameter("id");
				
				int index = cartlist.indexOf(itemId);
				if(index != -1) {
					cartlist.remove(index);
					amountlist.remove(index);
				}


				request.getRequestDispatcher("WEB-INF/jsp/member/cart.jsp").forward(request, response);
				break;
			case "price-sort":
				String price = request.getParameter("sort");

				
				productList = price.equals("low-to-high")?Product.lowtohigh(productList):Product.hightolow(productList);


				session.setAttribute("list", productList);
				request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
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
			case "checkout":
				System.out.println(cartlist);
				System.out.println(amountlist);
				for(int i = 0 ; i < cartlist.size() ; i++) {
					amountlist.set(i, request.getParameter(cartlist.get(i)));
				}
				System.out.println(amountlist);
				request.getRequestDispatcher("WEB-INF/jsp/member/success.jsp").forward(request, response);
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
			session.setAttribute("member", m);
			request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
		} else {//
			request.setAttribute("msg", "Invalid Crediantials");
			request.setAttribute("id", id);
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);
		}

	}
}
