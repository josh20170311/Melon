package com.beans;


import java.util.Date;
public class AdPlace {
	private String content;
	private String adId;
	private String adName;
	private String companyId;
	private Date placeDate;
	private int placeDays;
	private String id;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public Date getPlaceDate() {
		return placeDate;
	}
	public void setPlaceDate(Date placeDate) {
		this.placeDate = placeDate;
	}
	public int getPlaceDays() {
		return placeDays;
	}
	public void setPlaceDays(int placeDays) {
		this.placeDays = placeDays;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "AdPlace [content=" + content + ", adId=" + adId + ", adName=" + adName + ", companyId=" + companyId
				+ ", placeDate=" + placeDate + ", placeDays=" + placeDays + ", id=" + id + "]";
	}
}
