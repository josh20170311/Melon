package com.beans;

import java.util.Date;
public class Packing {
	private String logisticId;
	private String memberId;
	private String orderId;
	private Date date;
	private String id;
	private int totalPrice;
	public String getLogisticId() {
		return logisticId;
	}
	public void setLogisticId(String logisticId) {
		this.logisticId = logisticId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	 
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "Packing [logisticId=" + logisticId + ", memberId=" + memberId + ", orderId=" + orderId + ", date="
				+ date + ", id=" + id + ", totalPrice=" + totalPrice + "]";
	}
}
