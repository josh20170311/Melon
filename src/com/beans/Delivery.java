package com.beans;

import java.util.Date;
public class Delivery {
	private String id;
	private Date date;
	private int totalPrice;
	private String progress;
	private String logisticId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}


	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getLogisticId() {
		return logisticId;
	}
	public void setLogisticId(String logisticId) {
		this.logisticId = logisticId;
	}
	@Override
	public String toString() {
		return "Delivery [id=" + id + ", date=" + date + ", totalPrice=" + totalPrice + ", progress=" + progress
				+ ", logisticId=" + logisticId + "]";
	}

}
