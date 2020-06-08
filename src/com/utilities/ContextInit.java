package com.utilities;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.*;


@WebListener
public class ContextInit implements ServletContextListener {

	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext context = sce.getServletContext();
		String username="josh2013.880922.fit@gmail.com";
		String password="fit@12345678";
		context.setAttribute("emailService", new GmailService(username,password));
	}


}
