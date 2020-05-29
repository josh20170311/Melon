package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import com.beans.*;
import com.model.*;

public class MyArticles extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyArticles() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = (HttpSession)request.getSession();
		session = (HttpSession)session.getAttribute("session");
		if(session == null) {
			request.getRequestDispatcher("/WEB-INF/jsp/member/login.jsp?action=myarticles").forward(request, response);
			return;
		}//沒登入 跳轉至login
		
		try { 
			String memberId = session.getAttribute("memberId").toString();
			List<Article> myArticleInfos = new ArticleDAO().getMemberArticleInfos(memberId);
			
			String id = (request.getParameter("id") == null)?myArticleInfos.get(0).getId():(request.getParameter("id"));
			Article article = new ArticleDAO().getArticle(id);
			request.setAttribute("article", article);
			request.setAttribute("myArticleInfos", myArticleInfos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/jsp/member/myarticles.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
