package com.beans;

import java.util.Date;
public class SearchRecord {
	private Date time;
	private String memberId;
	private String content;
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "SearchRecord [time=" + time + ", memberId=" + memberId + ", content=" + content + "]";
	}
}
