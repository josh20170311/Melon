package com.beans;

public class ProductDetail {
	private String productId;
	private String detaiId;
	private String specName;
	private String specValue;
	private String unit;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getDetaiId() {
		return detaiId;
	}
	public void setDetaiId(String detaiId) {
		this.detaiId = detaiId;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public String getSpecValue() {
		return specValue;
	}
	public void setSpecValue(String specValue) {
		this.specValue = specValue;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	@Override
	public String toString() {
		return "ProductDetail [productId=" + productId + ", detaiId=" + detaiId + ", specName=" + specName
				+ ", specValue=" + specValue + ", unit=" + unit + "]";
	}
}
