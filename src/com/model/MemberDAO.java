package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Member;

public class MemberDAO extends DB{

	ArrayList<Member> memberList = new ArrayList<>();

	public void addMember(Member member) throws SQLException {
		dbConnect();
		String sql = "Insert into melon.member(Member_ID, Member_Name, Gender, Address, Phone, Password, Email) values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, member.getId());
		st.setString(2, member.getName());
		st.setString(3, member.getGender());
		st.setString(4, member.getAddress());
		st.setString(5, member.getPhone());
		st.setString(6, member.getPassword());
		st.setString(7, member.getEmail());

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
			
			Member m = new Member();
			m.setId(id);
			m.setName(name);
			m.setGender(gender);
			m.setAddress(address);
			m.setPhone(phone);
			m.setEmail(email);
			m.setPassword(password);
			memberList.add(m);
			m = null;
		}

		dbClose();
		return memberList;
	}
	
	public boolean checkMember(String id, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from melon.member where Member_ID = ? and Password = ?";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, id);
		st.setString(2, password);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			count = 1;
		}

		dbClose();
		if (count == 0)
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
			
			System.out.println(m);
		}
		dbClose();
		return m;
	}

}
