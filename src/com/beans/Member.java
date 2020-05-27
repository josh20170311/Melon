package com.beans;

import java.util.ArrayList;

public class Member {

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", email=" + email + ", username="  + ", password="
				+ password + ", address=" + address + "]";
	}

	private String id;//會員識別碼 (帳號)
	private String name;//會員姓名
	private String email;//會員電子郵件帳號
	private String gender;//會員性別
	private String password;//會員登入密碼
	private String address;//會員收貨地址
	private String phone;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}	
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Object fetchadd(ArrayList<Member> userList, String id) {
		for (Member u : userList) {
			if (u.getId().equals(id))
				return u.getAddress();
		}
		return "";
	}

	public Object fetchemail(ArrayList<Member> userList, String id) {
		for (Member u : userList) {
			if (u.getId().equals(id))
				return u.getEmail();
		}
		return "";
	}

	public Object fetchname(ArrayList<Member> userList, String id) {
		for (Member u : userList) {
			if (u.getId().equals(id))
				return u.getName();
		}
		return "";
	}

	public Object fetchid(ArrayList<Member> userList, String id) {
		for (Member u : userList) {
			if (u.getId().equals(id))
				return u.getId();
		}
		return "";
	}

}
