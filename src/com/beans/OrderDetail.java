package com.beans;

public class OrderDetail {
	private String orderId;
	private String id;
	private String productId;
	private int amount;
	private int price;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "OrderDetail [amount=" + amount + ", id=" + id + ", orderId=" + orderId + ", price=" + price
				+ ", productId=" + productId + "]";
	}
}
