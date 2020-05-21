package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.User;

public class UserDAO extends DB{

	ArrayList<User> userList = new ArrayList<>();

	public void addUser(User user) throws SQLException {
		dbConnect();
		String sql = "Insert into user(name,email,username,address,password) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getUsername());
		st.setString(4, user.getAddress());
		st.setString(5, user.getPassword());

		st.executeUpdate();
		dbClose();
	}

	public ArrayList<User> fetchUser() throws SQLException {
		dbConnect();
		String sql = "Select * from user";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			String address = rs.getString("address");
			String user = rs.getString("username");
			String email = rs.getString("email");
			String name = rs.getString("name");
			int id = rs.getInt("id");
			String password = rs.getString("password");

			User u = new User();
			u.setAddress(address);
			u.setEmail(email);
			u.setId(id);
			u.setName(name);
			u.setUsername(user);
			u.setPassword(password);
			userList.add(u);
			u = null;

		}

		dbClose();
		return userList;
	}
	
	public boolean checkUser(String username, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from user where username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, username);
		st.setString(2, password);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			count = 1;
		}

		dbClose();
		if (count == 0)
			return false;// �d�L���H �^��false

		return true;// �b���K�X���T �^��true
	}

	public User getUser(int id) throws SQLException {
		dbConnect();
		User u = new User();

		String sql = "SELECT * FROM user where id = ?;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		System.out.println();
		System.out.println("in getUser");

		while (rs.next()) {
			u.setId(id);
			u.setName(rs.getString("name"));
			u.setEmail(rs.getString("email"));
			u.setAddress(rs.getString("address"));
			u.setUsername("username");
			u.setPassword("password");
			System.out.println(u);
		}
		dbClose();
		return u;
	}

}
