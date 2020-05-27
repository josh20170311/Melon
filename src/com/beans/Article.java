package com.beans;

import java.util.Date;

public class Article {
	private int id;
	private String title;
	private String content;
	private String authorId;
	private String authorName;
	private String productName;
	private int productId;
	private Date uploadTime;
	private Boolean Audited;
	
	
	public Boolean getAudited() {
		return Audited;
	}

	public void setAudited(Boolean audited) {
		Audited = audited;
	}

	public Article() {
		this.id = -1;
		this.authorId = null;
		this.title = null;
		this.content = null;
		this.productId = -1;
		this.uploadTime = new Date(0);
		this.authorName = "";
		this.productName = "";
	}

	public Article(String title, String content, Date uploadTime, String authorId, int productId) {
		this.title = title;
		this.content = content;
		this.authorId = authorId;
		this.productId = productId;
		this.uploadTime = uploadTime;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + ", authorId=" + authorId
				+ ", productId=" + productId + ", uploadTime=" + uploadTime + "]";
	}

	public String toInfoString() {
		return "Article Info [id=" + id + ", title=" + title + ", authorId=" + authorId + ", productId=" + productId
				+ ", uploadTime=" + uploadTime + "]";
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
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

	public String getAuthorId() {
		return authorId;
	}

	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}

}
