package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.*;
import com.beans.*;
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ProductController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		try {
			Product p = new ProductDAO().getProduct(id);
			request.setAttribute("product", p);
			request.getRequestDispatcher("/WEB-INF/jsp/member/productInfo.jsp").forward(request, response);
		} catch (Exception e) {

		}
		
		
	}

}
