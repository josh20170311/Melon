package com.beans;

import java.util.Date;

public class Article {
	private int id;
	private String title;
	private String content;
	private int authorId;
	private int productId;
	private Date uploadTime;
	
	public Article(String title, String content, Date uploadTime, int authorId, int productId) {
		this.title = title;
		this.content = content;
		this.authorId = authorId;
		this.productId = productId;
		this.uploadTime = uploadTime;
	}
	
	public int getProductId() {
		return productId;
	}
	public void setProductID(int productId) {
		this.productId = productId;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	
}
