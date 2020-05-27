package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Date d = new Date();
			String memberId = request.getSession().getAttribute("userId").toString();
			int productId = Integer.parseInt(request.getParameter("productId"));
			
			new ArticleDAO().addArticle(new Article(title,
													content,
													new Date(),
													memberId,
													productId
													)
										);
			request.getRequestDispatcher("MyArticles").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
