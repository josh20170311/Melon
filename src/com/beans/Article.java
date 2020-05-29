package com.beans;

import java.util.Date;

public class Article {
	private String id;
	private String memberId;
	private String title;
	private String content;
	private String productId;
	private Boolean audited;
	private Date uploadTime;
	private String memberName;
	private String productName;
	
	
	public Article() {
		this.id = "";
		this.memberId = "";
		this.title = "";
		this.content = "";
		this.productId = "";
		this.audited = false;
		this.uploadTime = new Date(0);
		this.memberName = "";
		this.productName = "";
	}


	public Article(String id, String title, String content, String memberId, String productId, String memberName,
			String productName, Date uploadTime, Boolean audited) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.memberId = memberId;
		this.productId = productId;
		this.memberName = memberName;
		this.productName = productName;
		this.uploadTime = uploadTime;
		this.audited = audited;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
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


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public Date getUploadTime() {
		return uploadTime;
	}


	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}


	public Boolean getAudited() {
		return audited;
	}


	public void setAudited(Boolean audited) {
		this.audited = audited;
	}


	@Override
	public String toString() {
		return "Article [id=" + id + ", memberId=" + memberId + ", title=" + title + ", content=" + content
				+ ", productId=" + productId + ", audited=" + audited + ", uploadTime=" + uploadTime + ", memberName="
				+ memberName + ", productName=" + productName + "]";
	}

	
	public String toInfoString() {
		return "Article [id=" + id + ", memberId=" + memberId + ", title=" + title 
				+ ", productId=" + productId + ", audited=" + audited + ", uploadTime=" + uploadTime  + "]";
	}

}
