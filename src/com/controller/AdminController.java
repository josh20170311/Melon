package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

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
		request.setCharacterEncoding("UTF-8");
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
			try {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String model = request.getParameter("model");
				String price = request.getParameter("price");
				String manuf = request.getParameter("manufacturer");
				String system = request.getParameter("system");
				String image = new ProductDAO().getProduct(id).getImage();
				String screen = request.getParameter("screen");
				String storage = request.getParameter("storage");
				Product p = new Product(id, name, model, price, manuf, system, image, screen, storage);
				System.out.println(p);
				new ProductDAO().updateProduct(p);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//JOptionPane.showMessageDialog(null, "Product details updated successfully", "Info",	JOptionPane.INFORMATION_MESSAGE);
			request.setAttribute("message", "Product details updated successfully");
			request.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(request, response);
		}

		if (page.equals("addingProduct")) {
			String id = new Date().getTime()+"";//timestamp
			String name = request.getParameter("name");
			String model = request.getParameter("model");
			String price = request.getParameter("price");
			String manuf = request.getParameter("manufacturer");
			String system = request.getParameter("system");
			String image = request.getParameter("image");
			String screen = request.getParameter("screen");
			String storage = request.getParameter("storage");
			Product p = new Product(id, name, model, price, manuf, system, image, screen, storage);

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
