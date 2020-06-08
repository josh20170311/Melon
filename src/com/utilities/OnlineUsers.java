package com.utilities;


import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class OnlineUsers implements HttpSessionListener {
	
	public static int count;

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("session created");
		OnlineUsers.count++;
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("session destroyed");
		OnlineUsers.count--;
	}

}
