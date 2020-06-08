package com.utilities;

import com.beans.Member;

public class test {
	public void main(String args[]) {
		GmailService g = new GmailService("josh2013.880922.fit", "fit@12345678");

    	Member member = new Member();
    	member.setEmail("josh2013.880922@gmail.com");
    	member.setPassword("12345678");
    	g.validationLink(member);
	}
}
