package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import com.beans.*;
import com.model.*;

public class OrderDAO extends DB{
	public void sendOrder(String memberId, ArrayList<String> cartList, ArrayList<String> amountList) {
		int total = 0;
		Date date = new Date();
		Long timestamp = date.getTime();
		String deliveryId = "D"+timestamp;
		String orderId = "O"+timestamp;
		final String LOGISTICS_PROVIDER_ID ="LP00000001";
		ArrayList<Product> orderedProducts = new ArrayList<Product>();
		ArrayList<String> detailSql = new ArrayList<String>();

		ArrayList<Product> productList = new ProductDAO().fetchProduct();
		
		/* Table Delivery
		 * Delivery_ID|Date|Total_Price|Progress|LP_ID;
		 *
		 * Table Order
		 * Order_ID|Total_Price|Member_ID|Delivery_ID
		 * 
		 * Table Order_Detail
		 * Order_ID|Detail_ID|Product_ID|Price|Amount
		 */
		
		
		int detailIndex=1;
		int amount = 0;
		int price = 0;
		String temp;
		for(String id :cartList) {
			for(Product product:productList) {
				if(product.getId().equals(id)) {
					amount = Integer.parseInt(amountList.get(detailIndex - 1));
					price = product.getPrice();
					
					orderedProducts.add(product);
					temp = String.format("insert into melon.order_detail value('%s' ,'%s', '%s', %d, %d);",orderId,detailIndex,id, price, amount);
					detailSql.add(temp);
					total += price * amount;
					break;
				}
			}
			detailIndex++;
		}
		
		
		
		try {
			dbConnect();
			
			//Delivery
			String sql = "insert into melon.delivery value(?, ?, ?, ?, ?);";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, deliveryId);
			st.setObject(2, date);
			st.setInt(3, total);
			st.setString(4, "order checking");
			st.setString(5, LOGISTICS_PROVIDER_ID);
			st.execute();
			
			//Order
			String sql2 = "insert into melon.order value(?, ?, ?, ?, ?);";
			PreparedStatement st2 = con.prepareStatement(sql2);
			st2.setString(1, orderId);
			st2.setInt(2, total);
			st2.setString(3, memberId);
			st2.setString(4, deliveryId);
			st2.setObject(5, date);
			st2.execute();
			
			//Order_Detail
			PreparedStatement st3;
			for(String sql3:detailSql) {
				st3 = con.prepareStatement(sql3);
				st3.execute();
			}
			
			dbClose();
			cartList.clear();
			amountList.clear();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void getOrders(String memberId) {
		ArrayList<Order> orderlist = new ArrayList<Order>();
		try {
			dbConnect();
			String sql = "select * from melon.order where Member_ID = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, memberId);
			ResultSet rs =st.executeQuery();
			
			Order o;
			while(rs.next()){
				o = new Order();
				o.setId(rs.getString("Order_ID"));
				o.setDeliId(rs.getString("Delivery_ID"));
				o.setMemberId(memberId);
				o.setTotalPrice(rs.getInt("Total_Price"));
				o.setDate(rs.getDate("Date"));
				orderlist.add(o);
			}
			
			
			dbClose();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
