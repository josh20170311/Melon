package com.beans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Product implements Comparable<Product> {

	public Product(String id, String name, String modelNumber, int price, String manufacturer, String system,
			String image, String screenSize, String storage) {
		this.id = id;
		this.name = name;
		this.modelNumber = modelNumber;
		this.price = price;
		this.manufacturer = manufacturer;
		this.system = system;
		this.image = image;
		this.screenSize = screenSize;
		this.storage = storage;
	}

	public Product() { 
		this.id = "";
		this.name = "";
		this.modelNumber = "";
		this.price = 0;
		this.manufacturer = "";
		this.system = "";
		this.image = "";
		this.screenSize = "";
		this.storage = "";
	}
	
	private String id; 
	private String name;
	private String modelNumber;
	private int price;
	private String manufacturer;
	private String system;
	private String image;
	private String screenSize;
	private String storage;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getModelNumber() {
		return modelNumber;
	}

	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}

	 

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(String screenSize) {
		this.screenSize = screenSize;
	}

	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", modelNumber=" + modelNumber + ", price=" + price
				+ ", manufacturer=" + manufacturer + ", system=" + system + ", image=" + image + ", screenSize="
				+ screenSize + ", storage=" + storage + "]";
	}

	


	

	

	public static ArrayList<Product> lowtohigh(ArrayList<Product> list) {
		Collections.sort(list);
		return list;
	}

	@Override
	public int compareTo(Product p) {

		return this.price - p.price;
	}

	public static ArrayList<Product> hightolow(ArrayList<Product> list) {
		Collections.sort(list, new Temp());
		return list;
	}

}

	class Temp implements Comparator<Product> {

	@Override
	public int compare(Product o1, Product o2) {
		return o2.getPrice() - o1.getPrice();
	}

}
