package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.beans.Product;
import com.model.*;

public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		if (page == null) {
			request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);
			
		} else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		
		if (page.equals("admin-login-form")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			if (username.equals("admin") && password.equals("admin@1234")) {
				request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);

			}
		}

		if (page.equals("delete")) {
			String id = request.getParameter("id");

			try {
				new ProductDAO().deleteProduct(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			//JOptionPane.showMessageDialog(null, "Product deleted successfully", "Info",	JOptionPane.INFORMATION_MESSAGE);
			request.setAttribute("message", "Product deleted successfully");
			request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);

		}

		if (page.equals("index")) {
			request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);
		}

		if (page.equals("addproduct")) {
			request.getRequestDispatcher("/WEB-INF/jsp/admin/addProduct.jsp").forward(request, response);
		}

		if (page.equals("edit")) {
			String id = request.getParameter("id");

			Product p = null;
			try {
				p = new ProductDAO().getProduct(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("p", p);
			request.getRequestDispatcher("/WEB-INF/jsp/admin/editProduct.jsp").forward(request, response);
		}

		if (page.equals("edit_product")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			Product p = new Product();
			p.setId(Integer.parseInt(id));
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);

			try {
				new ProductDAO().updateProduct(p);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//JOptionPane.showMessageDialog(null, "Product details updated successfully", "Info",	JOptionPane.INFORMATION_MESSAGE);
			request.setAttribute("message", "Product details updated successfully");
			request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);
		}

		if (page.equals("addingProduct")) {
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String image = request.getParameter("image");
			Product p = new Product();
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);
			p.setImage("img/" + image);

			try {
				new ProductDAO().addProduct(p);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//JOptionPane.showMessageDialog(null, "Product added Successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.setAttribute("message", "Product added Successfully");
			request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);
		}
	}

}
