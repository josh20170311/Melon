package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Article;
import com.model.ArticleDAO;

public class AddArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddArticle() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/jsp/member/addArticle.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try { 
			String title = request.getParameter("title"); 
			String content = request.getParameter("content");
			Date uploadTime = new Date();
			
			HttpSession session = request.getSession();
			session = (HttpSession)session.getAttribute("session");
			String memberId = session.getAttribute("memberId").toString();
			String productId = request.getParameter("productId");
			
			Article a = new Article();
			
			a.setId("A"+new Date().getTime());
			a.setTitle(title);
			a.setContent(content);
			a.setUploadTime(uploadTime);
			a.setMemberId(memberId);
			a.setProductId(productId);
			
			new ArticleDAO().addArticle(a);
			request.getRequestDispatcher("MyArticles").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
