package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Product;

public class ProductDAO extends DB{
	

	ArrayList<Product> list = new ArrayList<>();

	public void deleteProduct(String id) throws SQLException {

		dbConnect();
		String sql = "Delete from melon.product where Product_ID=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();

	} 

	public Product getProduct(String id) throws SQLException {
		dbConnect();
		String sql = "select * from melon.product where Product_ID=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		Product p ;
		
		rs.next();
		String name 	= rs.getString("Name");
		String model 	= rs.getString("Model_Number");
		int price 	= rs.getInt("Price");
		String manufacturer = rs.getString("Manufacturer");
		String system 	= rs.getString("System");
		String image 	= rs.getString("Image");
		String screen 	= rs.getString("Screen_Size");
		String storage 	= rs.getString("Storage");

		p = new Product(id,name,model,price,manufacturer,system,image,screen,storage);
		
		dbClose();
		return p;
	}

	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update melon.product set Name=?, Model_Number=?, Price=?,"
											+ " Manufacturer=?, product.System=?, Image=?,  "
											+ "Screen_Size=?, Storage=? where Product_ID=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getName());
		st.setString(2, p.getModelNumber());
		st.setObject(3,	p.getPrice());
		st.setString(4, p.getManufacturer());
		st.setString(5, p.getSystem());
		st.setString(6, p.getImage());
		st.setString(7, p.getScreenSize());
		st.setString(8, p.getStorage());
		st.setString(9, p.getId());
		st.executeUpdate();
		System.out.println(st);
		dbClose();
	}

	public void addProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into melon.product values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, p.getId());
		st.setString(2, p.getName());
		st.setString(3, p.getModelNumber());
		st.setObject(4,	p.getPrice());
		st.setString(5, p.getManufacturer());
		st.setString(6, p.getSystem());
		st.setString(7, p.getImage());
		st.setString(8, p.getScreenSize());
		st.setString(9, p.getStorage());

		st.executeUpdate();
		dbClose();
	}
	public ArrayList<Product> fetchProduct() throws SQLException {
		dbConnect();
		String sql = "Select * from melon.product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			String id 		= rs.getString("Product_ID");
			String name 	= rs.getString("Name");
			String model 	= rs.getString("Model_Number");
			int price 	= rs.getInt("Price");
			String manufacturer = rs.getString("Manufacturer");
			String system 	= rs.getString("System");
			String image 	= rs.getString("Image");
			String screen 	= rs.getString("Screen_Size");
			String storage 	= rs.getString("Storage");

			Product p = new Product(id,name,model,price,manufacturer,system,image,screen,storage);
			list.add(p);
			p = null;

		}

		dbClose();
		return list;
	}
	public ArrayList<Product> fetchProduct(String manufacturer) throws SQLException {
		dbConnect();
		String sql = "Select * from melon.product where Manufacturer=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, manufacturer );
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			String id 		= rs.getString("Product_ID");
			String name 	= rs.getString("Name");
			String model 	= rs.getString("Model_Number");
			int    price 	= rs.getInt("Price");
			manufacturer 	= rs.getString("Manufacturer");
			String system 	= rs.getString("System");
			String image 	= rs.getString("Image");
			String screen 	= rs.getString("Screen_Size");
			String storage 	= rs.getString("Storage");

			Product p = new Product(id,name,model,price,manufacturer,system,image,screen,storage);
			list.add(p);
			p = null;

		}

		dbClose();
		return list;
	}

	public ArrayList<String> getManufList() {
		ArrayList<String> list = new ArrayList<String>();
		try {
			dbConnect();
			String sql = "SELECT distinct Manufacturer FROM melon.product order by Manufacturer  ;";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				list.add( rs.getString("Manufacturer")) ;
			}
	
			dbClose();
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
