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
		request.getRequestDispatcher("AddArticle").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

	}

}
