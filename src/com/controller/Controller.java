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
import java.util.Date;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Product> list = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		if (page == null || page.equals("index")) {


			try {
				list = new ProductDAO().fetchProduct();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			session.setAttribute("list", list);

			request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
		} else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		if (page.equals("login")) {
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);

		} else if (page.equals("sign-up")) {
			request.getRequestDispatcher("WEB-INF/jsp/member/signup.jsp").forward(request, response);

		} else if (page.equals("sign-up-form")) {
			doSignUpForm(request, response);// 副程式

		} else if (page.equals("login-form")) {
			doLoginForm(request, response);// 副程式

		} else if (page.equals("logout")) {
			session = request.getSession();
			session.invalidate();

			session = request.getSession();
			cartlist.clear();
			session.setAttribute("cartlist", cartlist);
			session.setAttribute("list", list);

			request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
		} else if (page.equals("mobiles") || page.equals("laptops") || page.equals("clothing")
				|| page.equals("home-decor") || page.equals("all-products")) {

			try {
				list = new ProductDAO().fetchProduct();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("list", list);

			if (page.equals("mobiles"))
				request.getRequestDispatcher("WEB-INF/jsp/member/mobiles.jsp").forward(request, response);
			if (page.equals("laptops"))
				request.getRequestDispatcher("WEB-INF/jsp/member/laptops.jsp").forward(request, response);
			if (page.equals("clothing"))
				request.getRequestDispatcher("WEB-INF/jsp/member/clothing.jsp").forward(request, response);
			if (page.equals("home-decor"))
				request.getRequestDispatcher("WEB-INF/jsp/member/home-decor.jsp").forward(request, response);
			if (page.equals("all-products"))
				request.getRequestDispatcher("WEB-INF/jsp/member/all-products.jsp").forward(request, response);
		} else if (page.equals("showcart")) {
			request.getRequestDispatcher("WEB-INF/jsp/member/cart.jsp").forward(request, response);
		} else if (page.equals("addtocart")) {
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
			if (action.equals("allproducts"))
				request.getRequestDispatcher("WEB-INF/jsp/member/all-products.jsp").forward(request, response);
			if (action.equals("clothing"))
				request.getRequestDispatcher("WEB-INF/jsp/member/clothing.jsp").forward(request, response);
			if (action.equals("home-decor"))
				request.getRequestDispatcher("WEB-INF/jsp/member/home-decor.jsp").forward(request, response);
			if (action.equals("laptops"))
				request.getRequestDispatcher("WEB-INF/jsp/member/laptops.jsp").forward(request, response);
			if (action.equals("mobiles"))
				request.getRequestDispatcher("WEB-INF/jsp/member/mobiles.jsp").forward(request, response);
		} else if (page.equals("success")) {

			request.getRequestDispatcher("WEB-INF/jsp/member/success.jsp").forward(request, response);

			/*
			 * session = request.getSession(); cartlist.clear();
			 * session.setAttribute("cartlist", cartlist);
			 */
		} else if (page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist, id);

			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("WEB-INF/jsp/member/cart.jsp").forward(request, response);
		} else if (page.equals("price-sort")) {
			String price = request.getParameter("sort");
			String action = request.getParameter("action");
			Product p = new Product();
			if (price.equals("low-to-high"))
				list = p.lowtohigh(list);
			else
				list = p.hightolow(list);

			session.setAttribute("list", list);

			if (action.equals("index"))
				request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
			if (action.equals("all-products"))
				request.getRequestDispatcher("WEB-INF/jsp/member/all-products.jsp").forward(request, response);
			if (action.equals("mobiles"))
				request.getRequestDispatcher("WEB-INF/jsp/member/mobiles.jsp").forward(request, response);
			if (action.equals("laptops"))
				request.getRequestDispatcher("WEB-INF/jsp/member/laptops.jsp").forward(request, response);
			if (action.equals("clothing"))
				request.getRequestDispatcher("WEB-INF/jsp/member/clothing.jsp").forward(request, response);
			if (action.equals("home-decor"))
				request.getRequestDispatcher("WEB-INF/jsp/member/home-decor.jsp").forward(request, response);
		} else if (page.equals("articles")) {

			int id = -1;
			try {
				ArticleDAO articleDAO  = new ArticleDAO();

				ArrayList<Article> titleList = articleDAO.fetchArticleInfos();

				if (request.getParameter("articleid") != null) {
					id = Integer.parseInt(request.getParameter("articleid"));
				} else {
					id = titleList.get(0).getId();// get articleId
				}

				Article a = articleDAO.getArticle(id);

				request.setAttribute("article", a);
				request.setAttribute("titleList", titleList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("WEB-INF/jsp/member/articles.jsp").forward(request, response);

		} else if (page.equals("myarticles")) {
			request.getRequestDispatcher("WEB-INF/jsp/member/myarticles.jsp").forward(request, response);
		} else if (page.equals("addarticle")) {
			if ("POST".equals(request.getMethod())) {
				System.out.println((int) (request.getSession().getAttribute("userId")));
				System.out.println((request.getParameter("productId")));

				try {
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					System.out.println(title + "\t" + content);

					new ArticleDAO().addArticle(
							new Article(title, content, new Date(), (int) (request.getSession().getAttribute("userId")),
									Integer.parseInt(request.getParameter("productId"))));
					request.getRequestDispatcher("WEB-INF/jsp/member/articles.jsp").forward(request, response);

				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				request.getRequestDispatcher("WEB-INF/jsp/member/addArticle.jsp").forward(request, response);
			}
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
				// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
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
			request.getRequestDispatcher("WEB-INF/jsp/member/index.jsp").forward(request, response);
		} else {//
			request.setAttribute("msg", "Invalid Crediantials");
			request.setAttribute("username", username);
			request.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(request, response);
		}

	}
}
