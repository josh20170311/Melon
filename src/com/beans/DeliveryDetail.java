package com.beans;

public class DeliveryDetail {
	private int amount;
	private String id;
	private String detailId;
	private int price;
	private String productId;
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
	public String getDetailId() {
		return detailId;
	}
	public void setDetailId(String detailId) {
		this.detailId = detailId;
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
		return "DeliveryDetail [amount=" + amount + ", id=" + id + ", detailId=" + detailId + ", price=" + price
				+ ", productId=" + productId + "]";
	}
}
