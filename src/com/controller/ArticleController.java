package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.*;
import com.model.*;

public class ArticleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArticleController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {/*
		int id = -1;//articleId;
		
		try {
			ArticleDAO articleDAO = new ArticleDAO();
			ArrayList<Article> titleList = (request.getParameter("action").equals())
			id = (request.getParameter("id") == null) ? titleList.get(0).getId(): Integer.parseInt(request.getParameter("id"));
			Article a = articleDAO.getArticle(id);
			request.setAttribute("article", a);// 要顯示的文章
			request.setAttribute("titleList", titleList);// 要顯示的文章清單
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("WEB-INF/jsp/member/articles.jsp").forward(request, response);
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
