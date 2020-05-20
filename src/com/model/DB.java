package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.*;
import java.util.Date;

public class DB {

	private String username = "root";
	private String password = "1234";
	private String dbName = "myproject";
	private String url = "jdbc:mysql://localhost:3306/" + dbName
			+ "?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	private String driver = "com.mysql.cj.jdbc.Driver";

	ArrayList<Product> list = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	ArrayList<Article> titleList = new ArrayList<>();

	private Connection con;

	private void dbConnect() {

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

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

	public void addArticle(Article article) throws SQLException {
		dbConnect();
		String sql = "Insert into article(" + "articleTitle," + "articleContent," + "articleUploadTime,"
				+ "articleAuthorId," + "articleProductId" + ") values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, article.getTitle());
		st.setString(2, article.getContent());
		st.setObject(3, article.getUploadTime());
		st.setInt(4, article.getAuthorId());
		st.setInt(5, article.getProductId());

		st.executeUpdate();
		dbClose();
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

	public ArrayList<Product> fetch() throws SQLException {
		dbConnect();
		String sql = "Select * from product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String category = rs.getString("category");
			String price = rs.getString("price");
			String featured = rs.getString("featured");
			String image = rs.getString("image");

			Product p = new Product();
			p.setCategory(category);
			p.setFeatured(featured);
			p.setId(id);
			p.setImage(image);
			p.setName(name);
			p.setPrice(price);
			list.add(p);
			p = null;

		}

		dbClose();
		return list;
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

	/**
	 * get article informations List but not includes article content
	 * 
	 * @return ArrayList<Article>
	 * @throws SQLException
	 */
	public ArrayList<Article> fetchArticleInfos() throws SQLException {
		dbConnect();

		String sql = "Select articleId, articleTitle, articleUploadTime, articleProductId, articleAuthorId from article;";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		System.out.println();
		System.out.println("in fetch titles");

		while (rs.next()) {
			int id = rs.getInt("articleId");
			int authorid = rs.getInt("articleAuthorId");
			int productid = rs.getInt("articleProductId");
			java.sql.Date d = rs.getDate("articleUploadTime");
			java.sql.Time t = rs.getTime("articleUploadTime");
			String title = rs.getString("articleTitle");

			Article article = new Article();
			article.setTitle(title);
			article.setId(id);
			article.setAuthorId(authorid);
			article.setProductID(productid);
			Date javaDate = new Date(t.getTime());

			article.setUploadTime(javaDate);
			System.out.println(article);

			titleList.add(article);
			t = null;
		}

		dbClose();
		return titleList;
	}

	public void deleteProduct(String id) throws SQLException {

		dbConnect();
		String sql = "Delete from product where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();

	}

	public Product fetchProduct(String id) throws SQLException {
		dbConnect();
		String sql = "select * from product where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		Product p = new Product();
		while (rst.next()) {

			p.setId(rst.getInt("id"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setFeatured(rst.getString("featured"));
			p.setImage(rst.getString("image"));
		}
		dbClose();
		return p;
	}

	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update product set name=?,price=?,category=?,featured=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setInt(5, p.getId());
		st.executeUpdate();
		dbClose();
	}

	public void addProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into product(name,price,category,featured,image) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setString(5, p.getImage());

		st.executeUpdate();
		dbClose();
	}

}
