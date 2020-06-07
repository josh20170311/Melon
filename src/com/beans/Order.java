package com.beans;

public class Order {
	private String deliId;
	private String memberId;
	private String id;
	private int totalPrice;
	public String getDeliId() {
		return deliId;
	}
	public void setDeliId(String deliId) {
		this.deliId = deliId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
		return "Order [deliId=" + deliId + ", memberId=" + memberId + ", id=" + id + ", totalPrice=" + totalPrice + "]";
	}
}
