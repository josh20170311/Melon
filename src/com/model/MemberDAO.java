package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Member;
import com.beans.Product;
import com.utilities.Password;

public class MemberDAO extends DB{

	ArrayList<Member> memberList = new ArrayList<>();

	public void addMember(Member member) throws SQLException {
		dbConnect();
		String sql = "Insert into melon.member(Member_ID, Member_Name, Gender, Address, Phone, Password, Email, Salt) values(?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, member.getId());
		st.setString(2, member.getName());
		st.setString(3, member.getGender()); 
		st.setString(4, member.getAddress());
		st.setString(5, member.getPhone());
		st.setString(6, member.getPassword());
		st.setString(7, member.getEmail());
		st.setString(8, member.getSalt());

		st.executeUpdate();
		dbClose();
	}

	public ArrayList<Member> getMembers() throws SQLException {
		dbConnect();
		String sql = "Select * from melon.member";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			String id 		= rs.getString("Member_ID");
			String name 	= rs.getString("Member_Name");
			String gender 	= rs.getString("Gender");
			String address 	= rs.getString("Address");
			String phone 	= rs.getString("Phone");
			String password = rs.getString("Password");
			String email	= rs.getString("Email");
			String salt = rs.getString("Salt");
			
			Member m = new Member();
			m.setId(id);
			m.setName(name);
			m.setGender(gender);
			m.setAddress(address);
			m.setPhone(phone);
			m.setEmail(email);
			m.setPassword(password);
			m.setSalt(salt);
			memberList.add(m);
			m = null;
		}

		dbClose();
		return memberList;
	}
	
	public boolean checkMember(String id, String rawP) throws SQLException {
		dbConnect();
		int count = 0;
		String hashedP;
		String salt;
		Boolean isCorrect =false;
		
		String sql = "Select * from melon.member where Member_ID = ? ";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, id);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			count = 1;
			hashedP = rs.getString("Password");
			salt = rs.getString("Salt");
			isCorrect = hashedP.equals(Password.getHashedPassword(rawP, salt));
		}

		dbClose();
		if (count == 0 || !isCorrect)
			return false;
		return true;
	}

	public Member getMember(String id) throws SQLException {
		dbConnect();
		Member m = new Member();

		String sql = "SELECT * FROM melon.member where Member_ID = ?;";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		System.out.println();
		System.out.println("in getMember");

		while (rs.next()) {
			m.setId(id);
			m.setName(		rs.getString("Member_Name"));
			m.setGender(	rs.getString("Gender"));
			m.setAddress(	rs.getString("Address"));
			m.setPhone(		rs.getString("Phone"));
			m.setEmail(		rs.getString("Email"));
			m.setPassword(	rs.getString("Password"));
			m.setSalt(		rs.getString("Salt"));
			
			System.out.println(m);
		}
		dbClose();
		return m;
	}
	
	public void verify(String email,String token) {
		try {
			dbConnect();
			String sql = "update melon.member set Verified=true where Email = ? and Password = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,email);
			st.setString(2,token);
			st.executeUpdate();
			
			dbClose();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void resetPassword(String id,String hashedPassword,String salt) {
		try {
			
			dbConnect();
			String sql = "update melon.member set Password=?, Salt=? where Member_ID=?;";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, hashedPassword);
			st.setString(2,	salt);
			st.setString(3, id);
			st.executeUpdate();
			System.out.println(st);
			dbClose();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
