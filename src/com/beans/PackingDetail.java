package com.beans;

public class PackingDetail {
	private int amount ;
	private String id;
	private String packingId;
	private int price;
	private String productId;
	
	 
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPackingId() {
		return packingId;
	}
	public void setPackingId(String packingId) {
		this.packingId = packingId;
	}
	 
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "PackingDetail [amount=" + amount + ", id=" + id + ", packingId=" + packingId + ", price=" + price
				+ ", productId=" + productId + "]";
	}
}
