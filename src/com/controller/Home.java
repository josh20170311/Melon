package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.beans.*;
import com.model.*;

public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Home() {
		super();
	}

	ArrayList<Product> productList = new ArrayList<>();
	ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();

	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		try {
			productList = new ProductDAO().fetchProduct();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		session = request.getSession();
		session.setAttribute("cartlist", cartlist);
		session.setAttribute("list", productList);

		
		String page = request.getParameter("page");
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
					JOptionPane.showMessageDialog(null, "Product is already added to Cart", "Info",
							JOptionPane.INFORMATION_MESSAGE);
				else {
					cartlist.add(id);
					JOptionPane.showMessageDialog(null, "Product successfully added to Cart", "Info",
							JOptionPane.INFORMATION_MESSAGE);
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
			case "success":
				request.getRequestDispatcher("WEB-INF/jsp/member/success.jsp").forward(request, response);
				break;
			case "remove":
				String id = request.getParameter("id");
				
				cartlist = new Product().remove(cartlist, id);

				session = request.getSession();
				session.setAttribute("cartlist", cartlist);
				request.getRequestDispatcher("WEB-INF/jsp/member/cart.jsp").forward(request, response);
				break;
		
		}
	}

	private void doSignUpForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String password_1 = request.getParameter("password_1");
		String password_2 = request.getParameter("password_2");

		if (password_1.equals(password_2)) {

			User user = new User();
			user.setAddress(address);
			user.setEmail(email);
			user.setName(name);
			user.setUsername(username);
			user.setPassword(password_1);

			try {
				new UserDAO().addUser(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("username", username);
			request.setAttribute("msg", "Account created successfully, Please Login!");
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);

		} else {
			request.setAttribute("msg", "The two passwords do not match");
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("email", email);
			request.setAttribute("username", username);
			request.getRequestDispatcher("WEB-INF/jsp/member/signup.jsp").forward(request, response);
		}

	}

	private void doLoginForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserDAO userDAO = new UserDAO();
		User user = new User();
		boolean status = false;
		try {
			status = userDAO.checkUser(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (status) {//
			session = request.getSession();
			session.setAttribute("session", session);

			try {
				userList = userDAO.fetchUser();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("address", user.fetchadd(userList, username));
			session.setAttribute("email", user.fetchemail(userList, username));
			session.setAttribute("name", user.fetchname(userList, username));
			session.setAttribute("userId", user.fetchid(userList, username));
			session.setAttribute("username", username);
			request.getRequestDispatcher("Home?page=index").forward(request, response);
		} else {//
			request.setAttribute("msg", "Invalid Crediantials");
			request.setAttribute("username", username);
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);
		}

	}
}
