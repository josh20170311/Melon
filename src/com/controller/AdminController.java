package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import com.beans.*;
import com.model.*;


public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		System.out.println("session" + request.getSession().getAttribute("session"));
		if (request.getSession().getAttribute("admin") == null) {
			request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);
			 
		} else {
			doPost(request, response);
		}
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		if(page == null)
			page = "index";
		String id;
		Product p;
		
		switch(page) {
			case "admin-login-form":
				String username = request.getParameter("username");
				String password = request.getParameter("password");

				if (username.equals("admin") && password.equals("admin@1234")) {
					request.getSession().setAttribute("admin", "admin");
					request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);

				} else {
					request.setAttribute("msg", "Invalid Crediantials");
					request.setAttribute("username", username);
					request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);

				}
				break;
			case "delete":
				id = request.getParameter("id");

				try {
					new ProductDAO().deleteProduct(id);
				} catch (SQLException e) {
					e.printStackTrace();
				}


				request.setAttribute("message", "Product deleted successfully");
				request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);
				break;
			case "index":
				System.out.println("index");
				//request.getSession().invalidate();
				request.getRequestDispatcher("WEB-INF/jsp/admin/index.jsp").forward(request, response);
				//response.sendRedirect("Home");
				break;
			case "addproduct":
				request.getRequestDispatcher("/WEB-INF/jsp/admin/addProduct.jsp").forward(request, response);
				break;
			case "edit":
				id = request.getParameter("id");

				
				try {
					p = new ProductDAO().getProduct(id);
					request.setAttribute("p", p);
				} catch (SQLException e) {
					e.printStackTrace();
				}

				request.getRequestDispatcher("/WEB-INF/jsp/admin/editProduct.jsp").forward(request, response);
				break;
			case "edit_product":
				try {
							id = request.getParameter("id");
					String name = request.getParameter("name");
					String model = request.getParameter("model");
					int	   price = Integer.parseInt(request.getParameter("price"));
					String manuf = request.getParameter("manufacturer");
					String system = request.getParameter("system");
					String image = new ProductDAO().getProduct(id).getImage();
					String screen = request.getParameter("screen");
					String storage = request.getParameter("storage");
					 p = new Product(id, name, model, price, manuf, system, image, screen, storage);
					System.out.println(p);
					new ProductDAO().updateProduct(p);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("message", "Product details updated successfully");
				request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);
				break;
			case "addingProduct":
				 id = new Date().getTime()+"";//timestamp
				String name = request.getParameter("name");
				String model = request.getParameter("model");
				int    price = Integer.parseInt(request.getParameter("price"));
				String manuf = request.getParameter("manufacturer");
				String system = request.getParameter("system");
				String image = request.getParameter("image");
				String screen = request.getParameter("screen");
				String storage = request.getParameter("storage");
				 p = new Product(id, name, model, price, manuf, system, image, screen, storage);
				System.out.println("add product");
				System.out.println(p);
				try {
					new ProductDAO().addProduct(p);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("message", "Product added Successfully");
				request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);
				break;
			case "articles":
				try {
					if(request.getParameter("action") != null && request.getParameter("action").equals("audit"))
						new ArticleDAO().setAudited(request.getParameter("id"), !new ArticleDAO().getArticle(request.getParameter("id")).getAudited());

					ArrayList<Article> list = new ArticleDAO().getAllArticleInfos();
					id = (request.getParameter("id") == null)?id=list.get(0).getId():request.getParameter("id");
					Article a = new ArticleDAO().getArticle(id);
					request.setAttribute("list",list);
					request.setAttribute("article", a);
					request.getRequestDispatcher("/WEB-INF/jsp/admin/articles.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
		}
	}

}
